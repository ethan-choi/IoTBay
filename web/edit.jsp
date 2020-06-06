
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>



<!-- Purpose of this page is to allow users to edit their account details-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Account Page</title>
    </head>
    <body>
        <!--Import variables -->
        <%
            User user = (User) session.getAttribute("user");
            String updated = (String) session.getAttribute("updated");
        %>

        <div class="header"> .<p class="headertext"> IoT Bay </p>
            <div class="navbar">
                <a href="index.jsp"> <p class="navBarButton"> Home </p> </a>
                <a href="login.jsp"> <p class="navBarButton"> Log in </p> </a>
                <a href="registerOption.jsp"> <p class="navBarButton"> Register </p> </a>
            </div>
        </div>


        <!--Content -->
        <div class="platform">

            <p class="pagetitle"> Edit Account </p>
            
            <p class="success"> <%=(updated != null ? updated : "")%>  </p>

            
            <!--Update details form-->
            <div class="form">
                <form action="UpdateController">

                    <label for="email" class="inputlabel">Email address</label><br>
                    <input type="text" id="email" name="email" value="${user.email}" class="inputfield" required><br>

                    <label for="password" class="inputlabel">Password</label><br>
                    <input type="text" id="password" name="password" value="${user.password}" class="inputfield" required><br>

                    <label for="name" class="inputlabel">Full name</label><br>
                    <input type="text" id="name" name="name" value="${user.name}" class="inputfield" required><br>  

                    <label for="number" class="inputlabel">Mobile Number</label><br>
                    <input type="text" id="number" name="number" class="inputfield" value="${user.number}" required><br>

                    <input type="hidden" id="role" name="role" class="inputfield" value="${user.role}" required><br>


                    <a href="main.jsp"> <p class="alternateOption"> Cancel </p> </a>
                    <input type="submit" value="Update" class="updatebutton">
                </form>
            </div>
        </div>
    </body>
</html>
