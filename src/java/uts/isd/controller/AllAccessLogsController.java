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
import uts.isd.model.Student;
import uts.isd.model.accessLog;
import uts.isd.model.dao.DBManager;

public class AllAccessLogsController extends HttpServlet {

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String date = request.getParameter("date");
        String password = request.getParameter("password");
        String status = "Inactive";

        DBManager manager = (DBManager) session.getAttribute("manager");

        ArrayList<accessLog> accesslogsall = null;

        Validator validator = new Validator();
        validator.clear(session);

            try {
                accesslogsall = manager.listAccessLogsUser(email);
                session.setAttribute("accesslogsall", accesslogsall);
                request.getRequestDispatcher("accesslogs.jsp").include(request, response);
                
            } catch (SQLException | NullPointerException ex) {

            }

        }
    }

