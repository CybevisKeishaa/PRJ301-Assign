<%-- 
    Document   : list
    Created on : Jul 2, 2024, 4:46:53 PM
    Author     : KEISHA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Subject List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/flm.css">
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
                    <a class="nav-link" href="../../subject/list">FLM FPT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../../student/status">ACADEMIC TRANSCRIPT</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5 pt-5">
        <h1 class="text-center">Subject List</h1>
        <form action="detail" method="GET" class="mt-4">
            <div class="form-group">
                <label for="subid">SUBJECT:</label>
                <select name="subid" class="form-control" id="subid">
                    <c:forEach items="${requestScope.subs}" var="sub">
                        <option value="${sub.id}">${sub.name}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Detail</button>
        </form>

        <c:if test="${not empty exams}">
            <h2 class="text-center mt-5">Exam Details</h2>
            <table class="table table-dark table-striped mt-3">
                <thead>
                    <tr>
                        <th>SUBJECT</th>
                        <th>EXAM</th>
                        <th>WEIGHT</th>
                        <th>DURATION</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.exams}" var="e">
                        <tr>
                            <td>${e.assessment.subject.name}</td>
                            <td>${e.assessment.name}</td>
                            <td>${e.assessment.weight}</td>
                            <td>${e.duration}</td>
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
