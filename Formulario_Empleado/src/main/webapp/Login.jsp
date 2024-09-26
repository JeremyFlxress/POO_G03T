<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <h2 class="text-center">Iniciar Sesión</h2>
            <form action="LoginServlet" method="post">
                <!-- Mostrar mensaje de error si las credenciales no son válidas -->
                <%
                    String error = (String) request.getAttribute("error");
                    if (error != null) {
                %>
                <div class="alert alert-danger" role="alert">
                    <%= error %>
                </div>
                <%
                    }
                %>

                <div class="form-group mb-3">
                    <label for="username">Usuario:</label>
                    <input type="text" name="username" class="form-control" required>
                </div>

                <div class="form-group mb-3">
                    <label for="password">Contraseña:</label>
                    <input type="password" name="password" class="form-control" required>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Ingresar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
