<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<!-- Author: Ethan Choi -->


<!-- Purpose of this page is to allow staff members to register accounts -->
<html>
    <head>
        <title>Staff Member Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>

    <!-- Import variables -->
    <%
        String existErr = (String) session.getAttribute("existErr");
        String emailErr = (String) session.getAttribute("emailErr");
        String passErr = (String) session.getAttribute("passErr");
        String UsernameErr = (String) session.getAttribute("UsernameErr");
        String numberErr = (String) session.getAttribute("numberErr");
        String accessErr = (String) session.getAttribute("accessErr");
        String emptyErrUam = (String) session.getAttribute("emptyErrUam");
    %>

    <body>


        <!-- header -->
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
                    <a href="login.jsp"> <p class="navBarButton"> Log in </p> </a>
                    <a href="registerOption.jsp"> <p class="navBarButton"> Register </p> </a>
                </form>
            </div>
        </div>


        <div class="platform">
            <p class="pagetitle"> Create an IoT Bay Staff Account</p>
            <p class="invalid"><%=(existErr != null ? existErr : "")%> </p>
            <p class="invalid"><%=(passErr != null ? passErr : "")%> </p>
            <p class="invalid"><%=(emailErr != null ? emailErr : "")%></p>
            <p class="invalid"><%=(UsernameErr != null ? UsernameErr : "")%></p>
            <p class="invalid"><%=(numberErr != null ? numberErr : "")%></p>
            <p class="invalid"><%=(accessErr != null ? accessErr : "")%></p>
            <p class="invalid"><%=(emptyErrUam != null ? emptyErrUam : "")%></p>
            <!-- Register form -->
            <div class="form">
                <form action="RegisterStaffServlet" method="post">

                    <!-- Check to see if staff access key is correct and validate that the user is an actual staff member -->
                    <!-- For the purpose of this assignment, it is 123 -->
                    <!-- In reality, the key would be more complex and be given to staff members in person by their manager -->
                    <!-- If key is incorrect, deny access and redirect them to registerStaff.jsp -->
                    <label for="accesskey" class="inputlabel">Staff access key</label><br>
                    <input type="password" id="accesskey" name="accesskey" class="inputfield" ><br>
                    <a href="registerCustomer.jsp"> <p class="sublabelinput"> Not a staff member? Click here to register as a customer instead  </p></a>

                    <label for="email" class="inputlabel">Email address</label><br>
                    <input type="text" id="email" name="email" class="inputfield" ><br>
                    <p class="sublabelinput"> Your email address must include @ and .</p>


                    <label for="password" class="inputlabel">Password</label><br>
                    <input type="password" id="password"  name="password" class="inputfield" ><br>
                    <p class="sublabelinput"> Your password must have at least 5 letters and/or numbers and no spaces</p>



                    <label for="name" class="inputlabel">Full Name</label><br>
                    <input type="text" id="name" placeholder = "" name="name" class="inputfield" ><br>
                    <p class="sublabelinput"> Your name must not include numbers</p>


                    <label for="number" class="inputlabel">Mobile Number</label><br>
                    <input type="text" id="number" placeholder = "" name="number" class="inputfield" ><br>
                    <p class="sublabelinput"> Your mobile number must be 10 digits long</p>            

                    <a href="login.jsp"> <p class="alternateOption"> Login instead </p> </a>

                    <input type="submit" value="Register" class="submitbutton">

                </form>
            </div>
        </div>
    </body>
</html>
