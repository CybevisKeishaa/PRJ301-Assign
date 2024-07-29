<%-- 
    Document   : statistics
    Created on : Jul 29, 2024, 4:03:59 PM
    Author     : KEISHA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lecturer Statistics</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/all.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                    <a class="nav-link" href="../exam/lecturer">Update Score</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5 pt-5">
        <h1 class="text-center">Lecturer Statistics</h1>
        <canvas id="myChart" width="400" height="200"></canvas>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const gradesData = [
                <c:forEach var="grade" items="${grades}">
                    {course: "${grade.student.courses[0].name}", score: ${grade.score}},
                </c:forEach>
            ];

            const courses = [...new Set(gradesData.map(grade => grade.course))];
            const scoreRange = Array.from({length: 11}, (_, i) => i);

            const datasets = courses.map(course => {
                const data = scoreRange.map(score => {
                    return gradesData.filter(g => g.course === course && Math.floor(g.score) === score).length;
                });

                return {
                    label: course,
                    data: data,
                    fill: false,
                    borderColor: getRandomColor(),
                    tension: 0.1
                };
            });

            const ctx = document.getElementById('myChart').getContext('2d');
            const myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: scoreRange,
                    datasets: datasets
                },
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Scores'
                            },
                            ticks: {
                                stepSize: 1
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Number of Students'
                            },
                            min: 0,
                            max: 7,
                            ticks: {
                                stepSize: 1
                            }
                        }
                    }
                }
            });

            function getRandomColor() {
                const letters = '0123456789ABCDEF';
                let color = '#';
                for (let i = 0; i < 6; i++) {
                    color += letters[Math.floor(Math.random() * 16)];
                }
                return color;
            }
        });
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.amazonaws.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
