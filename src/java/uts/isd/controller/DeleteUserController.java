  package uts.isd.controller;

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
     import uts.isd.model.Student;
     import uts.isd.model.dao.DBManager;

     public class DeleteUserController extends HttpServlet {
   

     @Override   

     protected void doGet(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {       
         HttpSession session = request.getSession();
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         String status = "Inactive";

         DBManager manager = (DBManager) session.getAttribute("manager");
         
         Student student = null;
             try {
                 student = manager.findUserEmailOnly(email);
                 if (student != null) {
                    manager.updateUserStatus(email, status);
                    session.setAttribute("student", student);
                    request.getRequestDispatcher("index.jsp").include(request, response);
                 } else {
                     session.setAttribute("existErr", "Student does not exist in Database!");
                     request.getRequestDispatcher("deleteuser.jsp").include(request, response);
                 }
             } catch (SQLException | NullPointerException ex) {
                Logger.getLogger(EditController.class.getName()).log(Level.SEVERE, null, ex);
                     }
             }
         }


      