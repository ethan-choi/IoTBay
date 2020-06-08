<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.accessLog"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>

<!-- Author: Ethan Choi -->


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
                <form action="AccessLogServlet">             
                    <label for="email" class="inputlabel">Date</label><br>
                    <input type="text" id="date" name="date" value="" class="inputfield"> <br>
                    <p class="sublabelinput"> The date must be in YYYY-MM-DD format</p>
                    <input type="text" id="email" name="email" value="${user.email}" class="inputfield" readonly hidden> <br>
                    <a href="main.jsp"> <p class="alternateOption"> Cancel </p> </a>
                    <input type="submit" value="Search" class="submitbutton">
                </form>

                <!--Table to show all access logs for the current user-->
                <p class="pagetitle2"> All access logs for ${user.name} </p>
                <table class="maintable">
                    <thead>
                    <th> ID </th>
                    <th> Date </th>
                    <th> Time </th>
                    <th> Action </th>
                    </thead>
                    <c:forEach items="${accesslogsall}" var="accesslog" >
                        <tr>
                            <td><c:out value="${accesslog.id}"/></td>
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
