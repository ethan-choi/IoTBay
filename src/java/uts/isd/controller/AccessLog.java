  package uts.isd.controller;

 

  import java.io.IOException;
     import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
     import java.util.logging.Level;
     import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
     import javax.servlet.ServletException;
     import javax.servlet.http.HttpServlet;
     import javax.servlet.http.HttpServletRequest;
     import javax.servlet.http.HttpServletResponse;
     import javax.servlet.http.HttpSession;
     import uts.isd.model.Student;
     import uts.isd.model.accessLog;
     import uts.isd.model.Student;
     import uts.isd.model.dao.DBManager;
     public class AccessLog extends HttpServlet {
   

     @Override   

     protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {    
         
         
         HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");

        
        
  
            ArrayList<Student> students = new ArrayList();
            students.add(new Student ("bob", "bob","bob", "bob", "bob","bob"));
            request.setAttribute("students", students);
            request.getRequestDispatcher("accesslogs.jsp").include(request,response);
                
                
  
     }
     }