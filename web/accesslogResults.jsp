<%@page import="uts.isd.model.accessLog"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Account Page</title>
    </head>

    <body>
    <%
        ArrayList<accessLog> accesslogs = (ArrayList<accessLog>) session.getAttribute("accesslogs");
        String updated = (String) session.getAttribute("updated");

    %>


    
    <!--Header-->
    <div class="header"> .<p class="headertext"> IoT Bay </p>
        <div class="navbar">
            <a href="index.jsp"> <p class="navBarButton"> Home </p> </a>
            <a href="login.jsp"> <p class="navBarButton"> Log in </p> </a>
            <a href="registerOption.jsp"> <p class="navBarButton"> Register </p> </a>
        </div>
    </div>

    <!-- Content-->
    <div class="platform">
        <p class="pagetitle"> Access logs for ${user.name} </p>
        <a href="accesslogs.jsp"> <p class="standardbutton"> Search again </p> </a>
        
        <!--Table to display access log results -->
        <table class="maintable">
            <thead>
            <th> Date </th>
            <th> Time </th>
            <th> Action </th>
            </thead>
            <c:forEach items="${accesslogs}" var="accesslog" >
                <tr>
                    <td><c:out value="${accesslog.date}"/></td>
                    <td><c:out value="${accesslog.time}"/></td>
                    <td><c:out value="${accesslog.action}"/> </td>
                </tr>
            </c:forEach>
        </table>
    </div>
        
        
    </body>
        
        
</html>
