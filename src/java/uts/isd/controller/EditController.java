package uts.isd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

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
import uts.isd.model.dao.DBManager;

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
public class EditController extends HttpServlet {

    @Override
=======
//Purpose of this controller is to obtain the user's current details



public class EditController extends HttpServlet {

    @Override
    
<<<<<<< HEAD
>>>>>>> parent of a91034c... User Access Log Management
=======
//Purpose of this controller is to obtain the user's current details



public class EditController extends HttpServlet {

    @Override
    
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DBManager manager = (DBManager) session.getAttribute("manager");
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

        Student student = null;
        try {
            student = manager.findUser(email, password);
            if (student != null) {
                session.setAttribute("student", student);
                request.getRequestDispatcher("edit.jsp").include(request, response);
            } else {
                session.setAttribute("existErr", "Student does not exist in the database!");
                request.getRequestDispatcher("edit.jsp").include(request, response);
=======
//Purpose of this controller is to obtain the user's current details



public class EditController extends HttpServlet {

    @Override
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
        
        
        //Get current email and password from session
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //Define user variable
        User user = null;
        try {
            //Call on findUser method and store result in user variable
            user = manager.findUser(email, password);
            if (user != null) {
                //If a result is found, return user to session
                session.setAttribute("user", user);
                request.getRequestDispatcher("edit.jsp").include(request, response);
            } else {
                //if no result is found, return error
                session.setAttribute("existErr", "User does not exist in the database!");
                request.getRequestDispatcher("edit.jsp)").include(request, response);
>>>>>>> parent of a91034c... User Access Log Management
            }
        } catch (SQLException ex) {
            Logger.getLogger(EditController.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getErrorCode() + " and " + ex.getMessage());
        }
        request.getRequestDispatcher("edit.jsp").include(request, response);
    }
}
