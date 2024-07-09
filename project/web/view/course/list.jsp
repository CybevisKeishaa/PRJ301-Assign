<%-- 
    Document   : list
    Created on : Jul 9, 2024, 3:05:06 PM
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
        <table border="1px">
            <tr>
                <td> ID</td>
                <td>NAME</td>
                
                <td>AVATAR</td>
                
            </tr>
            <c:forEach items="${requestScope.students}" var="s">
                <tr>
                    <td> ${s.id}</td>
                    <td> ${s.name}</td>
                    
                    <td> <img src="../${s.avatar}" width="80px" height="100px">  </td>
                    
                    
                    
                </tr>
                
                
                
            </c:forEach>
        </table><!-- comment -->
        
        
    </body>
</html>
