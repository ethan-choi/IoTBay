  package uts.isd.controller;

 import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;    
  import java.util.Date;
  
  
import java.text.DateFormat;  
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.Calendar;  


  import java.io.IOException;
     import java.sql.SQLException;
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
     public class CreateAccessLogController extends HttpServlet {
   

         
         
     @Override   

     protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
         
       Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
        String stringDate = dateFormat.format(date);  

         HttpSession session = request.getSession();
         Validator validator = new Validator();

         
         DBManager manager = (DBManager) session.getAttribute("manager");
         Student student = null;
         validator.clear(session);
         
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         
         

         String time = "2:42pm";
         String action = "log in";
        

             try {
                 manager.addAccessLog(stringDate, time, action, email);
                 accessLog accesslog = new accessLog (date, time, action, email);
             
             } catch (SQLException | NullPointerException ex) {
             System.out.println(ex.getMessage() == null ? "User does not exist" : "welcome");
                     }
             }
         }
     