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



//Purpose of this servlet is to obtain all access logs for a specific account which is identified by email



public class AllAccessLogsServlet extends HttpServlet {

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        
        //get current session email address
        String email = request.getParameter("email");


        //create Array List to store access logs results
        ArrayList<accessLog> accesslogsall = null;

        try {
            //call on listAccessLogsUser method and store results in Array List
            accesslogsall = manager.listAccessLogsUser(email);
            
            //send results to session
            session.setAttribute("accesslogsall", accesslogsall);
            request.getRequestDispatcher("allAccessLogs.jsp").include(request, response);

        } catch (SQLException | NullPointerException ex) {
        }
    }
}
