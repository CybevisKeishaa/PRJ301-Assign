<%-- 
    Document   : detail
    Created on : Jun 16, 2024, 1:46:21 PM
    Author     : KEISHA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${requestScope.e ne null}">
            Id: ${e.id} <br/>
            Name: ${e.name} <br/>
          
        </c:if>
        <c:if test="${requestScope.e eq null}">
            employee does not exist!
        </c:if>
            
            
    </body>
</html>
