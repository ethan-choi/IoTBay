
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.accessLog"%>
<%@page import="uts.isd.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        Student student = (Student) session.getAttribute("student");
        String updated = (String) session.getAttribute("updated");
        String existErr = (String) session.getAttribute("existErr");
        ArrayList<accessLog> accesslogsall = (ArrayList<accessLog>) session.getAttribute("accesslogsall");
    %>


    <div class="header"> .<p class="headertext"> IoT Bay </p>

        <div class="navbar">
            <a href="main.jsp" class="navbarbutton"> Main</a>
            <a href="logout.jsp" class="navbarbutton"> Logout</a>

        </div>
    </div>


    <div class="platform">




        <p class="pagetitle"> Search </p>
        <p class="invalid"> <%=(existErr != null ? existErr : "")%>  </p>
        <div class="form">
            <form action="AccessLog">


                

                
                <label for="email" class="inputlabel">Date</label><br>
                <input type="text" id="date" name="date" value="" class="inputfield" required> <br>
                <p class="sublabelinput"> The date must be in YYYY-MM-DD format</p>


                <label for="email" class="inputlabel">Email address</label><br>
                <input type="text" id="email" name="email" value="${student.email}" class="inputfield" required readonly> <br>


                <input type="submit" value="Search" class="submitbutton">
      </form>
        <p class="pagetitle"> All access logs for ${student.name} </p>
             <table class="maintable">
            <thead>
            <th> Date </th>
            <th> Time </th>
            <th> Action </th>
            </thead>
            <c:forEach items="${accesslogsall}" var="accesslog" >
                <tr>
                    <td><c:out value="${accesslog.date}"/></td>
                    <td><c:out value="${accesslog.time}"/></td>
                    <td><c:out value="${accesslog.action}"/> </td>
                </tr>
            </c:forEach>
        </table>



      



        </div>


    </div>
</html>
