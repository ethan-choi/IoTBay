
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
import uts.isd.model.dao.DBManager;
import uts.isd.model.Product;

/**
 *
 * @author Jackie Lim
 */

/**
 * NOTE: deviceAdd.jsp uses this servlet
 * FUNCTION OF SERVLET - DeviceAddServlet:-
 * - Gather all parameters from the page
 * - Use the parameters to validate if values cannot be stored into variable types
 * - After validating, checks if device already exists in the database
 * - IF NOT --> add to database
 * - IF SO --> respond with error message
 */


public class DeviceAddServlet extends HttpServlet {

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
            session.setAttribute("existErr", "Please enter all fields");
            request.getRequestDispatcher("deviceAdd.jsp").include(request, response);
        } else if(!validator.validateName(name)) {
            session.setAttribute("existErr", "Error found, re-enter fields again");
            session.setAttribute("nameErr", "Name format is incorrect");
            request.getRequestDispatcher("deviceAdd.jsp").include(request, response);
        } else if(!validator.validatePrice(price)) {
            session.setAttribute("existErr", "Error found, re-enter fields again");
            session.setAttribute("priceErr", "Price format is incorrect");
            request.getRequestDispatcher("deviceAdd.jsp").include(request, response);
        } else if(!validator.validateManufacturer(manufacturer)) {
            session.setAttribute("existErr", "Error found, re-enter fields again");
            session.setAttribute("manufacturerErr", "Manufacturer format is incorrect");
            request.getRequestDispatcher("deviceAdd.jsp").include(request, response);
        } else if(!validator.validateType(type)) {
            session.setAttribute("existErr", "Error found, re-enter fields again");
            session.setAttribute("typeErr", "Type format is incorrect");
            request.getRequestDispatcher("deviceAdd.jsp").include(request, response);
        } else if(!validator.validateQuantity(quantity)) {
            session.setAttribute("existErr", "Error found, re-enter fields again");
            session.setAttribute("quantityErr", "Quantity format is incorrect");
            request.getRequestDispatcher("deviceAdd.jsp").include(request, response);
        } else {
            try {
                Product exist = manager.findProduct(name, type);
                if (exist != null) {
                    session.setAttribute("existErr", "Device already exists");
                    request.getRequestDispatcher("deviceAdd.jsp").include(request,response);
                } else {
                    Product product = new Product(name, Double.parseDouble(price), manufacturer, type, Integer.parseInt(quantity));
                    session.setAttribute("product", product);
                    manager.addProduct(name, Double.parseDouble(price), manufacturer, type, Integer.parseInt(quantity));
                    session.setAttribute("success", "Device was added succesfully");
                    request.getRequestDispatcher("deviceAdd.jsp").include(request,response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(DeviceAddServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            //response.sendRedirect("deviceAdd.jsp");
        }  
    }
}
