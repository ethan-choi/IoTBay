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
import uts.isd.model.User;
import uts.isd.model.User;
import uts.isd.model.accessLog;
import uts.isd.model.dao.DBManager;
/**
 *
 * @author Ethan Choi
 */



// Purpose of this controller is to set an account as "Inactive", essentially deleting the user from the system
public class UserDeleteServlet extends HttpServlet {

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");

        //Get current email address in the session.
        String email = request.getParameter("email");
        String status = "Inactive";

        //Convert current date/time to seperate date and time string variables
        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        String stringTime = timeFormat.format(date);
        String stringDate = dateFormat.format(date);
        String time = stringTime;
        String action = "Deactivate";

        //Define user
        User user = null;
        try {
            //Call on findUserEmailOnly method and store results in user variable
            user = manager.findUserEmailOnly(email);
            if (user != null) {
                //call on updateUserStatus to find the record by email and set status to "Inactive" as defined prior
                manager.updateUserStatus(email, status);

                //Create delete access log
                manager.addAccessLog(stringDate, time, action, email);

                //Return to session
                session.setAttribute("user", user);
                session.invalidate();
                request.getRequestDispatcher("index.jsp").include(request, response);
            } else {
                session.setAttribute("existErr", "User does not exist in Database!");
                request.getRequestDispatcher("deleteuser.jsp").include(request, response);
            }
        } catch (SQLException | NullPointerException ex) {
            Logger.getLogger(UserEditServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
