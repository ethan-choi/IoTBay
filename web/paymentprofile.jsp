<%-- 
    Document   : paymentprofile
    Created on : 2020-6-7, 21:19:04
    Author     : User
--%>

<%@page import="uts.isd.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>paymentprofile Page</title>
    </head>
    <body>
        <%
            Payment payment = (Payment)session.getAttribute("payment");
        %>
        <h1>paymentprofile</h1>
        
        <table>
            <thead>
                <tr>
                    <th>PaymentID</th>
                    <th>CardNumber</th>
                    <th>CardType</th>
                    <th>CardHolder</th>
                    <th>ExpirationDate</th>
                    <th>CVV</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= payment.getPaymentID() %></td>
                    <td><%= payment.getCardNumber() %></td>
                    <td><%= payment.getCardType() %></td>
                    <td><%= payment.getCardHolder() %></td>
                    <td><%= payment.getExpirationDate() %></td>
                    <td><%= payment.getCVV() %></td>
                    <td><%= payment.getEmail() %></td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
