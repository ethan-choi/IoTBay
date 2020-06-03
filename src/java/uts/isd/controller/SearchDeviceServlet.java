
package uts.isd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Product;
import uts.isd.model.dao.DBManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Jackie Lim
 */
public class SearchDeviceServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String name = request.getParameter("name");
        String type = request.getParameter("type");      
        
        DBManager manager = (DBManager) session.getAttribute("Manager");
        
        ArrayList<Product> listDevice = null;
        
        ProductValidator validator = new ProductValidator();
        validator.clear(session);
        
        if(validator.checkEmpty(name, type)) {
            session.setAttribute("existErr", "Please enter all fields");
            request.getRequestDispatcher("catalogueDevice.jsp").include(request, response);
        } else if(!validator.validateName(name)) {
            session.setAttribute("existErr", "");
            session.setAttribute("nameErr", "Error: Name format is incorrect");
            request.getRequestDispatcher("catalogueDevice.jsp").include(request, response);
        } else if(!validator.validateType(type)) {
            session.setAttribute("existErr", "");
            session.setAttribute("typeErr", "Error: Type format is incorrect");
            request.getRequestDispatcher("catalogueDevice.jsp").include(request, response);
        } else {
            try {
                listDevice = manager.findProductList(name, type);
                if (manager.checkProduct(name, type) == false) {
                    session.setAttribute("existErr", "No device exists");
                    request.getRequestDispatcher("catalogueDevice.jsp").include(request, response);
                } else if (listDevice != null) {
                    session.setAttribute("searchDevice", listDevice );
                    request.getRequestDispatcher("searchDevice.jsp").include(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(SearchDeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("searchDevice.jsp");
        }
        
    }
    
}
