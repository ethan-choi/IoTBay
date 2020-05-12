<%-- 
    Document   : login
    Created on : 21/04/2020, 10:15:33 PM
    Author     : ethan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>

        <div class="header"> .<p class="headertext"> IoT Bay </p></div> 

        
        
        <div class="platform">
            
            <p class="pagetitle"> Register a new account</p>
        <div class="form">
            <form action="welcome.jsp">
              
                
              <label for="name" class="inputlabel">Full name</label><br>
              <input type="text" id="name" name="name" class="inputfield" required><br>  
              
              <label for="email" class="inputlabel">Email address</label><br>
              <input type="text" id="email" name="email" class="inputfield" required><br>
              
              
              <label for="password" class="inputlabel">Password</label><br>
              <input type="password" id="password" name="password" class="inputfield" required><br>
              
              <label for="dob" class="inputlabel">Date of birth</label><br>
              <input type="date" id="password" name="dob" class="inputfield" required><br>
              

              <input type="submit" value="Register" class="submitbutton">
            </form>
         </div>
            
            
        </div>

    </body>
</html>
