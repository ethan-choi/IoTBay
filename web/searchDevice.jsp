<%-- 
    Document   : searchDevice
    Created on : 02/06/2020, 3:45:41 PM
    Author     : Jackie Lim
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="uts.isd.model.*" %>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <% 
        ArrayList<Product> deviceSearch = (ArrayList<Product>) session.getAttribute("deviceSearch"); 
    %>
    
    
    <body>
        <h1>Hello World!</h1>
        <table>
                <thead>
                    <th> Product_ID </th>
                    <th> Name </th>
                    <th> Price </th>
                    <th> Manufacturer </th>
                    <th> Type </th>
                    <th> Quantity Available </th>
                </thead>
                <c:forEach items="${deviceSearch}" var="search" >
                    <tr>
                        <td><c:out value="${search.product_id}"/></td>
                        <td><c:out value="${search.name}"/></td>
                        <td><c:out value="${search.price}"/></td>
                        <td><c:out value="${search.manufacturer}"/></td>
                        <td><c:out value="${search.type}"/></td>
                        <td><c:out value="${search.quantity}"/></td>
                    </tr>
                </c:forEach>
            </table>
    </body>
</html>
