

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

        <%
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String numberErr = (String) session.getAttribute("numberErr");
        %>
        
        <div class="platform">
            
            <p class="pagetitle"> Create an IoT Bay Customer Account</p>
            <p class="invalid"><%=(existErr != null ? existErr : "")%> </p>
            <p class="invalid"><%=(passErr != null ? passErr : "")%> </p>
            <p class="invalid"><%=(emailErr != null ? emailErr : "")%></p>
<<<<<<< HEAD
            <p class="invalid"><%=(nameErr != null ? nameErr : "")%></p>
            <p class="invalid"><%=(numberErr != null ? numberErr : "")%></p>
            
            
            <!-- Register Form -->
            <div class="form">
                <form action="RegisterCustomerController" method="post">

                    <label for="email" class="inputlabel">Email address</label><br>
                    <input type="text" id="email" name="email" class="inputfield" required><br>
                    <p class="sublabelinput"> Your email address must include @ and .</p>

                    <label for="password" class="inputlabel">Password</label><br>
                    <input type="password" id="password"  name="password" class="inputfield" required><br>
                    <p class="sublabelinput"> Your password must have at least 5 letters and/or numbers and no spaces</p>

                    <label for="name" class="inputlabel">Full Name</label><br>
                    <input type="text" id="name" placeholder = "" name="name" class="inputfield" required><br>
                    <p class="sublabelinput"> Your name must not include numbers</p>

                    <label for="number" class="inputlabel">Mobile Number</label><br>
                    <input type="text" id="number" placeholder = "" name="number" class="inputfield" required><br>
                    <p class="sublabelinput"> Your mobile number must be 10 digits long</p>            

                    <a href="login.jsp"> <p class="alternateOption"> Login instead </p> </a>
                    <input type="submit" value="Register" class="submitbutton">

                </form>
            </div>
=======
             <p class="invalid"><%=(nameErr != null ? nameErr : "")%></p>
              <p class="invalid"><%=(numberErr != null ? numberErr : "")%></p>
        <div class="form">
            <form action="RegisterCustomerController" method="post">
              

              <label for="email" class="inputlabel">Email address</label><br>
              <input type="text" id="email" name="email" class="inputfield" required><br>
              <p class="sublabelinput"> Your email address must include @ and .</p>
              
              
              <label for="password" class="inputlabel">Password</label><br>
              <input type="password" id="password"  name="password" class="inputfield" required><br>
              <p class="sublabelinput"> Your password must have at least 5 letters and/or numbers and no spaces</p>

              
              
              <label for="name" class="inputlabel">Full Name</label><br>
              <input type="text" id="name" placeholder = "" name="name" class="inputfield" required><br>
              <p class="sublabelinput"> Your name must not include numbers</p>

              
              <label for="number" class="inputlabel">Mobile Number</label><br>
              <input type="text" id="number" placeholder = "" name="number" class="inputfield" required><br>
              <p class="sublabelinput"> Your mobile number must be 10 digits long</p>            
                                    
               <a href="login.jsp"> <p class="alternateOption"> Login instead </p> </a>

               <input type="submit" value="Register" class="submitbutton">


              
            </form>
              
              
              <div> </div>
         </div>
            
            
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
        </div>

    </body>
</html>
