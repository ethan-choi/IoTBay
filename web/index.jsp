

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" %>
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


            <a href="login.jsp"> <p class="interfacebutton"> Login </p> </a>


            <p class="regulartextcenter"> or </p>
            <a href="registerOption.jsp"> <p class="interfacebutton"> Register </p> </a>

            <form action="DeviceCatalogue">
                <button type="submit" value="Open"> Device Catalogue </button>
            </form>


        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>