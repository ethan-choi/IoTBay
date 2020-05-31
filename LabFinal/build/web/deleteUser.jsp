

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
            
   
            
            
            <p class="pagetitle"> Delete Account </p>
            
        <div class="form">
            <form action="DeleteUserController">
                      
               
               <p class ="bodytext"> You are about to delete </p>
                
              <input type="text" id="email" name="email" value="${student.email}" class="inputfield" required readonly> <br>

              
              <p class ="bodytext"> Are you sure you want to delete your account? </p>
              <p class ="bodytext"> All orders associated with this account will be cancelled. Your personal information, delivery address information and payment information will be deleted. </p>
              <p class ="bodytext"> Once you delete your account, you won't be able to retrieve it later. </p>
              
              <a href="main.jsp"> <p class="alternateOption"> Cancel </p> </a>
              
              <input type="submit" value="Delete" class="deletebutton">
              
              

              
              
              
            </form>
              
              
              
         </div>
            
            
        </div>
</html>
