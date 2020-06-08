<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.accessLog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!-- Author: Ethan Choi -->


<!-- Purpose of this page is to display account information and provide link to other account actions -->
<html>
    <head>
        <title>Account</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>


    <body>
        <!-- Import variables -->
        <%
            User user = (User) session.getAttribute("user");
            accessLog accesslog = (accessLog) session.getAttribute("accessLog");
        %>


        <!-- Header -->
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
                    <button class="navBarButtoncatalogue" type="submit" name="email" value="${user.email}"> Catalogue </button>
                    <a href="main.jsp"> <p class="navBarButton"> Account </p> </a>
                    <a href="logout.jsp"> <p class="navBarButton"> Log out </p> </a>
                </form>
            </div>
        </div>

        <!-- Content-->
        <div class="platform">
            <p class="pagetitle">Welcome, ${user.name}</p>

            <br>
            <br>
            <br>
            <br>
            <!-- User details table-->
            <table class="maintable">
                <thead>
                <th colspan="2" >Account Information</th>
                </thead>
                <tr>
                    <td>Email</td>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>${user.name}</td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>${user.password}</td>
                </tr>
                <tr>
                    <td>Mobile Number</td>
                    <td>${user.number}</td>
                </tr>
                <tr>
                    <td>Account Type</td>
                    <td>${user.role}</td>
                </tr>

            </table>


            <br>
            <br>
            <br>
            <br>
            <!--Various buttons for different user actions -->
            <table class="maintable">
                <thead>
                <th colspan="2" >Account Management Actions</th>
                </thead>
            </table>
            <form action="AllAccessLogsServlet">
                <a href="UserEditServlet?email='<%= user.getEmail()%>' &password = ' <%= user.getPassword()%>' &name = ' <%= user.getName()%>' &number = ' <%= user.getNumber()%>'"> <p class="standardbutton"> Edit details </p> </a>
                <button type="submit" name="email" value="${user.email}" class="standardbutton">   Access Logs </button>
                <a href="userDelete.jsp"> <p class="standardbutton"> Delete account </p> </a>
                <a href="paymentdetail.jsp"> <p class="standardbutton"> Payment Detail</p> </a>
            </form>
        </div>
    </body> 
</html>

