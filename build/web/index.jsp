
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
         <div class="header"> .<p class="headertext"> IoT Bay </p>
       
         <div class="navbar">
                <a href="index.jsp"> <p class="navBarButton"> Home </p> </a>
               <a href="login.jsp"> <p class="navBarButton"> Log in </p> </a>
               <a href="registerOption.jsp"> <p class="navBarButton"> Register </p> </a>
        </div>
        </div>


        <div class="platform">
            <p class="pagetitle"> Welcome to IoT Bay </p>

            <form action="DeviceCatalogue">
                <button class="interfacebutton" type="submit" value="Open"> Catalogue</button>
            </form>
            
  

        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>