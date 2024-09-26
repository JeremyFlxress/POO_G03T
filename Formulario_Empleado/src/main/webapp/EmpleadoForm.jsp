<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Empleados</title>
    <link rel="stylesheet" type="text/css" href="css/empleado.css"> <!-- Enlace al archivo CSS -->
</head>
<body>
<div class="container">
    <h2>Registrar Empleado</h2>
    <form action="EmpleadoServlet" method="POST">
        <!-- Alineamos los nombres juntos -->
        <div class="form-group-inline">
            <div class="form-group">
                <label for="primerNombre">Primer Nombre:</label>
                <input type="text" id="primerNombre" name="primerNombre" required>
            </div>

            <div class="form-group">
                <label for="segundoNombre">Segundo Nombre:</label>
                <input type="text" id="segundoNombre" name="segundoNombre">
            </div>
        </div>

        <div class="form-group-inline">
            <div class="form-group">
                <label for="primerApellido">Primer Apellido:</label>
                <input type="text" id="primerApellido" name="primerApellido" required>
            </div>

            <div class="form-group">
                <label for="segundoApellido">Segundo Apellido:</label>
                <input type="text" id="segundoApellido" name="segundoApellido">
            </div>
        </div>

        <div class="form-group">
            <label for="numeroEmpleado">Número de Empleado:</label>
            <input type="text" id="numeroEmpleado" name="numeroEmpleado" required>
        </div>

        <div class="form-group">
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="direccion" required>
        </div>

        <div class="form-group">
            <label for="categoriaLaboral">Categoría Laboral:</label>
            <input type="text" id="categoriaLaboral" name="categoriaLaboral" required>
        </div>

        <div class="form-group">
            <label for="salario">Salario:</label>
            <input type="text" id="salario" name="salario" required>
        </div>

        <div class="form-group">
            <label for="correo">Correo Electrónico:</label>
            <input type="email" id="correo" name="correo" required>
        </div>

        <div class="form-group-inline">
            <div class="form-group">
                <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>
            </div>

            <div class="form-group">
                <label for="edad">Edad:</label>
                <input type="number" id="edad" name="edad" required>
            </div>
        </div>

        <div class="form-group">
            <label for="sucursal">Sucursal:</label>
            <input type="text" id="sucursal" name="sucursal" required>
        </div>

        <button type="submit" class="btn-submit">Registrar Empleado</button>
    </form>

    <!-- Lista de empleados -->
    <h2>Lista de Empleados</h2>
    <table class="empleados-table">
        <thead>
        <tr>
            <th>Número de Empleado</th>
            <th>Nombre Completo</th>
            <th>Categoría Laboral</th>
            <th>Salario</th>
            <th>Sucursal</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="empleado" items="${empleados}">
            <tr>
                <td>${empleado.numeroEmpleado}</td>
                <td>${empleado.primerNombre} ${empleado.segundoNombre} ${empleado.primerApellido} ${empleado.segundoApellido}</td>
                <td>${empleado.categoriaLaboral}</td>
                <td>${empleado.salario}</td>
                <td>${empleado.sucursal}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
