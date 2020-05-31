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
        <title>Welcome</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>

        <div class="header"> .<p class="headertext"> IoT Bay </p>
        
        <div class="navbar">
        <a href="main.jsp" class="navbarbutton"> Main</a>
        <a href="logout.jsp" class="navbarbutton" >Logout</a>
        </div>
        
        </div> 

        
        
        <div class="platform">
            
            <%
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
            %>
            

            
            
            <div class="interfaceplatform">
            <p class="pagetitle">You are logged in as  <span style="color: #5A8EF6;"><%= email %></span> </p>
            <p class="regulartext">Name:  <span style="color: #5A8EF6;"><%= name %></span> </p>
            <p class="regulartext">Email:  <span style="color: #5A8EF6;"><%= email %></span> </p>
            <p class="regulartext">Password:  <span style="color: #5A8EF6;"><%= password %></span> </p>
            <p class="regulartext">DoB:  <span style="color: #5A8EF6;"><%= dob %></span> </p>
            
            </div>
            

            
        </div>

            <%
                User user = new User(name, email, password, dob);
                session.setAttribute("user", user);
            %>
            


    </body>
    

</html>

