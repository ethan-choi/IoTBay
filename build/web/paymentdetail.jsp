<%-- 
    Document   : paymentdetail
    Created on : 2020-6-7, 18:56:28
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>paymentdetail</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h1>Payment detail</h1>
        <form method="post" action="detailtable.jsp">
            <table>
                <tr><td>PaymentID</td><td><input type="text" placeholder="Enter PatmentID" name="PaymentID"></td></tr>
                <tr><td>Card Number</td><td><input type="text" placeholder="Enter Card Number" name="CardNumber"></td></tr>
                <tr><td>Card Type</td><td><input type="text" placeholder="Enter Card Type" name="CardType"></td></tr>
                <tr><td>Card Holder</td><td><input type="text" placeholder="Enter Card Holder" name="CardHolder"></td></tr>
                <tr><td>Expiration Date</td><td><input type="date" name="ExpirationDate"></td></tr>
                <tr><td>CVV</td><td><input type="password" placeholder="Enter CVV" name="CVV"></td></tr>
                <tr><td>Email</td><td><input type="text" placeholder="Enter Email" name="Email"></td></tr>
                <tr><td></td><td><input type="submit" value="Confirm"></td></tr>
            </table>
        </form>
    </body>
</html>
