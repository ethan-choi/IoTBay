


<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Account Page</title>
    </head>
    <body>

    </body>
    
    <%
        ArrayList<Student> students = (ArrayList)request.getAttribute("students");
    %>
    
        <div class="header"> .<p class="headertext"> IoT Bay </p>
        
                <div class="navbar">
        <a href="main.jsp" class="navbarbutton"> Main</a>
        <a href="logout.jsp" class="navbarbutton" >Logout</a>
        </div>
        </div>
            
        <div class="platform">
            
       <c: forEach items ="${students}" var = "studentperson">
           <p> Student name = ${studentperson.name} </p>
           
           </c:forEach>

        </div>
</html>
