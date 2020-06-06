<%-- 
    Document   : index
    Created on : 6 Jun, 2020, 4:27:58 AM
    Author     : umesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login System</title>
    <link rel="stylesheet" href="bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="./myCss.css">
    </head>

    <body>
        <%
            String username = (String)session.getAttribute("username");
            if(username==null){
                response.sendRedirect("login.html");
                session.invalidate();
            }
        %>
        <div class="topnav" id="myTopnav">
            <a href="index.jsp"  class="active"><i class="fa fa-home"></i>Home</a>
            <a href="users.jsp">Users</a>
            <a href="registration.html">Registration</a>
            <a href="login.html">Login</a>
            <a href="javascript:void(0)" class="icon" onclick="myFunction()"><i class="fa fa-bars"></i></a>
        </div>
        <div class="container">
        <h1 > Hello <%=username%></h1>
        <a href="logout.jsp"><button class="btn btn-primary">Logout</button></a>
        
        <a href="update.jsp"><button class="btn btn-danger" >Update</button></a>
        </div>
        <script src="./myJs.js"></script>
    </body>
</html>
