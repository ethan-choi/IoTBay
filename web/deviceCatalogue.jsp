<%-- 
    Document   : catalogue
    Created on : 31/05/2020, 1:54:43 PM
    Author     : Jackie Lim
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Device Catalogue</title>
    </head>
    <body>
        
        <% 
            // Customer customer = (Customer)session.getAttribute("customer");

            Student student = (Student) session.getAttribute("student");

            Product product = (Product) session.getAttribute("product");
            
            String role = (String) session.getAttribute("role");
            
            ArrayList<Product> deviceList= (ArrayList<Product>) session.getAttribute("deviceList"); 

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
        
        <div class="catalogue"> 
            <p class="pagetitle">Device Catalogue</p>
            <p class="dSubheading"> Search: </p>
            <span class="invalid"> <%=(existErr != null ? existErr : "")%> </span>
            <div class="form">
                <form action="DeviceSearchServlet" method="get">
                    <label for="name" class="inputlabel">Device Name</label>
                    <input type="text" placeholder="<%=(nameErr != null ? nameErr : "Enter name")%>" id="name" name="name" class="inputfield">
                    <br>
                    <label for="type" class="inputlabel">Device Type</label>
                    <input type="text" placeholder="<%=(typeErr != null ? typeErr : "Enter type")%>" id="type" name="type" class="inputfield">
                    <br>
                    <input type="hidden" value="Search" name="search">
                    <input type="submit" value="Search" class="submitbutton" >
                </form>
            </div>
            <c:choose>
            <c:when test="${role == 'Staff'}">
            <div class="deviceManagement">
                <ul>
                    <li>
                        <form action="DeviceResetController" method="get">
                        <input type="hidden" value="Add" name="add">
                        <input type="submit" value="Add" class="formbutton" >
                        </form>
                    </li>
                    <li>
                    <form action="DeviceResetController" method="get">
                        <input type="hidden" value="Edit" name="edit">
                        <input type="submit" value="Edit" class="formbutton" >
                    </form> 
                    </li>
                    <li>
                    <form action="DeviceResetController" method="get">
                        <input type="hidden" value="Delete" name="delete">
                        <input type="submit" value="Delete" class="formbutton" >
                    </form> 
                    </li>
                </ul>
            </div>  
            </c:when>
            </c:choose>
            <table class="deviceTable">
                <thead>
                    <th> Product_ID </th>
                    <th> Name </th>
                    <th> Price </th>
                    <th> Manufacturer </th>
                    <th> Type </th>
                    <th> Quantity Available </th>
                    <c:choose>
                    <c:when test="${role == 'Staff'}">
                    <th> Options </th>
                    </c:when>
                    </c:choose>
                </thead>
                <c:forEach items="${deviceList}" var="dList" >
                    <tr>
                        <td><c:out value="${dList.product_id}"/></td>
                        <td><c:out value="${dList.name}"/></td>
                        <td style="text-align: center"><c:out value="${dList.price}"/></td>
                        <td><c:out value="${dList.manufacturer}"/></td>
                        <td style="text-align: center"><c:out value="${dList.type}"/></td>
                        <td style="text-align: center"><c:out value="${dList.quantity}"/></td>
                        <c:choose>
                        <c:when test="${role == 'Staff'}">
                        <td>
                            
                            <form action="DeviceEditServlet">
                                <input type="hidden" value='${dList.product_id}' name="id">
                                <input type="submit" value="edit" class="formbutton" >
                            </form>
                                
                                  <%--
                             <a href="DeviceEditServlet?id=<c:out value='${dList.product_id}' />">Edit</a>
                            


                            
                          
                            
                                                       
                            <a href="deviceUpdate.jsp"><p style="float: left" class="deviceOptions">Edit</p></a>--%>
                            <a href="deviceDelete.jsp"><p style="float: right" class="deviceOptions">Delete</p></a>
                        </td>
                        </c:when>
                        </c:choose>
                    </tr>
                </c:forEach>
            </table>

        </div>         
    </body>
</html>