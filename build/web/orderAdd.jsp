<%-- 
    Document   : orderAdd
    Created on : 08/06/2020, 2:11:15 PM
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
        <title>Add order</title>
    </head>
    <div class="header"> <div class="wrapper"> <p class="headertext"> IoT Bay </p> <img class="logo" src="logo.png" alt="logo"> 
   
            
    
    <body>

          <div class="platform"> 
          <p class="pagetitle">Make an Order</p>
            
       <div class="form">
        <form method="post" >
            <table class="maintable">   
                <tr>
                    <td><label class="inputlabel" for="product_id" >Product ID: </label></td>
                    <td colspan="2"><input class="dInputField" type="number" placeholder="" id="product_id" name="product_id" min="1"></td>
                </tr>
                
                <tr>
                    <td><label class="inputlabel" for="name" >Product Name: </label></td>
                    <td colspan="2"><input class="dInputField" type="dInputField" placeholder="" id="product_id" name="name"></td>
                </tr>
               
                <tr>
                    <td><label class="inputlabel" for="price">Quantity: </label></td>
                    <td colspan="2"><input class="dInputField" type="number" placeholder="" id="quantity" name="quantity" min="1" max="quantity"></td>
                </tr> 
                
             
            </table>
                
                  <a href="orderCart"><p class="standardbutton">Cancel</p></a>
                  <input type="submit" value="Add to cart" class="submitbutton">
        </form>
       </div>
        
        
        
    </body>
</html>
