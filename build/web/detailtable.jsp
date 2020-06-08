<%-- 
    Document   : detailtable
    Created on : 2020-6-7, 19:20:03
    Author     : User
--%>

<%@page import="uts.isd.model.Payment"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Table Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <% 
            String PaymentID = request.getParameter("PaymentID");
            String CardNumber = request.getParameter("CardNumber");
            String CardType = request.getParameter("CardType");
            String CardHolder = request.getParameter("CardHolder");
            String ExpirationDate = request.getParameter("ExpirationDate");
            String CVV = request.getParameter("CVV");
            String Email = request.getParameter("Email");         
        %>
        <h1>Payment Table</h1>
        <p class="navbar">  PaymentID :<%=PaymentID %></p>
        <p class="navbar">  CardNumber :<%=CardNumber %></p>
        <p class="navbar">  CardType :<%=CardType %></p>
        <p class="navbar">  CardHolder :<%=CardHolder %></p>
        <p class="navbar">  ExpirationDate :<%=ExpirationDate %></p>
        <p class="navbar">  CVV :<%=CVV %></p>
        <p class="navbar">  Email :<%=Email %></p>
        
        <div>
            <a href="paymentmanagement.jsp"> Edit</a>
            
        </div>
        <%
            Payment payment = new Payment(PaymentID,CardNumber,CardType,CardHolder,ExpirationDate,CVV,Email);
            session.setAttribute("payment",payment);
        %>
    </body>
</html>
