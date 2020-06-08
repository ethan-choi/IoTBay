<%-- 
    Document   : orderCart
    Created on : 08/06/2020, 2:16:28 PM
    Author     : 1
--%>
<%@page import="uts.isd.model.Product"%>
<%@page import="uts.isd.model.Orders"%>
<%@page import="uts.isd.model.OrderDetail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>  
        <div class="header"> <div class="wrapper"> <p class="headertext"> IoT Bay </p> <img class="logo" src="logo.png" alt="logo"> 
   
    </head>

    <body>
         <%
        String product_id= request.getParameter("product_id");
        String quantity = request.getParameter("quantity");
        String name= request.getParameter("name");
        String price = request.getParameter("price");
        String manufacturer= request.getParameter("manufacturer");
        String type= request.getParameter("type");
      
        %>
        
         <table class="maintable">  
          
         <tr>
             
             <td><a href="paymentdetail"><p class="standardbutton">checkout</p></a></td>
             
         </tr>
         </table>
        
  
    </body>
</html>
