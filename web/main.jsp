<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.accessLog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- Purpose of this page is to display account information and provide link to other account actions -->
<html>
    <head>
        <title>Main</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>


    <body>
        <!-- Import variables -->
        <%
            User user = (User) session.getAttribute("user");
            accessLog accesslog = (accessLog) session.getAttribute("accessLog");
        %>


        <!-- Header -->
        <div class="header"> .<p class="headertext"> IoT Bay </p>

            <div class="navbar">
                <a href="index.jsp"> <p class="navBarButton"> Home </p> </a>
                <a href="login.jsp"> <p class="navBarButton"> Log in </p> </a>
                <a href="registerOption.jsp"> <p class="navBarButton"> Register </p> </a>
                <a href="logout.jsp"> <p class="navBarButton"> Log Out </p> </a>
            </div>
        </div>   



        <!-- Content-->
        <div class="platform">
            <p class="pagetitle">Welcome, ${user.name}</p>


            <!-- User details table-->
            <table class="maintable">
                <thead>
                <th colspan="2" >Account Information</th>
                </thead>
                <tr>
                    <td>Email</td>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>${user.name}</td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>${user.password}</td>
                </tr>
                <tr>
                    <td>Mobile Number</td>
                    <td>${user.number}</td>
                </tr>
                <tr>
                    <td>Account Type</td>
                    <td>${user.role}</td>
                </tr>

            </table>


            <!--Various buttons for different user actions -->
            <table class="maintable">
                <thead>
                <th colspan="2" >Account Management</th>
                </thead>
            </table>
            <form action="AllAccessLogsController">
                <a href="EditController?email='<%= user.getEmail()%>' &password = ' <%= user.getPassword()%>' &name = ' <%= user.getName()%>' &number = ' <%= user.getNumber()%>'"> <p class="standardbutton"> Edit details </p> </a>
                <button type="submit" name="email" value="${user.email}" class="standardbutton">   Access Logs </button>
                <a href="deleteUser.jsp"> <p class="standardbutton"> Delete account </p> </a>
            </form>
                
            <form action="DeviceCatalogue">
                    <button class="standardbutton" type="submit" name="email" value="${student.email}">Catalogue</button>
            </form>
                
        </div>
    </body> 
</html>

