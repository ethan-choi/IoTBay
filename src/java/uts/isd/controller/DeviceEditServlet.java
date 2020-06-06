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
public class DeviceEditServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        /*
        String productID = request.getParameter("id");
       // Long id = Long.parseLong(productID);
        Product product = null;
        
        
        ValidatorDevice validator = new ValidatorDevice();
        validator.clear(session);

        try {
            product = manager.findProductID(productID);
            if (product != null) {
                session.setAttribute("product", product);
                request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
            } else {
                request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DeviceEditServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        //request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        */
    }
}