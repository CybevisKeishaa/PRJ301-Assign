<%-- 
    Document   : home
    Created on : Jul 2, 2024, 2:04:35 PM
    Author     : KEISHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hi lecturer ${sessionScope.user.displayname}</h1>
        
        <a href="../../exam/lecturer"> Update Score</a> </br>
        <a href="../../subject/list"> FLM FPT</a>
    </body>
</html>
