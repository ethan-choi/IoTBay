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
import uts.isd.model.Student;
import uts.isd.model.Student;
import uts.isd.model.accessLog;
import uts.isd.model.dao.DBManager;

public class RegisterStaffController extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of a91034c... User Access Log Management
        DBManager manager = (DBManager) session.getAttribute("manager");

        //Get inputs from form
=======
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        String accesskey = request.getParameter("accesskey");
        String status = "Active";
        String role = "Staff";

        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        String stringTime = timeFormat.format(date);
        String stringDate = dateFormat.format(date);
        String time = stringTime;
        String action = "Register";

        DBManager manager = (DBManager) session.getAttribute("manager");
        validator.clear(session);

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of a91034c... User Access Log Management
        //Check to see if staff access key is correct and validate that the user is an actual staff member
        //For the purpose of this assignment, it is 123
        //In reality, the key would be more complex and be given to staff members in person by their manager
        //If key is incorrect, deny access and redirect them to registerStaff.jsp
<<<<<<< HEAD
=======
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
=======
>>>>>>> parent of a91034c... User Access Log Management
        if (!validator.validateAccessKey(accesskey)) {
            session.setAttribute("accessErr", "Invalid staff access key");
            request.getRequestDispatcher("registerStaff.jsp").include(request, response);
        } else if (!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Your email address must include @ and .");
            request.getRequestDispatcher("registerStaff.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Your password must have at least 5 letters and/or numbers and no spaces");
            request.getRequestDispatcher("registerStaff.jsp").include(request, response);
        } else if (!validator.validateName(name)) {
            session.setAttribute("nameErr", "Your name must not include numbers");
            request.getRequestDispatcher("registerStaff.jsp").include(request, response);
        } else if (!validator.validateNumber(number)) {
            session.setAttribute("numberErr", "Your mobile number must be 10 digits long");
            request.getRequestDispatcher("registerStaff.jsp").include(request, response);
        } else {
            try {
                Student exist = manager.findUserEmailOnly(email);
                if (exist != null) {
                    session.setAttribute("existErr", "User already has an account");
                    request.getRequestDispatcher("registerStaff.jsp").include(request, response);
                } else {
                    manager.addUser(name, email, password, number, status, role);
                    Student student = new Student(name, email, password, number, status, role);
                    session.setAttribute("student", student);
                    request.getRequestDispatcher("main.jsp").include(request, response);
                    manager.addAccessLog(stringDate, time, action, email);
                    accessLog accesslog = new accessLog(stringDate, time, action, email);
                }

            } catch (SQLException | NullPointerException ex) {
                Logger.getLogger(RegisterStaffController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
