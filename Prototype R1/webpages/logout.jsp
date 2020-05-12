<%-- 
    Document   : login
    Created on : 21/04/2020, 10:15:33 PM
    Author     : ethan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Logout</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <div class="header"> .<p class="headertext"> IoT Bay </p></div> 

        
        
        <div class="platform">
            
            <p class="pagetitle"> You have been logged out</p>
                   <a href="index.jsp">
                        <div class="interfacebutton">
                            <p class="interfacebuttonbuttontext">  OK </p>
                        </div> 
                    </a>

         </div>
            
        
        
        <%
        session.invalidate();
        %>
            
        </div>

    </body>
</html>
