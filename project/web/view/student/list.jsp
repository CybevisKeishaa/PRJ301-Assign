<%-- 
    Document   : list
    Created on : Jun 11, 2024, 2:21:24 PM
    Author     : KEISHA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function deleteEmp(id) {
                var result = confirm('are you sure?');
                if (result) {
                    window.location.href = 'remove?id=' + id;
                }
            }
        </script>
    </head>
    <body>
        <table>
            <tr> 
                <td>ID</td>
                <td>Name</td>
                <td></td>
            </tr>
            <c:forEach items="${requestScope.student}" var="s">
                <tr>
                <td> $s.id</td>
                <td href="detail.jsp?id='${s.id}'"> ${s.name}</td>
                <td>
                        <input type="button" value="Update" onclick="window.location.href = 'update?id=${e.id}'"/>
                        <input type="button" value="Remove" onclick="deleteEmp(${e.id})"/>
                </td>
                
                
                
                </tr>
            </c:forEach>
            
            
            
        </table>
        <a href="create">Create</a>
        
        
    </body>
</html>
