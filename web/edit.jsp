
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
           Student student = (Student)session.getAttribute("student");
           String updated = (String)session.getAttribute("updated");
    %>
    
        <div class="header"> .<p class="headertext"> IoT Bay </p>
        
                <div class="navbar">
        <a href="main.jsp" class="navbarbutton"> Main</a>
        <a href="logout.jsp" class="navbarbutton"> Logout</a>

        </div>
        </div>
        
            
        <div class="platform">
            
   
  
            
            <p class="pagetitle"> Edit Account </p>
            <p class="success"> <%=(updated != null ? updated : "") %>  </p>

        <div class="form">
            <form action="UpdateController">
                              
              <label for="email" class="inputlabel">Email address</label><br>
              <input type="text" id="email" name="email" value="${student.email}" class="inputfield" required><br>
              
              <label for="password" class="inputlabel">Password</label><br>
              <input type="text" id="password" name="password" value="${student.password}" class="inputfield" required><br>
              
              <label for="name" class="inputlabel">Full name</label><br>
              <input type="text" id="name" name="name" value="${student.name}" class="inputfield" required><br>  

              <label for="number" class="inputlabel">Mobile Number</label><br>
              <input type="text" id="number" name="number" class="inputfield" value="${student.number}" required><br>
              
              
            <a href="main.jsp"> <p class="alternateOption"> Cancel </p> </a>
              <input type="submit" value="Update" class="updatebutton">
              
              
              
            </form>
         </div>
            
            
        </div>
</html>
