<%-- 
    Document   : welcome
    Created on : 21/04/2020, 10:18:26 PM
    Author     : ethan
--%>

<%@page import="uts.isd.model.User"%>
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
            User user = (User) session.getAttribute("user");
        %>
        
        
        <div class="header"> .<p class="headertext"> IoT Bay </p>
        
                <div class="navbar">
        <a href="main.jsp" class="navbarbutton"> Main</a>
        <a href="logout.jsp" class="navbarbutton" >Logout</a>
        </div>
        
        
        </div> 

        
        


            
            <div class="platform">
                <p class="pagetitle">This is your Main Page</p>
                <table class="maintable">
                <thead>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>DoB</th>
                </thead>
                <tr>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.password}</td>
                    <td>${user.dob}</td>
                </tr>
                    
                </table>
                
                
            
      
            
        </div>

    </body>
    

</html>

