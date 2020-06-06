<%-- 
    Document   : deviceSearch
    Created on : 04/06/2020, 1:33:11 AM
    Author     : Jackie Lim
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Device Search</title>
    </head>
    <body>
        <% 
            Product product = (Product)session.getAttribute("product");
            
            String success = (String)session.getAttribute("success"); 
            String existErr = (String) session.getAttribute("existErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String typeErr = (String) session.getAttribute("typeErr");
            
            ArrayList<Product> deviceSearching = (ArrayList<Product>) session.getAttribute("deviceSearching"); 
        %>
        
        <div class="header"> .<p class="headertext"> IoT Bay </p>
            <div class="navbar">
                <a href="main.jsp" class="navbarbutton">Main</a>
                <a href="logout.jsp" class="navbarbutton">Logout</a>
            </div>
        </div>
        
        <div class="catalogue">
            <a href="DeviceCatalogue"><p class="standardbutton">Back</p></a> 
            <p class="pagetitle">Search Results</p>
            <span class="invalid"> <%=(existErr != null ? existErr : "")%> </span>
            <div class="form">
                <form action="DeviceSearchServlet" method="get">
                    <label for="name" class="inputlabel">Device Name</label>
                    <input type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" id="name" name="name" class="inputfield">
                    <br>
                    <label for="type" class="inputlabel">Device Type</label>
                    <input type="text" placeholder="<%=(typeErr != null ? typeErr : "Enter type")%>" id="type" name="type" class="inputfield">
                    <br>
                    <input type="hidden" value="Search Again" name="searchagain">
                    <input type="submit" value="Search Again" class="submitbutton" >
                </form>
            </div>
            
            <div>
                <table class="deviceTable">
                    <thead>
                        <th> Product_ID </th>
                        <th> Name </th>
                        <th> Price </th>
                        <th> Manufacturer </th>
                        <th> Type </th>
                        <th> Quantity Available </th>
                    </thead>
                    <c:forEach items="${deviceSearching}" var="dSearching" >
                    <tr>
                        <td><c:out value="${dSearching.product_id}"/></td>
                        <td><c:out value="${dSearching.name}"/></td>
                        <td><c:out value="${dSearching.price}"/></td>
                        <td><c:out value="${dSearching.manufacturer}"/></td>
                        <td><c:out value="${dSearching.type}"/></td>
                        <td><c:out value="${dSearching.quantity}"/></td>
                    </tr>
                </c:forEach>
                </table>
            </div>        
        </div>
    </body>
</html>
