<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>



    <body>
        <div class="header"> .<p class="headertext"> IoT Bay </p>
            <div class="navbar">
                <form action="DeviceCatalogue">
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


        <div class="platform">
            <p class="pagetitle"> Welcome to IoT Bay </p>
            <form action="DeviceCatalogue">
                <button class="standardbutton" type="submit" value="Open"> Catalogue</button>
            </form>



        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>