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
        <title>Delete Device</title>
    </head>
    <body>
        <% 
            String deleted = (String)session.getAttribute("deleted");
            
            String nameErr = (String) session.getAttribute("nameErr");
            String typeErr = (String) session.getAttribute("typeErr");
        %>
        
        <h1>Delete Device: <span> <%=(deleted !=null ? deleted : "")%></span></h1>     
        <div>
            <a href="DeviceCatalogue">GO BACK TO CATALOGUE</a>
        </div>
        
        <form method="post" action="DeviceDeleteServlet" >
            <table>  
                <tr>
                    <td><label for="name">Device Name</label></td>
                    <td><input type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" id="name" name="name" required></td>
                </tr>
                <tr>
                    <td><label for="type">Device Type</label></td>
                    <td><input type="text" placeholder="<%=(typeErr != null ? typeErr : "Enter type")%>" id="type" name="type" required></td>
                </tr>
                <tr>
                    <td><input class="button" type="submit" value="Delete"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
