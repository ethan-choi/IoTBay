
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
/**
 * NOTE: deviceUpdate.jsp uses this servlet
 * FUNCTION OF SERVLET - DeviceEditServlet:-
 * - Able to update a product's detail based on an existing ID
 * - Get the current session with all the parameters from the form --> validation
 * - After validating is successful it will check if the product ID actually exists
 * - If it does, it will update the item's details as well as the fields 
 * -- when being dispatched back to the page
 */
public class DeviceUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        long id = Long.parseLong(request.getParameter("id"));
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
            request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        } else if(!validator.validateName(name)) {
            session.setAttribute("existErr", "Error found, re-enter fields again");
            session.setAttribute("nameErr", "Name format is incorrect");
            request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        } else if(!validator.validatePrice(price)) {
            session.setAttribute("existErr", "Error found, re-enter fields again");
            session.setAttribute("priceErr", "Price format is incorrect");
            request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        } else if(!validator.validateManufacturer(manufacturer)) {
            session.setAttribute("existErr", "Error found, re-enter fields again");
            session.setAttribute("manufacturerErr", "Manufacturer format is incorrect");
            request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        } else if(!validator.validateType(type)) {
            session.setAttribute("existErr", "Error found, re-enter fields again");
            session.setAttribute("typeErr", "Type format is incorrect");
            request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        } else if(!validator.validateQuantity(quantity)) {
            session.setAttribute("existErr", "Error found, re-enter fields again");
            session.setAttribute("quantityErr", "Quantity format is incorrect");
            request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        } else {
            try {
                if (manager.findProductID(id) == null) {
                    session.setAttribute("existErr", "Device ID does not exist");
                    request.getRequestDispatcher("deviceUpdate.jsp").include(request,response);
                } else {
                    Product product = new Product(id, name, Double.parseDouble(price), manufacturer, type, Integer.parseInt(quantity));
                    session.setAttribute("product", product);
                    manager.updateProductID(id, name, Double.parseDouble(price), manufacturer, type, Integer.parseInt(quantity));
                    session.setAttribute("success", "Update was successful");
                    request.getRequestDispatcher("deviceUpdate.jsp").include(request,response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(DeviceUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            //response.sendRedirect("deviceUpdate.jsp");
        }
    }         
}
