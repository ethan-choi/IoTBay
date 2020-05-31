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
     import uts.isd.model.dao.DBManager;

     public class LogoutController extends HttpServlet {
   

     @Override   

     protected void doGet(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {       
         HttpSession session = request.getSession();
         
         
         String email = request.getParameter("email");
        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm:ss");
        String stringTime = timeFormat.format(date);
        String stringDate = dateFormat.format(date);
        String time = stringTime;
        String action = "Logout";
        
        
         DBManager manager = (DBManager) session.getAttribute("manager");
         
         Student student = null;
             try {
                    manager.addAccessLog(stringDate, time, action, email);
                    session.setAttribute("student", student);
                    request.getRequestDispatcher("index.jsp").include(request, response);

             } catch (SQLException | NullPointerException ex) {
                Logger.getLogger(LogoutController.class.getName()).log(Level.SEVERE, null, ex);
                     }
             
             
             session.invalidate();
             request.getRequestDispatcher("index.jsp").include(request, response);
             
             }
         }


      