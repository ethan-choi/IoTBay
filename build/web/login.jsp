<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- Purpose of this page is to allow users to login to IoT Bay-->

<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>


        <!--Import variables -->
        <%
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
            String activateErr = (String) session.getAttribute("activateErr");

            String number = "hi";
        %>


        <!--header -->
        <div class="header"> .<p class="headertext"> IoT Bay </p>

            <div class="navbar">
                <a href="index.jsp"> <p class="navBarButton"> Home </p> </a>
                <a href="login.jsp"> <p class="navBarButton"> Log in </p> </a>
                <a href="registerOption.jsp"> <p class="navBarButton"> Register </p> </a>
            </div>
        </div>


        <!-- Content -->
        <div class="platform">
            <p class="pagetitle"> Log in </p>

            <!-- Error messages-->
            <p class="invalid"> <%=(existErr != null ? existErr : "")%>  </p>
            <p class="invalid"><%=(passErr != null ? passErr : "")%> </p>
            <p class="invalid"><%=(emailErr != null ? emailErr : "")%></p>
            <p class="invalid"><%=(activateErr != null ? activateErr : "")%></p>

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
        </div>
    </body>
</html>
