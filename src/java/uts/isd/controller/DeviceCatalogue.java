<<<<<<< HEAD:src/java/uts/isd/controller/DeviceCatalogue.java

package uts.isd.controller;

=======
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package IoTBay.controller;

import IoTBay.model.Product;
import IoTBay.model.dao.DBManager;
>>>>>>> parent of ae76793... some device jsps:src/java/uts/isd/controller/CatalogueDevice.java
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
        
        ArrayList<Product> listDevice = null;
        
        ValidatorDevice validator = new ValidatorDevice();
        validator.clear(session);
        
        try {
            listDevice = manager.fetchProducts();
            session.setAttribute("listDevice", listDevice);
            request.getRequestDispatcher("catalogueDevice.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(DeviceCatalogue.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
