package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.User;
import uts.isd.model.User;
import uts.isd.model.accessLog;
import uts.isd.model.dao.DBManager;
/**
 *
 * @author Ethan Choi
 */



//Purpose of this controller is to allow staff members to create a new account with the IoT Bay System
public class RegisterStaffServlet extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ValidatorUserAccessManagement validator = new ValidatorUserAccessManagement();
        DBManager manager = (DBManager) session.getAttribute("manager");

        //Get inputs from form
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        String accesskey = request.getParameter("accesskey");
        String status = "Active";
        String role = "Staff";

        //Convert current date/time to seperate date and time string variables
        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        String stringTime = timeFormat.format(date);
        String stringDate = dateFormat.format(date);
        String time = stringTime;
        String action = "Register";

        validator.clear(session);

        if (validator.checkEmptyStaffRegister(accesskey, email, password, name, number)) {
            session.setAttribute("emptyErrUam", "Please enter all fields");
            request.getRequestDispatcher("registerStaff.jsp").include(request, response);

            //Check to see if staff access key is correct and validate that the user is an actual staff member
            //For the purpose of this assignment, it is 123
            //In reality, the key would be more complex and be given to staff members in person by their manager
            //If key is incorrect, deny access and redirect them to registerStaff.jsp
        } else if (!validator.validateAccessKey(accesskey)) {
            session.setAttribute("accessErr", "Invalid staff access key");
            request.getRequestDispatcher("registerStaff.jsp").include(request, response);

            //validate to ensure that fields have appropriate inputs. If not, return to registerCustomer.jsp and display error
        } else if (!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Your email address must include @");
            request.getRequestDispatcher("registerStaff.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Your password must have at least 5 letters and/or numbers and no spaces");
            request.getRequestDispatcher("registerStaff.jsp").include(request, response);
        } else if (!validator.validateName(name)) {
            session.setAttribute("UsernameErr", "Your name must not include numbers");
            request.getRequestDispatcher("registerStaff.jsp").include(request, response);
        } else if (!validator.validateNumber(number)) {
            session.setAttribute("numberErr", "Your mobile number must be 10 digits long");
            request.getRequestDispatcher("registerStaff.jsp").include(request, response);

            //if inputs are valid
        } else {
            try {
                //find user using findUserEmailOnly and store in exist variable
                User exist = manager.findUserEmailOnly(email);
                if (exist != null) {
                    //if user already exists, display error and return to registerStaff.jsp
                    session.setAttribute("existErr", "User already has an account");
                    request.getRequestDispatcher("registerStaff.jsp").include(request, response);
                } else {

                    //if user does not exist, create new user
                    manager.addUser(name, email, password, number, status, role);
                    User user = new User(name, email, password, number, status, role);
                    session.setAttribute("user", user);
                    request.getRequestDispatcher("main.jsp").include(request, response);

                    //create access log to record register action
                    manager.addAccessLog(stringDate, time, action, email);
                }

            } catch (SQLException | NullPointerException ex) {
                Logger.getLogger(RegisterStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
            validator.clear (session);
    }
}
