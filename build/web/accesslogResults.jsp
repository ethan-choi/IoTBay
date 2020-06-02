

<%@page import="uts.isd.model.accessLog"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.Student"%>
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

    </body>

    <%
        ArrayList<accessLog> accesslogs = (ArrayList<accessLog>) session.getAttribute("accesslogs");
        String updated = (String) session.getAttribute("updated");

    %>


    <div class="header"> .<p class="headertext"> IoT Bay </p>

        <div class="navbar">
            <a href="main.jsp" class="navbarbutton"> Main</a>
            <a href="logout.jsp" class="navbarbutton"> Logout</a>

        </div>
    </div>


    <div class="platform">



        <p class="pagetitle"> Access logs for ${student.name} </p>
                
                
        <a href="accesslogs.jsp"> <p class="standardbutton"> Search again </p> </a>

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
</html>
