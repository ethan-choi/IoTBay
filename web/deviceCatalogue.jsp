<%-- 
    Document   : catalogue
    Created on : 31/05/2020, 1:54:43 PM
    Author     : Jackie Lim
--%>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@page import="uts.isd.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Product"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Device Catalogue</title>
    </head>
    <%-- The catalogue page that can be accessed by all users 
        - Contains search box and lists all available items
        - Staff only features are add, delete and update
    --%>
    <body>    
        <%
            User user = (User) session.getAttribute("user");
            String role = (String) session.getAttribute("role");
            Product product = (Product) session.getAttribute("product");

            ArrayList<Product> deviceList = (ArrayList<Product>) session.getAttribute("deviceList");

            String searchErr = (String) session.getAttribute("searchErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String typeErr = (String) session.getAttribute("typeErr");

        %>

        <%-- The header --%>
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
        <%-- A search bar allowing the user to either search by name or type only or both at the same time --%>
        <div class="catalogue"> 
            <p class="pagetitle">Device Catalogue</p>
            <p class="dSubheading"> Search: </p>
            <span class="invalid"> <%=(searchErr != null ? searchErr : "")%> </span>
            <div class="form">
                <form action="DeviceSearchServlet" method="get">
                    <label for="name" class="inputlabel">Device Name</label>
                    <input type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" id="name" name="name" class="inputfield">
                    <br>
                    <label for="type" class="inputlabel">Device Type</label>
                    <input type="text" placeholder="<%=(typeErr != null ? typeErr : "Enter type")%>" id="type" name="type" class="inputfield">
                    <br>
                    <input type="hidden" value="Search" name="search">
                    <input type="submit" value="Search" class="submitbutton" >
                </form>
            </div>
            <%-- Features that only staff are allow to use. Checks if user's role is a staff --%>
            <c:choose>
                <c:when test="${role == 'Staff'}">
                    <div class="deviceManagement">
                        <ul>
                            <li>
                                <form action="DeviceResetController" method="get">
                                    <input type="hidden" value="Add" name="add">
                                    <input type="submit" value="Add" class="formbutton" >
                                </form>
                            </li>
                            <li>
                                <form action="DeviceResetController" method="get">
                                    <input type="hidden" value="Edit" name="edit">
                                    <input type="submit" value="Edit" class="formbutton" >
                                </form> 
                            </li>
                            <li>
                                <form action="DeviceResetController" method="get">
                                    <input type="hidden" value="Delete" name="delete">
                                    <input type="submit" value="Delete" class="formbutton" >
                                </form> 
                            </li>
                        </ul>
                    </div>  
                </c:when>
            </c:choose>
            <%-- The list of items avaiable to the user --%>        
            <table class="deviceTable">
                <thead>
                <th> Product_ID </th>
                <th> Name </th>
                <th> Price </th>
                <th> Manufacturer </th>
                <th> Type </th>
                <th> Quantity Available </th>
                    <c:choose>
                        <c:when test="${role == 'Staff'}">
                        <th> Options </th>
                        </c:when>
                    </c:choose>
                </thead>
                <c:forEach items="${deviceList}" var="dList" >
                    <tr>
                        <td><c:out value="${dList.product_id}"/></td>
                        <td><c:out value="${dList.name}"/></td>
                        <td style="text-align: center"><c:out value="${dList.price}"/></td>
                        <td><c:out value="${dList.manufacturer}"/></td>
                        <td style="text-align: center"><c:out value="${dList.type}"/></td>
                        <td style="text-align: center"><c:out value="${dList.quantity}"/></td>
                        <c:choose> 
                            <c:when test="${role == 'Staff'}"> <%-- Staff only buttons that appear next to the item when the "role" is a staff--%> 
                                <td> 
                                    <form action="DeviceEditServlet">
                                        <input type="hidden" value='${dList.product_id}' name="id">
                                        <input style="float: left" type="submit" value="Edit" name="edit" class="deviceOptions" >
                                    </form>
                                    <form action="DeviceEditServlet">
                                        <input type="hidden" value='${dList.product_id}' name="id">
                                        <input style="float: right" type="submit" value="Delete" name="delete" class="deviceOptions" >
                                    </form>
                                </td>
                            </c:when>
                        </c:choose>
                    </tr>
                </c:forEach>
            </table>
        </div>         
    </body>
</html>
