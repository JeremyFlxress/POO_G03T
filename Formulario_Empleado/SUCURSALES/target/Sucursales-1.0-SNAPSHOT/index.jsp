<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.sucursales.Sucursal"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Sucursales</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
        function validarTelefono() {
            var telefono = document.getElementById("telefono").value;
            // Validar que el número no sea mayor a 8 dígitos
            if (telefono.length !== 8) {
                alert("El número de teléfono debe tener exactamente 8 dígitos.");
                return false;
            }
            // Validar que solo contenga números
            if (!/^\d+$/.test(telefono)) {
                alert("El número de teléfono solo puede contener números.");
                return false;
            }
            // Validar que no sea un número negativo
            if (parseInt(telefono) < 0) {
                alert("El número de teléfono no puede ser negativo.");
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
            <label for="ciudad">Ciudad</label>
            <select class="form-control" id="ciudad" name="ciudad" required>
                <option value="">Seleccione una ciudad</option>
                <option value="San Salvador">San Salvador</option>
                <option value="Santa Ana">Santa Ana</option>
                <option value="San Miguel">San Miguel</option>
                <option value="La Libertad">La Libertad</option>
                <option value="Sonsonate">Sonsonate</option>
                <option value="Ahuachapan">Ahuachapan</option>
                <option value="Cuscatlán">Cuscatlán</option>
                <option value="La Paz">La Paz</option>
                <option value="Morazán">Morazán</option>
                <option value="San Vicente">San Vicente</option>
                <option value="Cabañas">Cabañas</option>
                <option value="Chalatenango">Chalatenango</option>
                <option value="La Unión">La Unión</option>
                <option value="Metapán">Metapán</option>
                <option value="Zacatecoluca">Zacatecoluca</option>
                <option value="Soyapango">Soyapango</option>
                <option value="Santa Tecla">Santa Tecla</option>
                <option value="San Martín">San Martín</option>
                <option value="Ilopango">Ilopango</option>
                <option value="Apopa">Apopa</option>
                <option value="Atiquizaya">Atiquizaya</option>
                <option value="Coatepeque">Coatepeque</option>
                <option value="San Francisco Gotera">San Francisco Gotera</option>
                <option value="San Vicente">San Vicente</option>
                <option value="Panchimalco">Panchimalco</option>
                <option value="Tocachico">Tocachico</option>
                <option value="Tejutepeque">Tejutepeque</option>
                <option value="Quezaltepeque">Quezaltepeque</option>
                <option value="Candelaria de la Frontera">Candelaria de la Frontera</option>
            </select>
        </div>
        <div class="form-group">
            <label for="departamento">Departamento</label>
            <select class="form-control" id="departamento" name="departamento" required>
                <option value="">Seleccione un departamento</option>
                <option value="San Salvador">San Salvador</option>
                <option value="Santa Ana">Santa Ana</option>
                <option value="San Miguel">San Miguel</option>
                <option value="La Libertad">La Libertad</option>
                <option value="Sonsonate">Sonsonate</option>
                <option value="Ahuachapan">Ahuachapan</option>
                <option value="Cuscatlán">Cuscatlán</option>
                <option value="La Paz">La Paz</option>
                <option value="Morazán">Morazán</option>
                <option value="San Vicente">San Vicente</option>
                <option value="Cabañas">Cabañas</option>
                <option value="Chalatenango">Chalatenango</option>
                <option value="La Unión">La Unión</option>
            </select>
        </div>
        <div class="form-group">
            <label for="telefono">Teléfono</label>
            <input type="text" class="form-control" id="telefono" name="telefono" required>
        </div>
        <button type="submit" class="btn btn-primary">Registrar Sucursal</button>
        <button type="button" class="btn btn-secondary" onclick="window.location.reload();">Cargar Tabla</button>
    </form>

    <!-- Tabla para mostrar sucursales -->
    <h3 class="mt-5">Lista de Sucursales</h3>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Dirección</th>
            <th>Ciudad</th>
            <th>Departamento</th>
            <th>Teléfono</th>
            <th>Empleado Encargado</th>
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
            <td><%= sucursal.getCiudad() %></td>
            <td><%= sucursal.getDepartamento() %></td>
            <td><%= sucursal.getTelefono() %></td>
            <td><%= sucursal.getEmpleadoEncargado() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6" class="text-center">No hay sucursales registradas.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>