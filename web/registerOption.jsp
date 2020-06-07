<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- Purpose of this page is to allow users to choose if they want to register a staff or customer account-->
<html>
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>


    <!-- Header -->

    <div class="header"> .<p class="headertext"> IoT Bay </p>
        <div class="navbar">
            <form action="DeviceCatalogue">
                <a href="index.jsp"> <p class="navBarButton"> Home </p> </a>
                <button class="navBarButtoncatalogue" type="submit" value="Open"> Catalogue </button>
                <a href="login.jsp"> <p class="navBarButton"> Log in </p> </a>
                <a href="registerOption.jsp"> <p class="navBarButton"> Register </p> </a>
            </form>
        </div>
    </div>






    <!-- Content -->
    <div class="platform">
        <p class="pagetitle"> Register as a </p>
        <!-- Option to register as a staff or customer -->
        <a href="registerCustomer.jsp"> <p class="standardbutton"> Customer </p> </a>
        <a href="registerStaff.jsp"> <p class="standardbutton"> Staff </p> </a>

    </div>
    <jsp:include page="/ConnServlet" flush="true"/>
</body>
</html>