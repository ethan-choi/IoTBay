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
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;
/**
 *
 * @author Ethan Choi
 */



//Purpose of this controller is to obtain the user's current details
public class UserEditServlet extends HttpServlet {

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        ValidatorUserAccessManagement validator = new ValidatorUserAccessManagement();

        //Get current details from session
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String number = request.getParameter("number");

        //Define user variable
        User user = null;

        try {
            // user findUser method to match email/password to db. If a match, store user info in user variable
            user = manager.findUser(email, password);
            if (user != null) {
                //if user is found, send to session
                session.setAttribute("user", user);
                request.getRequestDispatcher("userEdit.jsp").include(request, response);
            } else {
                //if user is not found, send error
                session.setAttribute("existErr", "user does not exist in the database!");
                request.getRequestDispatcher("userEdit.jsp)").include(request, response);
            }
        } catch (SQLException ex) {
        }
        request.getRequestDispatcher("userEdit.jsp").include(request, response);
    }
}
