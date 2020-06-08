<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<!-- Author: Ethan Choi -->



<!-- Purpose of this page is to allow users to choose if they want to register a staff or customer account-->
<html>
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>


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
            <form action="DeviceCatalogue">
                <a href="index.jsp"> <p class="navBarButton"> Home </p> </a>
                <button class="navBarButtoncatalogue" type="submit" value="Open"> Catalogue </button>
                <a href="login.jsp"> <p class="navBarButton"> Log in </p> </a>
                <a href="registerOption.jsp"> <p class="navBarButton"> Register </p> </a>
            </form>
        </div>
    </div>

    <!-- Content -->
    <div class="platform">
        <p class="pagetitle"> Register as a </p>
        <!-- Option to register as a staff or customer -->
        <a href="registerCustomer.jsp"> <p class="standardbutton"> Customer </p> </a>
        <a href="registerStaff.jsp"> <p class="standardbutton"> Staff </p> </a>

    </div>
    <jsp:include page="/ConnServlet" flush="true"/>
</body>
</html>