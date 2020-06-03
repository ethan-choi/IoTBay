<%-- 
    Document   : addDevice
    Created on : 31/05/2020, 10:15:34 PM
    Author     : Jackie Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Device</title>
    </head>
    <body>
        <%
            String added = (String)session.getAttribute("added");
            
            String existErr = (String) session.getAttribute("existErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String priceErr = (String) session.getAttribute("priceErr");
            String manufacturerErr = (String) session.getAttribute("manufacturerErr");
            String typeErr = (String) session.getAttribute("typeErr");
            String quantityErr = (String) session.getAttribute("quantityErr");
        %>
        
        <h1>Add Device: <span> <%=(added != null ? added : "")%> </span> </h1>
        <div>
            <a href="DeviceCatalogue">GO BACK TO CATALOGUE</a>
        </div>
        
        <form method="post" action="DeviceAddServlet" >
            <table>  
                <tr>
                    <td><label for="name">Device Name</label></td>
                    <td><input type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" id="name" name="name"></td>
                </tr>
                <tr>
                    <td><label for="price">Price</label></td>
                    <td><input type="text" placeholder="<%=(priceErr != null ? priceErr : "Enter price")%>" id="price" name="price"></td>
                </tr>
                <tr>
                    <td><label for="manufacturer">Manufacturer</label></td>
                    <td><input type="text" placeholder="<%=(manufacturerErr != null ? manufacturerErr : "Enter manufacturer")%>" id="manufacturer" name="manufacturer"></td>
                </tr>
                <tr>
                    <td><label for="type">Type</label></td>
                    <td><input type="text" placeholder="<%=(typeErr != null ? typeErr : "Enter type")%>" id="type" name="type"></td>
                </tr>
                <tr>
                    <td><label for="quantity">Quantity In Stock</label></td>
                    <td><input type="text" placeholder="<%=(quantityErr != null ? quantityErr : "Enter quantity")%>" id="quantity" name="quantity"></td>
                </tr>
                <tr>
                    <td><input class="button" type="submit" value="Add"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
