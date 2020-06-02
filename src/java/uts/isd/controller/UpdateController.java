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

public class UpdateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String number = request.getParameter("number");
        String status = "Active";
        String role = request.getParameter("role");
        Student student = new Student(name, email, password, number, status, role);

        DBManager manager = (DBManager) session.getAttribute("manager");

        try {
            if (student != null) {
                session.setAttribute("student", student);
                manager.updateUser(name, email, password, number, status, role);
                session.setAttribute("updated", "Update was successful");
                request.getRequestDispatcher("edit.jsp").include(request, response);
            } else {
                session.setAttribute("updated", "Update was not successful");
                request.getRequestDispatcher("edit.jsp").include(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EditController.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("edit.jsp");
    }
}
