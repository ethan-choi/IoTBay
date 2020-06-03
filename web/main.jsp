<%@page import="uts.isd.model.Student"%>
<%@page import="uts.isd.model.accessLog"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Main</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>

        <%
            Student student = (Student) session.getAttribute("student");
            accessLog accesslog = (accessLog) session.getAttribute("accessLog");
        %>
        
        
        <div class="header"> .<p class="headertext"> IoT Bay </p>
        
                <div class="navbar">
        <a href="main.jsp" class="navbarbutton"> Main</a>
        <a href="logout.jsp" class="navbarbutton"> Logout</a>

        </div>
        
        
        </div>            
            <div class="platform">
                <p class="pagetitle">Welcome, ${student.name}</p>
                                
                <table class="maintable">
                <thead>
                    <th colspan="2" >Account Information</th>
                </thead>
                <tr>
                    <td>Email</td>
                    <td>${student.email}</td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>${student.name}</td>
                </tr>
                 <tr>
                    <td>Password</td>
                    <td>${student.password}</td>
                </tr>
                <tr>
                    <td>Mobile Number</td>
                    <td>${student.number}</td>
                </tr>
                <tr>
                    <td>Account Type</td>
                    <td>${student.role}</td>
                </tr>

                </table>
                
                <table class="maintable">
                <thead>
                    <th colspan="2" >Account Management</th>
                </thead>
                </table>
                
<<<<<<< HEAD
                <form action="AllAccessLogsController">
                <a href="EditController?email='<%= student.getEmail() %>' &password = ' <%= student.getPassword()%>'"> <p class="standardbutton"> Edit details </p> </a>
=======

               
             
               <form action="AllAccessLogsController">
               <a href="EditController?email='<%= student.getEmail() %>' &password = ' <%= student.getPassword()%>'"> <p class="standardbutton"> Edit details </p> </a>
>>>>>>> parent of 1eb888a... Device Search Test
                <button type="submit" name="email" value="${student.email}" class="standardbutton">   Access Logs </button>
               <a href="deleteUser.jsp"> <p class="standardbutton"> Delete account </p> </a>

            </form>
        </div>
    </body> 
</html>

