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
public class DeviceUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String manufacturer = request.getParameter("manufacturer");
        String type = request.getParameter("type");
        String quantity = request.getParameter("quantity");
        
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        ValidatorDevice validator = new ValidatorDevice();
        validator.clear(session);

        if(validator.checkFields(name, type, price, manufacturer, quantity)) {    
            session.setAttribute("updated", "Please enter all fields");
            request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        } else if(!validator.validateName(name)) {
            session.setAttribute("updated", "");
            session.setAttribute("nameErr", "Error: Name format is incorrect");
            request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        } else if(!validator.validatePrice(price)) {
            session.setAttribute("updated", "");
            session.setAttribute("priceErr", "Error: Price format is incorrect");
            request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        } else if(!validator.validateManufacturer(manufacturer)) {
            session.setAttribute("updated", "");
            session.setAttribute("manufacturerErr", "Error: Manufacturer format is incorrect");
            request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        } else if(!validator.validateType(type)) {
            session.setAttribute("updated", "");
            session.setAttribute("typeErr", "Error: Type format is incorrect");
            request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        } else if(!validator.validateQuantity(quantity)) {
            session.setAttribute("updated", "");
            session.setAttribute("quantityErr", "Error: Quantity format is incorrect");
            request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        } else {
            try {
                Product exist = manager.findProduct(name, type);
                if (exist == null) {
                    session.setAttribute("updated", "Device does not exist");
                    request.getRequestDispatcher("deviceUpdate.jsp").include(request,response);
                } else {
                    Product product = new Product(name, Double.parseDouble(price), manufacturer, type, Integer.parseInt(quantity));
                    session.setAttribute("product", product);
                    manager.updateProduct(name, Double.parseDouble(price), manufacturer, type, Integer.parseInt(quantity));
                    session.setAttribute("updated", "Update was successful");
                    request.getRequestDispatcher("deviceUpdate.jsp").include(request,response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(DeviceUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("deviceUpdate.jsp");
        }
    }         

}
