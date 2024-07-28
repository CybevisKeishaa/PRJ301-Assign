<%-- 
    Document   : home
    Created on : Jul 2, 2024, 2:04:35 PM
    Author     : KEISHA
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student Grades</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/status.css">
</head>
<body class="bg-dark text-white">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="#">Hi student ${sessionScope.user.displayname}</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../view/student/home.jsp">HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../subject/list">ACADEMIC TRANSCRIPT</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5 pt-5">
        <h1 class="text-center">Grades of ${requestScope.name}</h1>
        <table class="table table-dark table-striped mt-4">
            <thead>
                <tr>
                    <th>SUBJECT</th>
                    <th>GRADE</th>
                    <th>STATUS</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${grades}" var="g">
                    <tr>
                        <td>${g.student.courses[0].name}</td>
                        <td>${g.score}</td>
                        <td>
                            <c:choose>
                                <c:when test="${g.score eq 0}">
                                    STUDYING
                                </c:when>
                                <c:when test="${g.score >= 4}">
                                    PASSED
                                </c:when>
                                <c:otherwise>
                                    NOT PASS
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <form action="status" method="post">
                                <input type="hidden" name="cid" value="${g.student.courses[0].id}" />
                                <input type="submit" class="btn btn-primary" value="MORE" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <c:if test="${not empty details}">
            <h2 class="text-center mt-5">Detailed Grades</h2>
            <table class="table table-dark table-striped mt-3">
                <thead>
                    <tr>
                        <th>CATEGORY</th>
                        <th>WEIGHT</th>
                        <th>VALUE</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${details}" var="g">
                        <tr>
                            <td>${g.exam.assessment.name}</td>
                            <td>${g.exam.assessment.weight}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${g.score == 0.0}"></c:when>
                                    <c:otherwise>
                                        ${g.score}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
