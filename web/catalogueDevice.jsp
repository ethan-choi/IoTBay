<%-- 
    Document   : catalogue
    Created on : 31/05/2020, 1:54:43 PM
    Author     : Jackie Lim
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" %>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Device Catalogue</title>
    </head>
    <body>
        
        <% 
            //Customer customer = (Customer)session.getAttribute("customer");
            Product product = (Product)session.getAttribute("product");
            
            ArrayList<Product> listDevice = (ArrayList<Product>) session.getAttribute("listDevice"); 
                        
            String existErr = (String) session.getAttribute("existErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String typeErr = (String) session.getAttribute("typeErr");
            
        %>
        
        <h1>Device Catalogue</h1>
        <br>
        <a href="addDevice.jsp"> Add Device </a>
        <a href="updateDevice.jsp"> Update Device </a>
        <a href="deleteDevice.jsp"> Delete Device </a>
        <a href="main.jsp">Back to Main</a>
        <br>
        
        <div>
            <p> Search: </p>
            <form action="SearchDeviceServlet" method="get">
                <label for="name">Device Name</label>
                <input type="text" placeholder="enter name" id="name" name="name" >
                <label for="type">Device Type</label>
                <input type="text" placeholder="enter type" id="type" name="type" >
                <input type="submit" value="Search" class="button" >
            </form>
        </div>
        <table>
            <thead>
                <th> Product_ID </th>
                <th> Name </th>
                <th> Price </th>
                <th> Manufacturer </th>
                <th> Type </th>
                <th> Quantity Available </th>
            </thead>
            <c:forEach items="${listDevice}" var="device" >
                <tr>
                    <td><c:out value="${device.product_id}"/></td>
                    <td><c:out value="${device.name}"/></td>
                    <td><c:out value="${device.price}"/></td>
                    <td><c:out value="${device.manufacturer}"/></td>
                    <td><c:out value="${device.type}"/></td>
                    <td><c:out value="${device.quantity}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
