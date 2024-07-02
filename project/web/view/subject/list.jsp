<%-- 
    Document   : detail
    Created on : Jul 2, 2024, 4:46:53 PM
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
        <form action="detail" method="GET">
            SUBJECT: <select name="subid"> 
            <c:forEach items="${requestScope.subs}" var="sub">
                <option value="${sub.id}"> ${sub.name}</option>
                
            </c:forEach>
            </select>
            <input type="submit" value="detail">
        </form>
        
        
        
        
        
        
        
    </body>
</html>
