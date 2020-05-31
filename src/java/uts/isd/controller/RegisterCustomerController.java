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

public class RegisterCustomerController extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        String role = "Customer";
        String status = "Active";

        
        
        
                  
       Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
        SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm:ss");
        String stringTime = timeFormat.format(date);  
        String stringDate = dateFormat.format(date);  
         String time = stringTime;
         String action = "Register";
         
         
         
        DBManager manager = (DBManager) session.getAttribute("manager");
        validator.clear(session);

        if (!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Your email address must include @ and .");
            request.getRequestDispatcher("registerCustomer.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Your password must have at least 5 letters and/or numbers and no spaces");
            request.getRequestDispatcher("registerCustomer.jsp").include(request, response);
        } else if (!validator.validateName(name)) {
            session.setAttribute("nameErr", "Your name must not include numbers");
            request.getRequestDispatcher("registerCustomer.jsp").include(request, response);
        } else if (!validator.validateNumber(number)) {
            session.setAttribute("numberErr", "Your mobile number must be 10 digits long");
            request.getRequestDispatcher("registerCustomer.jsp").include(request, response);
        } else {
            try {
                Student exist = manager.findUserEmailOnly(email);
                if (exist != null ) {
                    session.setAttribute("existErr", "User already has an account");
                    request.getRequestDispatcher("registerCustomer.jsp").include(request, response);
                } else {
                    manager.addUser(name, email, password, number, status, role);
                    Student student = new Student(name, email, password, number, status, role);
                    session.setAttribute("student", student);
                    request.getRequestDispatcher("main.jsp").include(request, response);
                   manager.addAccessLog(stringDate, time, action, email);
                 accessLog accesslog = new accessLog (date, time, action, email);
                }

            } catch (SQLException | NullPointerException ex) {
                Logger.getLogger(RegisterCustomerController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}