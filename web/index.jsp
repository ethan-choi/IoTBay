
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

            <a href="login.jsp"> <p class="interfacebutton"> Login </p> </a>
            
            <p class="regulartextcenter"> or </p>
            <a href="registerOption.jsp"> <p class="interfacebutton"> Register </p> </a>

            <p class="regulartextcenter"> or </p>
            <form action="DeviceCatalogue">
                <button class="interfacebutton" type="submit" value="Open">Catalogue</button>
            </form>

        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>