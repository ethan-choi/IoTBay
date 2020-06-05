<%-- 
    Document   : deviceUpdate
    Created on : 31/05/2020, 9:44:41 PM
    Author     : Jackie Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Update Device</title>
    </head>
    <body>
       <%
            Product product = (Product)session.getAttribute("product");
           
            String success = (String)session.getAttribute("success");   
            String existErr = (String) session.getAttribute("existErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String priceErr = (String) session.getAttribute("priceErr");
            String manufacturerErr = (String) session.getAttribute("manufacturerErr");
            String typeErr = (String) session.getAttribute("typeErr");
            String quantityErr = (String) session.getAttribute("quantityErr");
        %>
        
        <div class="header"> .<p class="headertext"> IoT Bay </p>
            <div class="navbar">
                <a href="main.jsp" class="navbarbutton">Main</a>
                <a href="logout.jsp" class="navbarbutton">Logout</a>
            </div>
        </div>
        
        <div class="platform">
            <p class="pagetitle">Edit Device Information</p>
            
            <br>
            <span class="invalid"> <%=(existErr != null ? existErr : "")%> </span>
            <span class="success"> <%=(success != null ? success : "")%> </span>
            
            <div class="form">
                <form method="post" action="DeviceUpdateServlet" >
                    <table class="maintable">  
                        <tr>
                            <td><label class="inputlabel" for="name">Device Name</label></td>
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" id="name" name="name"></td>
                        </tr>
                        <tr>
                            <td><label class="inputlabel" for="price">Price</label></td>
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(priceErr != null ? priceErr : "Enter price")%>" id="price" name="price"></td>
                        </tr>
                        <tr>
                            <td><label class="inputlabel" for="manufacturer">Manufacturer</label></td>
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(manufacturerErr != null ? manufacturerErr : "Enter manufacturer")%>" id="manufacturer" name="manufacturer"></td>
                        </tr>
                        <tr>
                            <td><label class="inputlabel" for="type">Type</label></td>
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(typeErr != null ? typeErr : "Enter type")%>" id="type" name="type"></td>
                        </tr>
                        <tr>
                            <td><label class="inputlabel" for="quantity">Quantity In Stock</label></td>
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(quantityErr != null ? quantityErr : "Enter quantity")%>" id="quantity" name="quantity"></td>
                        </tr>
                        <tr>
                           
                        </tr>
                    </table>
                        
                    <a href="DeviceCatalogue"><p class="standardbutton">Cancel</p></a>
                    <input class="submitbutton" type="submit" value="Update">
                    
                </form> 
            </div>
        </div> 
    </body>
</html>
