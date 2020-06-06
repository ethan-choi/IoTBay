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

        
        
        <%
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
            String activateErr = (String) session.getAttribute("activateErr");
<<<<<<< HEAD

            String number = "hi";
=======
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
        %>
        
        
        <div class="header"> .<p class="headertext"> IoT Bay </p></div> 

        
        
        <div class="platform">
            
            <p class="pagetitle"> Log in </p>
            <p class="invalid"> <%=(existErr != null ? existErr : "") %>  </p>
            <p class="invalid"><%=(passErr != null ? passErr : "")%> </p>
            <p class="invalid"><%=(emailErr != null ? emailErr : "")%></p>
            <p class="invalid"><%=(activateErr != null ? activateErr : "")%></p>
<<<<<<< HEAD

            <!--Login form -->
            <div class="form">
                <form action="LoginController" method="post">
                    <label for="email" class="inputlabel">Email Address</label><br>
                    <input type="text" id="fname"  name="email" class="inputfield" required><br>

                    <label for="password" class="inputlabel">Password</label><br>
                    <input type="password" id="fname" name="password" class="inputfield" required   ><br>

                    <a href="registerOption.jsp"> <p class="alternateOption"> Register instead </p> </a>
                    <input type="submit" value="Login" class="submitbutton" >

                </form>
            </div>
=======
        <div class="form">
            <form action="LoginController" method="post">
              <label for="email" class="inputlabel">Email Address</label><br>
              <input type="text" id="fname"  name="email" class="inputfield" required><br>
              
              
              
              <label for="password" class="inputlabel">Password</label><br>
              <input type="password" id="fname" name="password" class="inputfield" required   ><br>
              
              
               <a href="registerOption.jsp"> <p class="alternateOption"> Register instead </p> </a>
               <input type="submit" value="Login" class="submitbutton" >


            </form>
         </div>
            
            
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
        </div>

    </body>
</html>
