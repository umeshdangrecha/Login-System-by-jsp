<%-- 
    Document   : logout
    Created on : 6 Jun, 2020, 8:41:17 AM
    Author     : umesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login System</title>
    </head>
    <body>
        <%session.invalidate();
        response.sendRedirect("login.html");
        %>
    </body>
</html>
