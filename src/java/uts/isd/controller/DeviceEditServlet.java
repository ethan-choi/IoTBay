/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
        
        String ePage = request.getParameter("edit");
        String dPage = request.getParameter("delete");
        String productID = request.getParameter("id");
        int id = Integer.parseInt(productID);
        Product product = null;
        
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        ValidatorDevice validator = new ValidatorDevice();
        validator.clear(session);
        
        if (ePage != null) {
            try {
                product = manager.findProductID(id);
                if (product != null) {
                    session.setAttribute("product", product);
                    request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
                } else {
                    request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(DeviceEditServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (dPage != null) {
            try {
                product = manager.findProductID(id);
                if (product != null) {
                    session.setAttribute("product", product);
                    request.getRequestDispatcher("deviceDelete.jsp").include(request, response);
                } else {
                    request.getRequestDispatcher("deviceDelete.jsp").include(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(DeviceEditServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
