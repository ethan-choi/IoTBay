<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<!-- Author: Ethan Choi -->


<!-- Purpose of this page is to allow users to edit their account details-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Edit Account</title>
    </head>
    <body>

    </body>

    <!--Import variables -->

    <%
        User user = (User) session.getAttribute("user");
        String updated = (String) session.getAttribute("updated");
        String emptyErrUam = (String) session.getAttribute("emptyErrUam");
        String existErr = (String) session.getAttribute("existErr");
        String emailErr = (String) session.getAttribute("emailErr");
        String passErr = (String) session.getAttribute("passErr");
        String UsernameErr = (String) session.getAttribute("UsernameErr");
        String numberErr = (String) session.getAttribute("numberErr");
    %>

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
        <p class="pagetitle"> Edit Account </p>
        <p class="success"> <%=(updated != null ? updated : "")%>  </p>
        <p class="invalid"><%=(existErr != null ? existErr : "")%> </p>
        <p class="invalid"><%=(passErr != null ? passErr : "")%> </p>
        <p class="invalid"><%=(emailErr != null ? emailErr : "")%></p>
        <p class="invalid"><%=(UsernameErr != null ? UsernameErr : "")%></p>
        <p class="invalid"><%=(numberErr != null ? numberErr : "")%></p>
        <p class="invalid"><%=(emptyErrUam != null ? emptyErrUam : "")%></p>            
        <!--Update details form-->
        <div class="form">
            <form action="UserUpdateServlet">
                <input type="hidden" id="email" name="email" value="${user.email}" class="inputfield" readonly> <br>

                <label for="password" class="inputlabel">Password</label><br>
                <input type="text" id="password" name="password" value="${user.password}" class="inputfield" ><br>

                <label for="name" class="inputlabel">Full name</label><br>
                <input type="text" id="name" name="name" value="${user.name}" class="inputfield" ><br>  

                <label for="number" class="inputlabel">Mobile Number</label><br>
                <input type="text" id="number" name="number" class="inputfield" value="${user.number}" ><br>

                <input type="hidden" id="role" name="role" class="inputfield" value="${user.role}" ><br>


                <a href="main.jsp"> <p class="alternateOption"> Cancel </p> </a>
                <input type="submit" value="Update" class="updatebutton">



            </form>
        </div>


    </div>
</html>
