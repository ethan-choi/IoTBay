
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
            session.setAttribute("added", "Please enter all fields");
            request.getRequestDispatcher("deviceAdd.jsp").include(request, response);
        } else if(!validator.validateName(name)) {
            session.setAttribute("added", "");
            session.setAttribute("nameErr", "Error: Name format is incorrect");
            request.getRequestDispatcher("deviceAdd.jsp").include(request, response);
        } else if(!validator.validatePrice(price)) {
            session.setAttribute("added", "");
            session.setAttribute("priceErr", "Error: Price format is incorrect");
            request.getRequestDispatcher("deviceAdd.jsp").include(request, response);
        } else if(!validator.validateManufacturer(manufacturer)) {
            session.setAttribute("added", "");
            session.setAttribute("manufacturerErr", "Error: Manufacturer format is incorrect");
            request.getRequestDispatcher("deviceAdd.jsp").include(request, response);
        } else if(!validator.validateType(type)) {
            session.setAttribute("added", "");
            session.setAttribute("typeErr", "Error: Type format is incorrect");
            request.getRequestDispatcher("deviceAdd.jsp").include(request, response);
        } else if(!validator.validateQuantity(quantity)) {
            session.setAttribute("added", "");
            session.setAttribute("quantityErr", "Error: Quantity format is incorrect");
            request.getRequestDispatcher("deviceAdd.jsp").include(request, response);
        } else {
            try {
                Product exist = manager.findProduct(name, type);
                if (exist != null) {
                    session.setAttribute("added", "Device already exists");
                    request.getRequestDispatcher("deviceAdd.jsp").include(request,response);
                } else {
                    Product product = new Product(name, Double.parseDouble(price), manufacturer, type, Integer.parseInt(quantity));
                    session.setAttribute("product", product);
                    manager.addProduct(name, Double.parseDouble(price), manufacturer, type, Integer.parseInt(quantity));
                    session.setAttribute("added", "Device was added succesfully");
                    request.getRequestDispatcher("deviceAdd.jsp").include(request,response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(DeviceAddServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("deviceAdd.jsp");
        }  
    }
}
