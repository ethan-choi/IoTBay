<%@page import="uts.isd.model.accessLog"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>

<!-- Author: Ethan Choi -->


<!-- Purpose of this page is to displays access log search queries-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Access Logs</title>
    </head>

    <body>
        <%
            ArrayList<accessLog> accesslogs = (ArrayList<accessLog>) session.getAttribute("accesslogs");
            String updated = (String) session.getAttribute("updated");

        %>



        <!--Header-->
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

        <!-- Content-->
        <div class="platform">
            <p class="pagetitle"> Access logs for ${user.name} </p>
            <a href="main.jsp"> <p class="alternateOption"> Cancel </p> </a>
            <a href="allAccessLogs.jsp"> <p class="standardbutton"> Search again </p> </a>
            <br>
            <br>
            <br>
            <br>

            <!--Table to display access log results -->
            <table class="maintable">
                <thead>
                <th> ID </th>
                <th> Date </th>
                <th> Time </th>
                <th> Action </th>
                </thead>
                <c:forEach items="${accesslogs}" var="accesslog" >
                    <tr>
                        <td><c:out value="${accesslog.id}"/></td>
                        <td><c:out value="${accesslog.date}"/></td>
                        <td><c:out value="${accesslog.time}"/></td>
                        <td><c:out value="${accesslog.action}"/> </td>
                    </tr>
                </c:forEach>
            </table>
        </div>


    </body>


</html>
