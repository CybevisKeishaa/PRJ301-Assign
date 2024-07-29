<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lecturer Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/lecturerTakeExam.css">
</head>
<body class="bg-dark text-white">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="#">Hi lecturer, ${sessionScope.user.displayname}</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../view/lecture/lecturerHome.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../exam/statistics">Statistics</a>
                </li>
            </ul>
        </div>
    </nav>

    
    <div class="container mt-5 pt-5">
        <h1 class="text-center">SELECT COURSE TO TAKE GRADES</h1>
        <c:if test="${requestScope.exams eq null}">
            <c:if test="${requestScope.courses.size() > 0}">
                <form id="courseForm" method="POST" class="mt-4">
                    <input type="hidden" name="lid" value="${param.lid}"/>
                    <div class="form-group">
                        <label for="cid">Course:</label>
                        <select name="cid" class="form-control" id="cid">
                            <c:forEach items="${requestScope.courses}" var="c">
                                <option value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="button" class="btn btn-primary" onclick="submitForm('lecturer')">View</button>
                    <button type="button" class="btn btn-secondary" onclick="submitForm('../course/list')">List</button>
                </form>
            </c:if>
        </c:if>
        <c:if test="${requestScope.exams ne null}">
            <form action="take" method="GET" class="mt-4">
                <input type="hidden" name="cid" value="${param.cid}"/>
                <c:forEach items="${requestScope.exams}" var="e">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="eid" value="${e.id}" id="exam${e.id}">
                        <label class="form-check-label" for="exam${e.id}">
                            ${e.assessment.name} - (${e.from} : ${e.assessment.weight}%)
                        </label>
                    </div>
                </c:forEach>
                <input type="submit" value="Take" class="btn btn-primary mt-3"/>
            </form>
        </c:if>
    </div>

    <script>
        function submitForm(action) {
            var form = document.getElementById('courseForm');
            form.action = action;
            form.submit();
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
