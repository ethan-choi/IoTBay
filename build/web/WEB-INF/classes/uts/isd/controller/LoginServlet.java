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
import uts.isd.model.accessLog;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;
/**
 *
 * @author Ethan Choi
 */



//Purpose of this controller is to allow users to login to the system
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ValidatorUserAccessManagement validator = new ValidatorUserAccessManagement();

        DBManager manager = (DBManager) session.getAttribute("manager");

        //Get email and password from session
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //Convert current date/time to seperate date and time string variables
        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        String stringTime = timeFormat.format(date);
        String stringDate = dateFormat.format(date);
        String time = stringTime;
        String action = "Login";

        User user = null;
        validator.clear(session);

        //validate to ensure that email address and password fields have appropriate inputs. If not, return to login.jsp and display error
        if (validator.checkEmptyLogin(email, password)) {
            session.setAttribute("emptyErrUam", "Please enter all fields");
            request.getRequestDispatcher("login.jsp").include(request, response);
        } else if (!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Your email address must include @ and .");
            request.getRequestDispatcher("login.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Your password must have more than 3 letters and/or numbers and no spaces");
            request.getRequestDispatcher("login.jsp").include(request, response);

            //if inputs are valid:
        } else {
            try {
                //call on findUser method and store in user variable
                user = manager.findUser(email, password);
                //Pass on user's details and allow entry to main page if the user is active(not deleted)
                if (user != null && user.getStatus().equals("Active")) {
                    session.setAttribute("user", user);
                    request.getRequestDispatcher("main.jsp").include(request, response);
                    //create login access log
                    manager.addAccessLog(stringDate, time, action, email);

                } else {
                    //return error and redirect to login.jsp if email does not match password in database
                    session.setAttribute("existErr", "Invalid email/password combination");
                    request.getRequestDispatcher("login.jsp").include(request, response);
                }
            } catch (SQLException | NullPointerException ex) {
                System.out.println(ex.getMessage() == null ? "User does not exist" : "welcome");
            }
        }
        validator.clear(session);
    }
}
