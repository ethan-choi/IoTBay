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
import uts.isd.model.Student;
import uts.isd.model.accessLog;
import uts.isd.model.dao.DBManager;

public class AccessLog extends HttpServlet {

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String date = request.getParameter("date");
        String password = request.getParameter("password");
        String status = "Inactive";

        DBManager manager = (DBManager) session.getAttribute("manager");

        ArrayList<accessLog> accesslogs = null;

        Validator validator = new Validator();
        validator.clear(session);

        if (!validator.validateDate(date)) {
            session.setAttribute("existErr", "The date must be in YYYY-MM-DD format");
            request.getRequestDispatcher("accesslogs.jsp").include(request, response);

        } else {
            try {
                accesslogs = manager.findAccessLog(email, date);
                if (manager.checkAccessLogs(email, date) == false) {
                    session.setAttribute("existErr", "No records on this date");
                    request.getRequestDispatcher("accesslogs.jsp").include(request, response);
<<<<<<< HEAD
                } else if (accesslogs != null) {
=======
                }
                else if (accesslogs != null) {
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
                    session.setAttribute("accesslogs", accesslogs);
                    request.getRequestDispatcher("accesslogResults.jsp").include(request, response);
                }
            } catch (SQLException | NullPointerException ex) {

            }

        }
    }
}
