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



//Purpose of this controller is to allow customers to register a new account
public class RegisterCustomerServlet extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ValidatorUserAccessManagement validator = new ValidatorUserAccessManagement();
        DBManager manager = (DBManager) session.getAttribute("manager");

        //Get email, password, name and number from form
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String number = request.getParameter("number");

        //set account as active and customer
        String role = "Customer";
        String status = "Active";

        //Convert current date/time to seperate date and time string variables
        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        String stringTime = timeFormat.format(date);
        String stringDate = dateFormat.format(date);
        String time = stringTime;
        String action = "Register";



        //validate to ensure that fields have appropriate inputs. If not, return to registerCustomer.jsp and display error
        if (validator.checkEmptyCustomerRegister(email, password, name, number)) {
            session.setAttribute("emptyErrUam", "Please enter all fields");
            request.getRequestDispatcher("registerCustomer.jsp").include(request, response);
        } else if (!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Your email address must include @");
            request.getRequestDispatcher("registerCustomer.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Your password must have at least 5 letters and/or numbers and no spaces");
            request.getRequestDispatcher("registerCustomer.jsp").include(request, response);
        } else if (!validator.validateName(name)) {
            session.setAttribute("UsernameErr", "Your name must not include numbers");
            request.getRequestDispatcher("registerCustomer.jsp").include(request, response);
        } else if (!validator.validateNumber(number)) {
            session.setAttribute("numberErr", "Your mobile number must be 10 digits long");
            request.getRequestDispatcher("registerCustomer.jsp").include(request, response);

            //If inputs are ok
        } else {
            try {

                User exist = manager.findUserEmailOnly(email);
                if (exist != null) {
                    //check to see if email is already associated with an existing IoT account. If so, return user to registerCustomer.jsp
                    session.setAttribute("existErr", "User already has an account");
                    request.getRequestDispatcher("registerCustomer.jsp").include(request, response);
                } else {
                    //if account does not exist, create new account and pass onto session
                    manager.addUser(name, email, password, number, status, role);
                    User user = new User(name, email, password, number, status, role);
                    session.setAttribute("user", user);
                    request.getRequestDispatcher("main.jsp").include(request, response);

                    //create register access log
                    manager.addAccessLog(stringDate, time, action, email);

                }
            } catch (SQLException | NullPointerException ex) {
                Logger.getLogger(RegisterCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        validator.clear(session);
    }
}
