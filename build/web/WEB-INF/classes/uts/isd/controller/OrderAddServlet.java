
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
import uts.isd.model.Orders;

/**
 *
 * @author Jackie Lim
 */
public class OrderAddServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        HttpSession session = request.getSession();        
        
        String product_Id = request.getParameter("product_Id");
        String quantity = request.getParameter("quantity");
        
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        ValidatorOrder validator = new ValidatorOrder();
        validator.clear(session);
    
        if(validator.checkFields(product_Id, quantity)) {    
            session.setAttribute("productIdErr", "Please enter all fields");
            request.getRequestDispatcher("orderAdd.jsp").include(request, response);
        } else if(!validator.validateName(product_Id)) {
            session.setAttribute("productIdErr", "Error found, please try again");
            session.setAttribute("productIdErr", "Name format is incorrect");
            request.getRequestDispatcher("orderAdd.jsp").include(request, response);
        } else if(!validator.validateQuantity(quantity)) {
            session.setAttribute("productIdErr", "Error found, please try again");
            session.setAttribute("quantityErr", "Quantity format is incorrect");
            request.getRequestDispatcher("orderAdd.jsp").include(request, response);
    
            }// catch (SQLException ex) {
                //Logger.getLogger(DeviceAddServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            //response.sendRedirect("deviceAdd.jsp");
        }  
   

