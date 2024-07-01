<%-- 
    Document   : login
    Created on : Jul 1, 2024, 10:55:53 PM
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
        <form action="login" method="POST">
            username <input type="text" name="username"/> 
            password <input type="password" name="password"/>
            <input type="submit" value="login"/>
        </form>
    </body>
</html>
