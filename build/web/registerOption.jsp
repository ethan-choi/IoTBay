<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- Purpose of this page is to allow users to choose if they want to register a staff or customer account-->
<html>
    <head>
        <title>Interface</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>


    <!-- Header -->
    <body>
        <div class="header"> .<p class="headertext"> IoT Bay </p>

            <div class="navbar">
                <a href="index.jsp"> <p class="navBarButton"> Home </p> </a>
                <a href="login.jsp"> <p class="navBarButton"> Log in </p> </a>
                <a href="registerOption.jsp"> <p class="navBarButton"> Register </p> </a>
            </div>
        </div>


        <!-- Content -->
        <div class="platform">
            <!-- Option to register as a staff or customer -->
            <a href="registerCustomer.jsp"> <p class="interfacebutton"> Customer </p> </a>
            <p class="regulartextcenter"> or </p>
            <a href="registerStaff.jsp"> <p class="interfacebutton"> Staff </p> </a>

        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>