
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>


<!-- Purpose of this page is to allow users to edit their account details-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Edit Account</title>
    </head>
    <body>

    </body>

    <!--Import variables -->

    <%
        User user = (User) session.getAttribute("user");
        String updated = (String) session.getAttribute("updated");
        String emptyErrUam = (String) session.getAttribute("emptyErrUam");
        String existErr = (String) session.getAttribute("existErr");
        String emailErr = (String) session.getAttribute("emailErr");
        String passErr = (String) session.getAttribute("passErr");
        String nameErr = (String) session.getAttribute("nameErr");
        String numberErr = (String) session.getAttribute("numberErr");
    %>

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
        <p class="pagetitle"> Edit Account </p>
        <p class="success"> <%=(updated != null ? updated : "")%>  </p>
        <p class="invalid"><%=(existErr != null ? existErr : "")%> </p>
        <p class="invalid"><%=(passErr != null ? passErr : "")%> </p>
        <p class="invalid"><%=(emailErr != null ? emailErr : "")%></p>
        <p class="invalid"><%=(nameErr != null ? nameErr : "")%></p>
        <p class="invalid"><%=(numberErr != null ? numberErr : "")%></p>
        <p class="invalid"><%=(emptyErrUam != null ? emptyErrUam : "")%></p>            
        <!--Update details form-->
        <div class="form">
            <form action="UpdateController">
                <input type="hidden" id="email" name="email" value="${user.email}" class="inputfield" readonly> <br>

                <label for="password" class="inputlabel">Password</label><br>
                <input type="text" id="password" name="password" value="${user.password}" class="inputfield" ><br>

                <label for="name" class="inputlabel">Full name</label><br>
                <input type="text" id="name" name="name" value="${user.name}" class="inputfield" ><br>  

                <label for="number" class="inputlabel">Mobile Number</label><br>
                <input type="text" id="number" name="number" class="inputfield" value="${user.number}" ><br>

                <input type="hidden" id="role" name="role" class="inputfield" value="${user.role}" ><br>


                <a href="main.jsp"> <p class="alternateOption"> Cancel </p> </a>
                <input type="submit" value="Update" class="updatebutton">



            </form>
        </div>


    </div>
</html>
