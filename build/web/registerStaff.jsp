

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
            String accessErr = (String) session.getAttribute("accessErr");
        %>
        
        <div class="platform">
            
            <p class="pagetitle"> Create an IoT Bay Staff Account</p>
            <p class="invalid"><%=(existErr != null ? existErr : "")%> </p>
            <p class="invalid"><%=(passErr != null ? passErr : "")%> </p>
            <p class="invalid"><%=(emailErr != null ? emailErr : "")%></p>
            <p class="invalid"><%=(nameErr != null ? nameErr : "")%></p>
            <p class="invalid"><%=(numberErr != null ? numberErr : "")%></p>
             <p class="invalid"><%=(accessErr != null ? accessErr : "")%></p>
        <div class="form">
            <form action="RegisterStaffController" method="post">
              
              <label for="accesskey" class="inputlabel">Staff access key</label><br>
              <input type="password" id="accesskey" name="accesskey" class="inputfield" required><br>
              <a href="registerCustomer.jsp"> <p class="sublabelinput"> Not a staff member? Click here to register as a customer instead  </p></a>
              
              
              
              <br>
              <br>
              <br>
              <br>
              <hr class="line">
              <br>
              <br>
              <br>
              
              
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
            
            
        </div>

    </body>
</html>
