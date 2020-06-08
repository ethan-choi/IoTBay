
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
 * NOTE: deviceDelete.jsp uses this servlet
 * FUNCTION OF SERVLET - DeviceDeleteServlet:-
 * - Checks if the product's name is valid and exists
 * - If it exists, it will delete it and set the product's session to null
 * -- so the user does not need to remove the deleted item's name from the input field
 */
public class DeviceDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        ValidatorDevice validator = new ValidatorDevice();
        validator.clear(session);
        
        if(validator.checkEmptyName(name)) { // Checks if the field is empty
            session.setAttribute("existErr", "Please enter a name");
            request.getRequestDispatcher("deviceDelete.jsp").include(request, response);
        } else if(!validator.validateName(name)) {
            session.setAttribute("existErr", "Error found, re-enter name again");
            session.setAttribute("nameErr", "Name format is incorrect");
            request.getRequestDispatcher("deviceDelete.jsp").include(request, response);
        } else {
            try {
               if (manager.findProductName(name) == null) {
                   session.setAttribute("existErr", "Device either does not exist or was spelt incorrectly (case sensitive)");
                   request.getRequestDispatcher("deviceDelete.jsp").include(request, response);
               } else {
                   manager.deleteProduct(name);
                   session.setAttribute("product", null);
                   session.setAttribute("success", "Delete was successful");
                   request.getRequestDispatcher("deviceDelete.jsp").include(request, response);
               }
            } catch (SQLException ex) {
                Logger.getLogger(DeviceDeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            //response.sendRedirect("deviceDelete.jsp");
        }  
    }
}
