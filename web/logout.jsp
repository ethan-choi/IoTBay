<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- Purpose of this page is to allow users to logout of their account -->
<html>
    <head>
        <title>Logout</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    
       <!-- Import variables-->
        <%
            User user = (User) session.getAttribute("user");
            String updated = (String) session.getAttribute("updated");
        %>

           <!-- header -->
    <body>
        <div class="header"> .<p class="headertext"> IoT Bay </p>
            <div class="navbar">
                <form action="DeviceCatalogue">
                    <a href="index.jsp"> <p class="navBarButton"> Home </p> </a>
                    <button class="navBarButtoncatalogue" type="submit" value="Open"> Catalogue </button>
                    <a href="main.jsp"> <p class="navBarButton"> Account </p> </a>
                    <a href="logout.jsp"> <p class="navBarButton"> Log out </p> </a>
                </form>
            </div>
        </div>

            
        <!--Content -->
        <div class="platform">
            <form action="LogoutController">
                <p class ="pagetitle"> Are you sure you want to logout? </p>
                <br>
                <input type="hidden" id="email" name="email" value="${user.email}" class="inputfield" required readonly> <br>

                <a href="main.jsp"> <p class="alternateOption"> Cancel </p> </a>

                <input type="submit" value="Logout" class="deletebutton">
            </form>
        </div>
    </div>
</body>
</html>
