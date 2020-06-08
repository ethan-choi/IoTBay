<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>

<!-- Author: Ethan Choi -->


<!-- Purpose of this page is to allow users to delete their account -->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Delete Account</title>
    </head>
    <body>

        <!-- Import variables-->
        <%
            User user = (User) session.getAttribute("user");
            String updated = (String) session.getAttribute("updated");
        %>


        <!-- Header-->
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
                    <a href="main.jsp"> <p class="navBarButton"> Account </p> </a>
                    <a href="logout.jsp"> <p class="navBarButton"> Log out </p> </a>
                </form>
            </div>
        </div>


        <!--Content -->
        <div class="platform">
            <p class="pagetitle"> Delete Account </p>
            <div class="form">
                <form action="UserDeleteServlet">
                    <input type="hidden" id="email" name="email" value="${user.email}" class="inputfield" readonly> <br>
                    <p class="bodytext"> Are you sure you want to delete your account? </p>
                    <p class="bodytext"> All orders associated with this account will be cancelled. Your personal information, delivery address information and payment information will be deleted. </p>
                    <p class="bodytext"> Once you delete your account, you won't be able to retrieve it later. </p>

                    <a href="main.jsp"> <p class="alternateOption"> Cancel </p> </a>

                    <input type="submit" value="Delete" class="deletebutton">
                </form>
            </div>
        </div>
    </body>
</html>
