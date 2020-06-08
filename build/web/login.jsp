<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>

<!-- Author: Ethan Choi -->


<!-- Purpose of this page is to allow users to login to IoT Bay-->

<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>


        <!--Import variables -->
        <%
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
            String activateErr = (String) session.getAttribute("activateErr");
            String emptyErrUam = (String) session.getAttribute("emptyErrUam");
        %>


        <!--header -->
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
                    <a href="login.jsp"> <p class="navBarButton"> Log in </p> </a>
                    <a href="registerOption.jsp"> <p class="navBarButton"> Register </p> </a>
                </form>
            </div>
        </div>


        <!-- Content -->
        <div class="platform">
            <p class="pagetitle"> Log in </p>

            <!-- Error messages-->
            <p class="invalid"> <%=(existErr != null ? existErr : "")%>  </p>
            <p class="invalid"><%=(passErr != null ? passErr : "")%> </p>
            <p class="invalid"><%=(emailErr != null ? emailErr : "")%></p>
            <p class="invalid"><%=(activateErr != null ? activateErr : "")%></p>
            <p class="invalid"><%=(emptyErrUam != null ? emptyErrUam : "")%></p>
            <!--Login form -->
            <div class="form">
                <form action="LoginServlet" method="post">
                    <label for="email" class="inputlabel">Email Address</label><br>
                    <input type="text" id="fname"  name="email" class="inputfield" ><br>

                    <label for="password" class="inputlabel">Password</label><br>
                    <input type="password" id="fname" name="password" class="inputfield" ><br>

                    <a href="registerOption.jsp"> <p class="alternateOption"> Register instead </p> </a>
                    <input type="submit" value="Login" class="submitbutton" >

                </form>
            </div>
        </div>
    </body>
</html>
