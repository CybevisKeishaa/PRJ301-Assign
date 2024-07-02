<%-- 
    Document   : detail
    Created on : Jul 2, 2024, 5:23:25 PM
    Author     : KEISHA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

    <table border="1px">
        <tr>
            <td>SUBJECT</td>
            <td>EXAM</td>
            <td>WEIGHT</td>
            <td>DURATION</td>
        </tr>
        <c:forEach items="${requestScope.exams}" var="e">
            <tr>
                <td>${e.assessment.subject.name}</td>
                <td>${e.assessment.name}</td>
                <td>${e.assessment.weight}</td>
                <td>${e.duration}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
