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
<<<<<<< HEAD
import uts.isd.model.User;
import uts.isd.model.User;
=======
import uts.isd.model.Student;
import uts.isd.model.Student;
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
import uts.isd.model.dao.DBManager;

public class UpdateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
<<<<<<< HEAD
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        //Get data from fields
=======
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String number = request.getParameter("number");
        String status = "Active";
        String role = request.getParameter("role");
<<<<<<< HEAD
        
        //Store new data in a variable
        User student = new User(name, email, password, number, status, role);

        try {
            if (student != null) {
                //Update information using updateUser, return success message and redirect to edit.jsp
=======
        Student student = new Student(name, email, password, number, status, role);

        DBManager manager = (DBManager) session.getAttribute("manager");

        try {
            if (student != null) {
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
                session.setAttribute("student", student);
                manager.updateUser(name, email, password, number, status, role);
                session.setAttribute("updated", "Update was successful");
                request.getRequestDispatcher("edit.jsp").include(request, response);
            } else {
<<<<<<< HEAD
                //if not successful, return error message and redirect to edit.jsp
=======
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
                session.setAttribute("updated", "Update was not successful");
                request.getRequestDispatcher("edit.jsp").include(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EditController.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("edit.jsp");
    }
}
