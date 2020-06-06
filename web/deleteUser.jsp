<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management


<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
=======
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay


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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
    <!-- Import variables-->
        <%
            User user = (User) session.getAttribute("user");
            String updated = (String) session.getAttribute("updated");
        %>

        
        <!-- Header-->
        <div class="header"> .<p class="headertext"> IoT Bay </p>

            <div class="navbar">
                <a href="main.jsp" class="navbarbutton"> Main</a>
                <a href="logout.jsp" class="navbarbutton"> Logout</a>
=======
    </body>
    
    <%
           Student student = (Student)session.getAttribute("student");
           String updated = (String)session.getAttribute("updated");
    %>
       
    
    <div class="header"> .<p class="headertext"> IoT Bay </p>
        
                <div class="navbar">
        <a href="main.jsp" class="navbarbutton"> Main</a>
        <a href="logout.jsp" class="navbarbutton"> Logout</a>
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay

        </div>
<<<<<<< HEAD

        
        <!--Content -->
=======
        </div>
        
            
>>>>>>> parent of 161e73b... Merge branch 'master' of https://github.com/ethan-choi/IoTBay
        <div class="platform">
            
   
            
            
            <p class="pagetitle"> Delete Account </p>
            
        <div class="form">
            <form action="DeleteUserController">
                      
               
                
              <input type="hidden" id="email" name="email" value="${student.email}" class="inputfield" required readonly> <br>

              
              <p class="bodytext"> Are you sure you want to delete your account? </p>
              <p class="bodytext"> All orders associated with this account will be cancelled. Your personal information, delivery address information and payment information will be deleted. </p>
              <p class="bodytext"> Once you delete your account, you won't be able to retrieve it later. </p>
              
              <a href="main.jsp"> <p class="alternateOption"> Cancel </p> </a>
              
              <input type="submit" value="Delete" class="deletebutton">
              
              

              
              
              
            </form>
              
              
              
         </div>
            
            
        </div>
</html>
