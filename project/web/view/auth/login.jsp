<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/loginPage.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
    <div class="container">
        <h1>Login</h1>
        <form action="login" method="POST">
            <div class="form-group">
                <i class="fas fa-user"></i>
                <input type="text" id="username" name="username" class="form-control" placeholder="Username"/>
            </div>
            <div class="form-group">
                <i class="fas fa-lock"></i>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password"/>
            </div>
            
            <input type="submit" value="Login" class="btn-submit"/>
        </form>
        
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
