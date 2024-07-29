<%-- 
    Document   : take
    Created on : Jul 1, 2024, 10:00:31 PM
    Author     : KEISHA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Take Exam</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/lecturerTakeExam.css">
</head>
<body class="bg-dark text-white">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="#">TAKE STUDENT GRADE</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../view/lecture/lecturerHome.jsp">HOME</a>
                </li>               
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5 pt-5">
        <form action="take" method="POST">
            <table class="table table-dark table-striped">
                <thead>
                    <tr>
                        <th></th>
                        <c:forEach items="${requestScope.exams}" var="e">
                            <th>
                                ${e.assessment.name}(${e.assessment.weight}) <br/>
                                ${e.from}
                            </th>
                        </c:forEach>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.students}" var="s">
                        <tr>
                            <td>${s.name}</td>
                            <c:forEach items="${requestScope.exams}" var="e">
                                <td>
                                    <input type="text" name="score${s.id}_${e.id}"
                                        <c:forEach items="${requestScope.grades}" var="g">
                                            <c:if test="${e.id eq g.exam.id and s.id eq g.student.id}">
                                                value="${g.score}"
                                            </c:if>
                                        </c:forEach>
                                    />
                                    <input type="hidden" name="gradeid" value="${s.id}_${e.id}"/>
                                </td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <input type="hidden" name="cid" value="${param.cid}" />
            <input type="submit" value="Save" class="btn btn-primary"/>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
