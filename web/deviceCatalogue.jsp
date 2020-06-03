<%-- 
    Document   : catalogue
    Created on : 31/05/2020, 1:54:43 PM
    Author     : Jackie Lim
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Product"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Device Catalogue</title>
    </head>
    <body>
        
        <% 
           // Customer customer = (Customer)session.getAttribute("customer");
            Product product = (Product)session.getAttribute("product");
            
            ArrayList<Product> deviceList= (ArrayList<Product>) session.getAttribute("deviceList"); 
                        
            String existErr = (String) session.getAttribute("existErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String typeErr = (String) session.getAttribute("typeErr");
            
        %>
        
        <h1>Device Catalogue</h1>
        <br>
        <a href="deviceAdd.jsp"> Add Device </a>
        <a href="deviceUpdate.jsp"> Update Device </a>
        <a href="deviceDelete.jsp"> Delete Device </a>
        <a href="sDevice.jsp"> TEMP - SEARCH Device - TEMP</a>
        <a href="index.jsp">Back to Main</a>
        <br>
        
        <div>
            <p> Search: </p>
            <form action="DeviceSearchServlet" method="get">
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
            <c:forEach items="${deviceList}" var="dList" >
                <tr>
                    <td><c:out value="${dList.product_id}"/></td>
                    <td><c:out value="${dList.name}"/></td>
                    <td><c:out value="${dList.price}"/></td>
                    <td><c:out value="${dList.manufacturer}"/></td>
                    <td><c:out value="${dList.type}"/></td>
                    <td><c:out value="${dList.quantity}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
