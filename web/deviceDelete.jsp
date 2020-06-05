<%-- 
    Document   : deviceDelete
    Created on : 01/06/2020, 3:14:36 PM
    Author     : Jackie Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Delete Device</title>
    </head>
    <body>
        <% 
            String success = (String)session.getAttribute("success");
            String existErr = (String) session.getAttribute("existErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String typeErr = (String) session.getAttribute("typeErr");
        %>
        
        <div class="header"> .<p class="headertext"> IoT Bay </p>
            <div class="navbar">
                <a href="main.jsp" class="navbarbutton">Main</a>
                <a href="logout.jsp" class="navbarbutton">Logout</a>
            </div>
        </div>
        
        <div class="platform">
            <p class="pagetitle">Delete Device</p>
            
            <br>
            <span class="invalid"> <%=(existErr != null ? existErr : "")%> </span>
            <span class="success"> <%=(success != null ? success : "")%> </span>
            
            <div class="form">
                <form method="post" action="DeviceDeleteServlet" >
                    <table class="maintable">  
                        <tr>
                            <td><label class="inputlabel" for="name">Device Name</label></td>
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" id="name" name="name"></td>
                        </tr>
                        <tr>
                            <td><label class="inputlabel" for="type">Device Type</label></td>
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(typeErr != null ? typeErr : "Enter type")%>" id="type" name="type"></td>
                        </tr>
                    </table>
                        
                    <a href="DeviceCatalogue"><p class="standardbutton">Cancel</p></a>  
                    
                    <input class="submitbutton" type="submit" value="Delete">

                </form>
            </div>
        </div>
    </body>
</html>
