<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>


<!-- Purpose of this page is to act as a home page. Direct users to all different features and is first page that loads-->
<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>



    <body>

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

                    <!-- If user is logged in i.e. if email session is not empty, display accocunt and logout buttons-->
                    <!-- If user is not logged in in i.e. if email session is  empty, display login and register buttons-->
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
                            <a href="orderAdd.jsp"> <p class="navBarButton"> Order </p> </a>
                            <a href="orderCart.jsp"> <p class="navBarButton"> Cart </p> </a>
                </form>



            </div>
        </div>


        <div class="platform">
            <p class="pagetitle"> Welcome to IoT Bay </p>
            <form action="DeviceCatalogueServlet">
                <button class="standardbutton" type="submit" value="Open"> Catalogue</button>
            </form>



        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
