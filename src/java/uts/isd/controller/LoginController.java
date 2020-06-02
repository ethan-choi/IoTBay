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
import uts.isd.model.accessLog;
import uts.isd.model.Student;
import uts.isd.model.dao.DBManager;

public class LoginController extends HttpServlet {

    @Override

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();

        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        String stringTime = timeFormat.format(date);
        String stringDate = dateFormat.format(date);
        String time = stringTime;
        String action = "Login";

        DBManager manager = (DBManager) session.getAttribute("manager");
        Student student = null;
        validator.clear(session);

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Your email address must include @ and .");
            request.getRequestDispatcher("login.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Your password must have more than 3 letters and/or numbers and no spaces");
            request.getRequestDispatcher("login.jsp").include(request, response);
        } else {
            try {
                student = manager.findUser(email, password);
                if (student != null && student.getStatus().equals("Active")) {
                    session.setAttribute("student", student);
                    request.getRequestDispatcher("main.jsp").include(request, response);
                    manager.addAccessLog(stringDate, time, action, email);
                    accessLog accesslog = new accessLog(stringDate, time, action, email);
                } else {
                    session.setAttribute("existErr", "Invalid email/password combination");
                    request.getRequestDispatcher("login.jsp").include(request, response);
                }
            } catch (SQLException | NullPointerException ex) {
                System.out.println(ex.getMessage() == null ? "User does not exist" : "welcome");
            }
        }
    }
}
