/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
 * 
 * NOTE:- Used to clear error texts from catalogueDevice.jsp
 * -> Basically used for transitioning into add, edit, delete without
 * --> sending any values and reseting the session of 'product'
 * 
 */
public class DeviceResetController extends HttpServlet {
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        String add = request.getParameter("add");
        String edit = request.getParameter("edit");
        String delete = request.getParameter("delete");
        
        Product product = null;
        
        DBManager manager = (DBManager) session.getAttribute("manager");

        ValidatorDevice validator = new ValidatorDevice();
        validator.clear(session);
        
        if(add != null) {
            session.setAttribute("product", product);
            request.getRequestDispatcher("deviceAdd.jsp").include(request, response);
        } else if(edit != null) {
            session.setAttribute("product", product);
            request.getRequestDispatcher("deviceUpdate.jsp").include(request, response);
        } else if(delete != null) {
            session.setAttribute("product", product);
            request.getRequestDispatcher("deviceDelete.jsp").include(request, response);
        }
    }
}
