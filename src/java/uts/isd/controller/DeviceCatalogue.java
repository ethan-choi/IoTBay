package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class DeviceCatalogue extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        ArrayList<Product> deviceList = null;
        
        ValidatorDevice validator = new ValidatorDevice();
        validator.clear(session);
        
        try {
            deviceList = manager.fetchProducts();
            session.setAttribute("deviceList", deviceList);
            request.getRequestDispatcher("deviceCatalogue.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DeviceCatalogue.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}