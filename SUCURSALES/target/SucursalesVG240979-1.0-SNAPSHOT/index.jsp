<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.sucursales.Sucursal"%>
<%@ page import="com.example.sucursales.Empleado"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Sucursales</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
        function validarTelefono() {
            var telefono = document.getElementById("telefono").value;
            // Valida que el número no sea mayor a 8 dígitos
            if (telefono.length !== 8) {
                alert("El número de teléfono debe tener exactamente 8 dígitos.");
                return false;
            }
            // Valida que solo contenga números
            if (!/^\d+$/.test(telefono)) {
                alert("El número de teléfono solo puede contener números.");
                return false;
            }
            return true; // Validación exitosa
        }
    </script>
</head>
<body>
<div class="container mt-5">
    <h2>Registro de Sucursales</h2>

    <!-- Mostrar el mensaje -->
    <div>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
        <div class="alert alert-info"><%= message %></div>
        <%
            }
        %>
    </div>

    <!-- Formulario para agregar sucursal -->
    <form method="post" action="HelloServlet" onsubmit="return validarTelefono();">
        <div class="form-group">
            <label for="direccion">Dirección</label>
            <input type="text" class="form-control" id="direccion" name="direccion" required>
        </div>
        <div class="form-group">
            <label for="telefono">Teléfono</label>
            <input type="text" class="form-control" id="telefono" name="telefono" required>
        </div>
        <div class="form-group">
            <label for="empleadoEncargado">Empleado Encargado</label>
            <input type="text" class="form-control" id="empleadoEncargado" name="empleadoEncargado" required>
        </div>
        <button type="submit" class="btn btn-primary">Registrar Sucursal</button>
    </form>

    <!-- Tabla para mostrar sucursales -->
    <h3 class="mt-5">Lista de Sucursales</h3>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Dirección</th>
            <th>Teléfono</th>
            <th>Empleado Encargado</th>
            <th>Acciones</th> <!-- Nueva columna para acciones -->
        </tr>
        </thead>
        <tbody>
        <%
            List<Sucursal> sucursales = (List<Sucursal>) request.getAttribute("sucursales");
            if (sucursales != null && !sucursales.isEmpty()) {
                for (Sucursal sucursal : sucursales) {
        %>
        <tr>
            <td><%= sucursal.getIdSucursal() %></td>
            <td><%= sucursal.getDireccion() %></td>
            <td><%= sucursal.getTelefono() %></td>
            <td><%= sucursal.getEmpleadoEncargado() %></td>
            <td>
                <!-- Botón para eliminar la sucursal -->
                <form method="post" action="HelloServlet" style="display:inline;">
                    <input type="hidden" name="idSucursal" value="<%= sucursal.getIdSucursal() %>">
                    <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                </form>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5" class="text-center">No hay sucursales registradas.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <!-- Botón para cargar sucursales -->
    <form method="get" action="HelloServlet">
        <button type="submit" class="btn btn-secondary mt-3">Cargar Sucursales</button>
    </form>
</div>
</body>
</html>
