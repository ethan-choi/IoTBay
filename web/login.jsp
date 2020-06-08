<%-- 
    Document   : login
    Created on : 21/04/2020, 10:15:33 PM
    Author     : ethan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>

        <div class="header"> .<p class="headertext"> IoT Bay </p></div> 

        
        
        <div class="platform">
            
            <p class="pagetitle"> Log in to your account</p>
        <div class="form">
            <form action="welcome.jsp">
              <label for="email" class="inputlabel">Email Address</label><br>
              <input type="text" id="fname" name="email" class="inputfield" required><br>
              
              
              
              <label for="password" class="inputlabel">Password</label><br>
              <input type="password" id="fname" name="password" class="inputfield" required><br>
              
              

                <input type="submit" value="Login" class="submitbutton">
            </form>
         </div>
            
            
        </div>

    </body>
</html>
