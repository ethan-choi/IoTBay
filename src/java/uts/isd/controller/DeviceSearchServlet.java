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
public class DeviceSearchServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        
        String choiceS = request.getParameter("search");
        String choiceSA = request.getParameter("searchagain");
  
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        ArrayList<Product> deviceSearching = null;
        
        ValidatorDevice validator = new ValidatorDevice();
        validator.clear(session);
        
        if (choiceS != null) {
            if(validator.checkEmpty(name, type)) {
            session.setAttribute("existErr", "Please enter all fields");
            request.getRequestDispatcher("deviceCatalogue.jsp").include(request, response);
            } else if(!validator.validateName(name)) {
                session.setAttribute("existErr", "Error found, please try again");
                session.setAttribute("nameErr", "Name format is incorrect");
                request.getRequestDispatcher("deviceCatalogue.jsp").include(request, response);
            } else if(!validator.validateType(type)) {
                session.setAttribute("existErr", "Error found, please try again");
                session.setAttribute("typeErr", "Type format is incorrect");
                request.getRequestDispatcher("deviceCatalogue.jsp").include(request, response);
            } else {
                try {
                    deviceSearching = manager.findProductList(name, type);
                    if (manager.checkProduct(name, type)) {
                        session.setAttribute("deviceSearching", deviceSearching);
                        request.getRequestDispatcher("deviceSearch.jsp").include(request ,response);
                    } else {
                        session.setAttribute("existErr", "Device does not exist");
                        request.getRequestDispatcher("deviceCatalogue.jsp").include(request, response);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(DeviceSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } 
        
        else if (choiceSA !=null )  { 
            if(validator.checkEmpty(name, type)) {
            session.setAttribute("existErr", "Please enter all fields");
            request.getRequestDispatcher("deviceSearch.jsp").include(request, response);
            } else if(!validator.validateName(name)) {
                session.setAttribute("existErr", "Error found, please try again");
                session.setAttribute("nameErr", "Name format is incorrect");
                request.getRequestDispatcher("deviceSearch.jsp").include(request, response);
            } else if(!validator.validateType(type)) {
                session.setAttribute("existErr", "Error found, please try again");
                session.setAttribute("typeErr", "Type format is incorrect");
                request.getRequestDispatcher("deviceSearch.jsp").include(request, response);
            } else {
                try {
                    deviceSearching = manager.findProductList(name, type);
                    if (manager.checkProduct(name, type)) {
                        session.setAttribute("deviceSearching", deviceSearching);
                        request.getRequestDispatcher("deviceSearch.jsp").include(request ,response);
                    } else {
                        session.setAttribute("existErr", "Device does not exist");
                        request.getRequestDispatcher("deviceSearch.jsp").include(request, response);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(DeviceSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }   
    }
    
}

    
