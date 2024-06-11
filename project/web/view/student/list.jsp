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
                var result = confirm('Are you sure?');
                if (result) {
                    window.location.href = 'remove?id=' + id;
                }
            }
        </script>
    </head>
    <body>
        <table border='1px'>
            <tr> 
                <td>ID</td>
                <td>Name</td>
                <td>Actions</td>
            </tr>
            <c:forEach items="${requestScope.student}" var="s">
                <tr>
                    <td>${s.id}</td>
                    <td><a href="detail.jsp?id=${s.id}">${s.name}</a></td>
                    <td>
                        <input type="button" value="Update" onclick="window.location.href = 'update?id=${s.id}'"/>
                        <input type="button" value="Remove" onclick="deleteEmp(${s.id})"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="create">Create</a>
    </body>
</html>
