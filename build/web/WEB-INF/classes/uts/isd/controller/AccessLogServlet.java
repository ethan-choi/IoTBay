package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.User;
import uts.isd.model.accessLog;
import uts.isd.model.dao.DBManager;
/**
 *
 * @author Ethan Choi
 */



//Purpose of this controller is the search for access logs according to a date
public class AccessLogServlet extends HttpServlet {

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ValidatorUserAccessManagement validator = new ValidatorUserAccessManagement();

        //Get current email from session and date from form
        String email = request.getParameter("email");
        String date = request.getParameter("date");

        DBManager manager = (DBManager) session.getAttribute("manager");

        ArrayList<accessLog> accesslogs = null;

        validator.clear(session);

        //Check to see if search query fields are empty
        if (validator.checkEmptyAccessLog(date)) {
            session.setAttribute("emptyErrUam", "Please enter all fields");
            request.getRequestDispatcher("allAccessLogs.jsp").include(request, response);
        } else if (!validator.validateDate(date)) {
            //Error if date is not in YYYY-MM-DD format
            session.setAttribute("existErr", "The date must be in YYYY-MM-DD format");
            request.getRequestDispatcher("allAccessLogs.jsp").include(request, response);

        } else {
            try {
                //Find access logs in db and store in accesslogs list
                accesslogs = manager.findAccessLog(email, date);
                //Error if no dates exist on the specified date
                if (manager.checkAccessLogs(email, date) == false) {
                    session.setAttribute("existErr", "No records on this date");
                    request.getRequestDispatcher("allAccessLogs.jsp").include(request, response);
                    //Return access logs list to session
                } else if (accesslogs != null) {
                    session.setAttribute("accesslogs", accesslogs);
                    request.getRequestDispatcher("accessLogResults.jsp").include(request, response);
                }
            } catch (SQLException | NullPointerException ex) {

            }

        }
        validator.clear(session);
    }
}
