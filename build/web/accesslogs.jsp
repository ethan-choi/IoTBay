<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.accessLog"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>


<!-- Purpose of this page is to show all access logs for a certain user and give them a search bar to search by date-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Access Logs</title>
    </head>

    <body>
        <!-- Import variables -->
        <%
            User user = (User) session.getAttribute("user");
            String updated = (String) session.getAttribute("updated");
            String existErr = (String) session.getAttribute("existErr");
            String emptyErrUam = (String) session.getAttribute("emptyErrUam");
            ArrayList<accessLog> accesslogsall = (ArrayList<accessLog>) session.getAttribute("accesslogsall");
        %>


        <!-- Header -->
        <div class="header"> .<p class="headertext"> IoT Bay </p>
            <div class="navbar">
                <form action="DeviceCatalogue">
                    <a href="index.jsp"> <p class="navBarButton"> Home </p> </a>
                    <button class="navBarButtoncatalogue" type="submit" value="Open"> Catalogue </button>
                    <a href="main.jsp"> <p class="navBarButton"> Account </p> </a>
                    <a href="logout.jsp"> <p class="navBarButton"> Log out </p> </a>
                </form>
            </div>
        </div>  


        <!--Content -->
        <div class="platform">


            <!--Search access log bar -->
            <p class="pagetitle"> Search for Access Logs</p>
            <p class="invalid"> <%=(existErr != null ? existErr : "")%>  </p>
            <p class="invalid"> <%=(emptyErrUam != null ? emptyErrUam : "")%>  </p>
            
            
            <div class="form">
                <form action="AccessLog">             
                    <label for="email" class="inputlabel">Date</label><br>
                    <input type="text" id="date" name="date" value="" class="inputfield"> <br>
                    <p class="sublabelinput"> The date must be in YYYY-MM-DD format</p>
                    <input type="text" id="email" name="email" value="${user.email}" class="inputfield" readonly hidden> <br>
                    <input type="submit" value="Search" class="submitbutton">
                </form>
                    
                <!--Table to show all access logs for the current user-->
                <p class="pagetitle2"> All access logs for ${user.name} </p>
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
    </body>
</html>
