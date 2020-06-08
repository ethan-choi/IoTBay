/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import uts.isd.model.Product;
import uts.isd.model.dao.DBManager;
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

/**
 *
 * @author Jackie Lim
 */

/**
 * NOTE: deviceCatalogue.jsp uses this servlet
 * -- ALSO SENDS THE USER TO EDIT / UPDATE BASED ON PARAMETERS TAKEN FROM THE FORM
 * FUNCTION OF SERVLET - DeviceEditServlet:-
 * - Purpose is to check whether if the next page should have pre-filled forms or not
 * - This is based on product's ID and if it exists or not
 * - If it exists, it will set the product's session with attributes based on the item that is found
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
        
        if (ePage != null) { // Goes to edit / update page
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
        } else if (dPage != null) { // Goes to delete page
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
