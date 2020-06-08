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

/**
 * NOTE: deviceCatalogue.jsp & deviceSearch.jsp uses this servlet
 * FUNCTION OF SERVLET - DeviceSearchServlet:-
 * - Checks if user has not filled in the fields --> if so, error message will appear
 * - Checks if user has filled in name ONLY --> if so, check if type is EMPTY and name are VALID for search
 * - Checks if user has filled in type ONLY --> if so, check if name is EMPTY and type are VALID for search
 * - Checks if user has filled in the fields --> if so, check if both are NOT EMPTY & are VALID for search
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
        
        // Search button in deviceCatalogue.jsp --> search
        if (choiceS != null) { 
            // SEARCH BY TYPE
            if (validator.checkEmptyName(name) && !validator.checkEmptyType(type)) {
                if(!validator.validateType(type)) { 
                    session.setAttribute("searchErr", "Error found, enter fields again");
                    session.setAttribute("typeErr", "Type format is incorrect");
                    request.getRequestDispatcher("deviceCatalogue.jsp").include(request, response); 
                } else {
                    try {
                        deviceSearching = manager.findProductTypeList(type);
                        if (manager.checkProductType(type)) {
                            session.setAttribute("deviceSearching", deviceSearching);
                            request.getRequestDispatcher("deviceSearch.jsp").include(request ,response);
                        } else {
                            session.setAttribute("searchErr", "Device type either does not exist or was spelt incorrectly (case sensitive)!");
                            request.getRequestDispatcher("deviceCatalogue.jsp").include(request, response);
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(DeviceSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            // SEARCH BY NAME
            } else if (validator.checkEmptyType(type) && !validator.checkEmptyName(name)) {
                if(!validator.validateName(name)) {
                    session.setAttribute("searchErr", "Error found, enter fields again");
                    session.setAttribute("nameErr", "Name format is incorrect");
                    request.getRequestDispatcher("deviceCatalogue.jsp").include(request, response); 
                } else { 
                    try {
                        deviceSearching = manager.findProductNameList(name);
                        if (manager.checkProductName(name)) {
                            session.setAttribute("deviceSearching", deviceSearching);
                            request.getRequestDispatcher("deviceSearch.jsp").include(request ,response);
                        } else {
                            session.setAttribute("searchErr", "Device name either does not exist or was spelt incorrectly (case sensitive)!");
                            request.getRequestDispatcher("deviceCatalogue.jsp").include(request, response);
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(DeviceSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            } else { // SEARCH BY NAME + TYPE
                if(validator.checkEmpty(name, type)) {
                session.setAttribute("searchErr", "Search by name or type only, or both");
                request.getRequestDispatcher("deviceCatalogue.jsp").include(request, response);
                } else if(!validator.validateName(name)) {
                    session.setAttribute("searchErr", "Error found, enter fields again");
                    session.setAttribute("nameErr", "Name format is incorrect");
                    request.getRequestDispatcher("deviceCatalogue.jsp").include(request, response); 
                } else if(!validator.validateType(type)) {
                    session.setAttribute("searchErr", "Error found, enter fields again");
                    session.setAttribute("typeErr", "Type format is incorrect");
                    request.getRequestDispatcher("deviceCatalogue.jsp").include(request, response); 
                } else {
                    try {
                    deviceSearching = manager.findProductList(name, type);
                        if (manager.checkProduct(name, type)) {
                            session.setAttribute("success", "Device was found!");
                            session.setAttribute("deviceSearching", deviceSearching);
                            request.getRequestDispatcher("deviceSearch.jsp").include(request ,response);
                        } else {
                            session.setAttribute("searchErr", "Device either does not exist or was spelt incorrectly (case sensitive)!");
                            request.getRequestDispatcher("deviceCatalogue.jsp").include(request, response);
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(DeviceSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            } 
        }
        
        // Search button in deviceSearch.jsp --> Search again
        else if (choiceSA != null )  { 
            // SEARCH BY TYPE
            if (validator.checkEmptyName(name) && !validator.checkEmptyType(type)) {
                if(!validator.validateType(type)) {
                    session.setAttribute("searchErr", "Error found, enter fields again");
                    session.setAttribute("typeErr", "Type format is incorrect");
                    request.getRequestDispatcher("deviceSearch.jsp").include(request, response); 
                } else {
                    try {
                        deviceSearching = manager.findProductTypeList(type);
                        if (manager.checkProductType(type)) {
                            session.setAttribute("deviceSearching", deviceSearching);
                            request.getRequestDispatcher("deviceSearch.jsp").include(request ,response);
                        } else {
                            session.setAttribute("searchErr", "Device type either does not exist or was spelt incorrectly (case sensitive)!");
                            request.getRequestDispatcher("deviceSearch.jsp").include(request, response);
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(DeviceSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            // SEARCH BY NAME
            } else if (validator.checkEmptyType(type) && !validator.checkEmptyName(name)) {
                if(!validator.validateName(name)) {
                    session.setAttribute("searchErr", "Error found, enter fields again");
                    session.setAttribute("nameErr", "Name format is incorrect");
                    request.getRequestDispatcher("deviceSearch.jsp").include(request, response); 
                } else { 
                    try {
                        deviceSearching = manager.findProductNameList(name);
                        if (manager.checkProductName(name)) {
                            session.setAttribute("deviceSearching", deviceSearching);
                            request.getRequestDispatcher("deviceSearch.jsp").include(request ,response);
                        } else {
                            session.setAttribute("searchErr", "Device name either does not exist or was spelt incorrectly (case sensitive)!");
                            request.getRequestDispatcher("deviceSearch.jsp").include(request, response);
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(DeviceSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            } else { // SEARCH BY NAME + TYPE
                if(validator.checkEmpty(name, type)) {
                session.setAttribute("searchErr", "Search by name or type only, or both");
                request.getRequestDispatcher("deviceSearch.jsp").include(request, response);
                } else if(!validator.validateName(name)) {
                    session.setAttribute("searchErr", "Error found, enter fields again");
                    session.setAttribute("nameErr", "Name format is incorrect");
                    request.getRequestDispatcher("deviceSearch.jsp").include(request, response); 
                } else if(!validator.validateType(type)) {
                    session.setAttribute("searchErr", "Error found, enter fields again");
                    session.setAttribute("typeErr", "Type format is incorrect");
                    request.getRequestDispatcher("deviceSearch.jsp").include(request, response); 
                } else {
                    try {
                    deviceSearching = manager.findProductList(name, type);
                        if (manager.checkProduct(name, type)) {
                            session.setAttribute("deviceSearching", deviceSearching);
                            session.setAttribute("success", "Device was found!");
                            request.getRequestDispatcher("deviceSearch.jsp").include(request ,response);
                        } else {
                            session.setAttribute("searchErr", "Device either does not exist or was spelt incorrectly (case sensitive)!");
                            request.getRequestDispatcher("deviceSearch.jsp").include(request, response);
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(DeviceSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            } 
        }
    }   
}