<%-- 
    Document   : index
    Created on : 21/04/2020, 10:14:16 PM
    Author     : ethan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Interface</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>


        <div class="header"> .<p class="headertext"> IoT Bay </p></div> 



        <div class="platform">


            <a href="registerCustomer.jsp"> <p class="interfacebutton"> Customer </p> </a>


            <p class="regulartextcenter"> or </p>
            <a href="registerStaff.jsp"> <p class="interfacebutton"> Staff </p> </a>




        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>