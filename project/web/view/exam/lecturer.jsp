<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <c:if test="${requestScope.exams eq null}">
        <c:if test="${requestScope.courses.size() > 0}">
            <form id="courseForm" method="POST">
                <input type="hidden" name="lid" value="${param.lid}"/>
                course: 
                <select name="cid">
                    <c:forEach items="${requestScope.courses}" var="c">
                        <option value="${c.id}">
                            ${c.name}
                        </option>
                    </c:forEach>
                </select>
                <input type="button" value="view" onclick="submitForm('lecturer')"/>
                <input type="button" value="list" onclick="submitForm('../course/list')"/>
            </form>
        </c:if>
    </c:if>
    <c:if test="${requestScope.exams ne null}">
        <form action="take" method="GET">
            <input type="hidden" name="cid" value="${param.cid}"/>
            <c:forEach items="${requestScope.exams}" var="e">
                <input type="checkbox" name="eid" value="${e.id}" /> 
                ${e.assessment.name}-(${e.from}:${e.assessment.weight}%) <br/>
            </c:forEach>
            <input type="submit" value="take"/>
        </form>
    </c:if>

    <script>
        function submitForm(action) {
            var form = document.getElementById('courseForm');
            form.action = action;
            form.submit();
        }
    </script>
</body>
</html>
