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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management


//Purpose of this controller is to allow users to login to the system
=======
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
public class LoginController extends HttpServlet {

    @Override

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();

<<<<<<< HEAD
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        //Get email and password from session
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        
        //Convert current date/time to seperate date and time string variables
=======
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        String stringTime = timeFormat.format(date);
        String stringDate = dateFormat.format(date);
        String time = stringTime;
        String action = "Login";

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management

        User user = null;
        validator.clear(session);

        

        //validate to ensure that email address and password fields have appropriate inputs. If not, return to login.jsp and display error
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
        DBManager manager = (DBManager) session.getAttribute("manager");
        Student student = null;
        validator.clear(session);

        String email = request.getParameter("email");
        String password = request.getParameter("password");

>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
        if (!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Your email address must include @ and .");
            request.getRequestDispatcher("login.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Your password must have more than 3 letters and/or numbers and no spaces");
            request.getRequestDispatcher("login.jsp").include(request, response);
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
            
        //if inputs are valid:
=======
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
=======
            
        //if inputs are valid:
>>>>>>> parent of a91034c... User Access Log Management
=======
            
        //if inputs are valid:
>>>>>>> parent of a91034c... User Access Log Management
=======
            
        //if inputs are valid:
>>>>>>> parent of a91034c... User Access Log Management
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
