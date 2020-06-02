
<%@page import="uts.isd.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Logout</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        
        <div class="header"> .<p class="headertext"> IoT Bay </p>
        
                <div class="navbar">
        <a href="main.jsp" class="navbarbutton"> Main</a>
        <a href="logout.jsp" class="navbarbutton"> Logout</a>

        </div>
        </div>
        

    <%
           Student student = (Student)session.getAttribute("student");
           String updated = (String)session.getAttribute("updated");
            

        %>
        

        <div class="platform">

            <form action="LogoutController">
                      
               
               <p class ="pagetitle"> Are you sure you want to logout? </p>
               <br>
              <input type="hidden" id="email" name="email" value="${student.email}" class="inputfield" required readonly> <br>

              <a href="main.jsp"> <p class="alternateOption"> Cancel </p> </a>
              
              <input type="submit" value="Logout" class="deletebutton">
              
              

              
              
              
            </form>
        </div>



    </div>

</body>
</html>
