<%-- 
    Document   : deviceSearch
    Created on : 04/06/2020, 1:33:11 AM
    Author     : Jackie Lim
--%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
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
    <%-- Search result page which allows the user to search again or go back to the catalogue--%> 
    <body>
        <% 
            ArrayList<Product> deviceSearching = (ArrayList<Product>) session.getAttribute("deviceSearching"); 
            Product product = (Product)session.getAttribute("product");
            
            String success = (String)session.getAttribute("success"); 
            String searchErr = (String) session.getAttribute("searchErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String typeErr = (String) session.getAttribute("typeErr");
        %>
        <%-- Header --%>
        <div class="header"> <div class="wrapper"> <p class="headertext"> IoT Bay </p> <img class="logo" src="logo.png" alt="logo"> 
                <c:set var="val" value="${user.email}"/>
                <c:choose> 
                    <c:when test="${val != null}">
                        <p class="loginstatus"> You are logged in as ${user.email} </p>
                    </c:when>
                    <c:otherwise>
                        <p class="loginstatus"> You are not logged in </p>
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="navbar">
                <form action="DeviceCatalogueServlet">
                    <a href="index.jsp"> <p class="navBarButton"> Home </p> </a>
                    <button class="navBarButtoncatalogue" type="submit" value="Open"> Catalogue </button>
                    <c:set var="val" value="${user.email}"/>
                    <c:choose> 
                        <c:when test="${val != null}">
                            <a href="main.jsp"> <p class="navBarButton"> Account </p> </a>
                            <a href="logout.jsp"> <p class="navBarButton"> Log out </p> </a>
                        </c:when>
                        <c:otherwise>
                            <a href="login.jsp"> <p class="navBarButton"> Log in </p> </a>
                            <a href="registerOption.jsp"> <p class="navBarButton"> Register </p> </a>
                        </c:otherwise>
                    </c:choose>
                </form>
            </div>
        </div>
        <%-- Content --%>
        <%-- Search bar displayed again if the user would like to look for another item --%>
        <div class="catalogue">
            <a href="DeviceCatalogueServlet"><p class="standardbutton">Back</p></a> 
            <p class="pagetitle">Search Results</p>
            <span class="invalid"> <%=(searchErr != null ? searchErr : "")%> </span>
            <span class="success"> <%=(success != null ? success : "")%> </span>
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
            <%-- The table that will display item found --%>
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
