<%-- 
    Document   : deviceDelete
    Created on : 01/06/2020, 3:14:36 PM
    Author     : Jackie Lim
--%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Delete Device</title>
    </head>
    <%-- A page for staffs only that will allow them to delete an item from the database permanently  --%>
    <body>
        <% 
            Product product = (Product)session.getAttribute("product");
            
            String success = (String)session.getAttribute("success");
            String existErr = (String) session.getAttribute("existErr");
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
        <div class="platform">
            <p class="pagetitle">Delete Device</p>
            
            <br>
            <span class="invalid"> <%=(existErr != null ? existErr : "")%> </span>
            <span class="success"> <%=(success != null ? success : "")%> </span>
            <%-- Delete device form based on the item's name--%>
            <div class="form">
                <form method="post" action="DeviceDeleteServlet" >
                    <table class="maintable">  
                        <tr>
                            <td><label class="inputlabel" for="name">Device Name</label></td>
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" value="${product.name}" id="name" name="name"></td>
                        </tr>
                    </table>
                        
                    <a href="DeviceCatalogueServlet"><p class="alternateOption">Cancel</p></a>  
                    
                    <input class="submitbutton" type="submit" value="Delete">

                </form>
            </div>
        </div>
    </body>
</html>
