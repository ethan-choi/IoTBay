
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
<<<<<<< HEAD
        <!-- Import variables -->
        <%
            User user = (User) session.getAttribute("user");
            String updated = (String) session.getAttribute("updated");
            String existErr = (String) session.getAttribute("existErr");
            ArrayList<accessLog> accesslogsall = (ArrayList<accessLog>) session.getAttribute("accesslogsall");
        %>

        
        <!-- Header -->
        <div class="header">.
            <p class="headertext"> IoT Bay </p>
            <div class="navbar">
                <a href="index.jsp"> <p class="navBarButton"> Home </p> </a>
                <a href="login.jsp"> <p class="navBarButton"> Log in </p> </a>
                <a href="registerOption.jsp"> <p class="navBarButton"> Register </p> </a>
            </div>
=======

    </body>

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    <%
        Student student = (Student) session.getAttribute("student");
        String updated = (String) session.getAttribute("updated");
        String existErr = (String) session.getAttribute("existErr");
        ArrayList<accessLog> accesslogsall = (ArrayList<accessLog>) session.getAttribute("accesslogsall");
    %>

    <div class="header">.
        <p class="headertext"> IoT Bay </p>
        <div class="navbar">
            <a href="main.jsp" class="navbarbutton"> Main</a>
            <a href="logout.jsp" class="navbarbutton"> Logout</a>
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
        </div>
    </div>

<<<<<<< HEAD
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
        
        <!--Content -->
        <div class="platform">

            
            <!--Search access log bar -->
            <p class="pagetitle"> Search </p>
            <p class="invalid"> <%=(existErr != null ? existErr : "")%>  </p>
            <div class="form">
                <form action="AccessLog">             
                    <label for="email" class="inputlabel">Date</label><br>
                    <input type="text" id="date" name="date" value="" class="inputfield" required> <br>
                    <p class="sublabelinput"> The date must be in YYYY-MM-DD format</p>
                    <label for="email" class="inputlabel">Email address</label><br>
                    <input type="text" id="email" name="email" value="${user.email}" class="inputfield" required readonly> <br>
                    <input type="submit" value="Search" class="submitbutton">
                </form>
                    
                    
             <!--Table to show all access logs for the current user-->
                <p class="pagetitle"> All access logs for ${user.name} </p>
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
=======
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
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
</html>
