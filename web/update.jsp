<%-- 
    Document   : update
    Created on : 2020-6-7, 21:32:11
    Author     : User
--%>

<%@page import="uts.isd.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
    </head>
    <body>
        <%
            Payment payment = (Payment) session.getAttribute("payment");
            String updated = request.getParameter("updated");
        %>
        <div>
            <a href="detailtable.jsp">Detail Table</a>
        </div>
        <h1>Edit <span> <%= (updated!=null) ? updated :""%></span> </h1>
        <form method="post" action="update.jsp">
            <table>
                <tr><td>PaymentID</td><td><input type="text" value="<%= payment.getPaymentID() %>" name="PaymentID"></td></tr>
                <tr><td>Card Number</td><td><input type="text" value="<%= payment.getCardNumber() %>" name="CardNumber"></td></tr>
                <tr><td>Card Type</td><td><input type="text" value="<%= payment.getCardType() %>" name="CardType"></td></tr>
                <tr><td>Card Holder</td><td><input type="text" value="<%= payment.getCardHolder() %>" name="CardHolder"></td></tr>
                <tr><td>Expiration Date</td><td><input type="date" value="<%= payment.getExpirationDate() %>" name="ExpirationDate"></td></tr>
                <tr><td>CVV</td><td><input type="password" value="<%= payment.getCVV() %>" name="CVV"></td></tr>
                <tr><td>Email</td><td><input type="text" value="<%= payment.getEmail() %>" name="Email"></td></tr>
                <tr><td></td><td><input type="hidden" name="updated" value="update was successful">
                        <input type="submit" value="Update"></td></tr>
            </table>
        </form>

        <%
            if (updated != null) {
                String PaymentID = request.getParameter("PaymentID");
                String CardNumber = request.getParameter("CardNumber");
                String CardType = request.getParameter("CardType");
                String CardHolder = request.getParameter("CardHolder");
                String ExpirationDate = request.getParameter("ExpirationDate");
                String CVV = request.getParameter("CVV");
                String Email = request.getParameter("Email");
                
                payment = new Payment(PaymentID,CardNumber,CardType,CardHolder,ExpirationDate,CVV,Email);
                session.setAttribute("payment", payment);
            }
        %>
    </body>
</html>
