/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import uts.isd.model.Product;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author Jackie Lim
 */
public class DeviceDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ValidatorDevice validator = new ValidatorDevice();
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        DBManager manager = (DBManager) session.getAttribute("manager");
        validator.clear(session);
        
        if(validator.checkEmpty(name, type)) {
            session.setAttribute("deleted", "Please enter a device name.");
            request.getRequestDispatcher("deviceDelete.jsp").include(request, response);
        } else if(!validator.validateName(name)) {
            session.setAttribute("deleted", "");
            session.setAttribute("nameErr", "Error: name format is incorrect");
            request.getRequestDispatcher("deviceDelete.jsp").include(request, response);
        } else {
            try {
               Product exist = manager.findProduct(name, type);
               if (exist == null) {
                   session.setAttribute("deleted", "Device does not exist");
                   request.getRequestDispatcher("deviceDelete.jsp.jsp").include(request, response);
               } else {
                   session.setAttribute("product", exist);
                   manager.deleteProduct(name);
                   session.setAttribute("deleted", "Delete was successful");
                   request.getRequestDispatcher("deviceDelete.jsp").include(request, response);
               }
            } catch (SQLException ex) {
                Logger.getLogger(DeviceDeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("deviceDelete.jsp");
        }  
    }
}
