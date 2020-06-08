<%-- 
    Document   : paymentmanagement
    Created on : 2020-6-7, 20:26:55
    Author     : User
--%>

<%@page import="uts.isd.model.Payment"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Payment Management</h1>
        <%
            Payment payment = (Payment)session.getAttribute("payment");
        %>
        <p> You are logged in as <%= payment.getEmail() %></p>

        <div>
            <a href="update.jsp"> Update</a>
            <a href="delate.jsp"> Delate</a>
        </div>
        
        <div>
            <jsp:include page="paymentprofile.jsp" flush="true" />
        </div>
    </body>
</html>
