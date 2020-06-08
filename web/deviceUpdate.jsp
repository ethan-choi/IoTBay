<%-- 
    Document   : deviceUpdate
    Created on : 31/05/2020, 9:44:41 PM
    Author     : Jackie Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Product"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Update Device</title>
    </head>
    <%-- Staff only page that allows them to update a device's / product's detail --%> 
    <body>
       <%
            Product product = (Product)session.getAttribute("product");
            
            String success = (String) session.getAttribute("success");   
            String existErr = (String) session.getAttribute("existErr");
            String idErr = (String) session.getAttribute("idErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String priceErr = (String) session.getAttribute("priceErr");
            String manufacturerErr = (String) session.getAttribute("manufacturerErr");
            String typeErr = (String) session.getAttribute("typeErr");
            String quantityErr = (String) session.getAttribute("quantityErr");
        %>
        <%-- Header --%> 
        <div class="header"> <div class="wrapper"> <p class="headertext"> IoT Bay </p> <img class="logo" src="logo.png" alt="logo"> 
                <c:set var="val" value="${user.email}"/>
                <c:choose> 
                    <c:when test="${val != null}">
                        <p class="loginstatus"> You are logged in as ${user.email} </p>
                    </c:when>
                    <c:otherwise>
                        <p class="loginstatus"> You are not logged in </p>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="navbar">
                <form action="DeviceCatalogueServlet">
                    <a href="index.jsp"> <p class="navBarButton"> Home </p> </a>
                    <button class="navBarButtoncatalogue" type="submit" value="Open"> Catalogue </button>
                    <c:set var="val" value="${user.email}"/>
                    <c:choose> 
                        <c:when test="${val != null}">
                            <a href="main.jsp"> <p class="navBarButton"> Account </p> </a>
                            <a href="logout.jsp"> <p class="navBarButton"> Log out </p> </a>
                        </c:when>
                        <c:otherwise>
                            <a href="login.jsp"> <p class="navBarButton"> Log in </p> </a>
                            <a href="registerOption.jsp"> <p class="navBarButton"> Register </p> </a>
                        </c:otherwise>
                    </c:choose>
                </form>
            </div>
        </div>
        <%-- Content --%> 
        <div class="platform">
            <p class="pagetitle">Edit Device Information</p>
            
            <br>
            <span class="invalid"> <%=(existErr != null ? existErr : "")%> </span>
            <span class="success"> <%=(success != null ? success : "")%> </span>
            <%-- Update form for the staff to use --%> 
            <div class="form">
                <form method="post" action="DeviceUpdateServlet" >
                    <table class="maintable">  
                        <tr>
                            <td><label class="inputlabel" for="id">Device ID</label></td>
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(idErr != null ? idErr : "Enter id")%>" value="${product.product_id}" id="id" name="id"></td>
                        </tr>   
                        <tr>
                            <td><label class="inputlabel" for="name">Device Name</label></td>
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" value="${product.name}" id="name" name="name"></td>
                        </tr>
                        <tr>
                            <td><label class="inputlabel" for="price">Price</label></td>
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(priceErr != null ? priceErr : "Enter price")%>" value="${product.price}" id="price" name="price"></td>
                        </tr>
                        <tr>
                            <td><label class="inputlabel" for="manufacturer">Manufacturer</label></td>
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(manufacturerErr != null ? manufacturerErr : "Enter manufacturer")%>" value="${product.manufacturer}" id="manufacturer" name="manufacturer"></td>
                        </tr>
                        <tr>
                            <td><label class="inputlabel" for="type">Type</label></td>
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(typeErr != null ? typeErr : "Enter type")%>" value="${product.type}" id="type" name="type"></td>
                        </tr>
                        <tr>
                            <td><label class="inputlabel" for="quantity">Quantity In Stock</label></td> 
                            <td colspan="2"><input class="dInputField" type="text" placeholder="<%=(quantityErr != null ? quantityErr : "Enter quantity")%>" value="${product.quantity}" id="quantity" name="quantity"></td>
                        </tr>
                    </table>
                        
                    <a href="DeviceCatalogueServlet"><p class="alternateOption">Cancel</p></a>
                    <input class="submitbutton" type="submit" value="Update">
                    
                </form> 
            </div>
        </div> 
    </body>
</html>
