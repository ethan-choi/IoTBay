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
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;
/**
 *
 * @author Ethan Choi
 */



//Purpose of this controller is to update users' information
public class UserUpdateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ValidatorUserAccessManagement validator = new ValidatorUserAccessManagement();
        DBManager manager = (DBManager) session.getAttribute("manager");

        //Get variables from session
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String number = request.getParameter("number");
        String status = "Active";
        String role = request.getParameter("role");

        //Store new data in a variable
        User user = new User(name, email, password, number, status, role);
        
                validator.clear(session);

        //Validators to check if fields or empty or using incorrect format
        if (validator.checkEmptyEdit(email, password, name, number)) {
            session.setAttribute("emptyErrUam", "Please enter all fields");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
            validator.clear(session);
        } else if (!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Your email address must include @");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
            validator.clear(session);
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Your password must have at least 5 letters and/or numbers and no spaces");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
            validator.clear(session);
        } else if (!validator.validateName(name)) {
            session.setAttribute("UsernameErr", "Your name must not include numbers");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
            validator.clear(session);
        } else if (!validator.validateNumber(number)) {
            session.setAttribute("numberErr", "Your mobile number must be 10 digits long");
            request.getRequestDispatcher("userEdit.jsp").include(request, response);
            validator.clear(session);

            //if inputs are ok
        } else {
            try {
                if (user != null) {
                    //update user and send sucess message
                    session.setAttribute("user", user);
                    manager.updateUser(name, email, password, number, status, role);
                    session.setAttribute("updated", "Update was successful");
                    request.getRequestDispatcher("userEdit.jsp").include(request, response);
                    
                } else {
                    //send error message if unsuccessful
                    session.setAttribute("updated", "Update was not successful");
                    request.getRequestDispatcher("userEdit.jsp").include(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserEditServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("userEdit.jsp");
        }

    }
}
