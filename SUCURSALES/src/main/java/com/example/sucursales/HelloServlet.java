package com.example.sucursales;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String empleadoEncargado = request.getParameter("empleadoEncargado");
        String idSucursalStr = request.getParameter("idSucursal");

        Connection conn = null;

        try {
            conn = ConexionDB.getConnection();
            if (conn != null) {
                if (idSucursalStr != null) {
                    // Eliminar sucursal
                    int idSucursal = Integer.parseInt(idSucursalStr);
                    String deleteSql = "DELETE FROM Sucursales WHERE id = ?";
                    try (PreparedStatement deletePstmt = conn.prepareStatement(deleteSql)) {
                        deletePstmt.setInt(1, idSucursal);
                        deletePstmt.executeUpdate();
                        request.getSession().setAttribute("message", "Sucursal eliminada exitosamente.");
                    }
                } else {
                    // Insertar nueva sucursal
                    String insertSql = "INSERT INTO Sucursales (direccion, telefono, empleadoEncargado) VALUES (?, ?, ?)";
                    try (PreparedStatement pstmt = conn.prepareStatement(insertSql, PreparedStatement.RETURN_GENERATED_KEYS)) {
                        pstmt.setString(1, direccion);
                        pstmt.setString(2, telefono);
                        pstmt.setString(3, empleadoEncargado);
                        pstmt.executeUpdate();

                        // Obtener la ID de la sucursal recién creada
                        ResultSet generatedKeys = pstmt.getGeneratedKeys();
                        if (generatedKeys.next()) {
                            int sucursalId = generatedKeys.getInt(1);
                            // Actualizar la tabla de empleados con la ID de la sucursal
                            String updateEmpleadoSql = "UPDATE Empleados SET idSucursal = ? WHERE id = ?";
                            try (PreparedStatement updatePstmt = conn.prepareStatement(updateEmpleadoSql)) {
                                updatePstmt.setInt(1, sucursalId);
                                updatePstmt.setString(2, empleadoEncargado);
                                updatePstmt.executeUpdate();
                            }
                        }
                        request.getSession().setAttribute("message", "Sucursal registrada exitosamente.");
                    }
                }
            } else {
                request.getSession().setAttribute("message", "No se pudo establecer conexión a la base de datos.");
            }
        } catch (SQLException e) {
            if (e.getMessage().contains("foreign key constraint fails")) {
                request.getSession().setAttribute("message", "Ningún empleado encontrado.");
            } else {
                request.getSession().setAttribute("message", "Error al registrar o eliminar la sucursal: " + e.getMessage());
            }
        } finally {
            ConexionDB.closeConnection(conn);
        }

        response.sendRedirect(request.getContextPath() + "/HelloServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Sucursal> sucursales = getSucursales();
        request.setAttribute("sucursales", sucursales);

        String message = (String) request.getSession().getAttribute("message");
        if (message != null) {
            request.setAttribute("message", message);
            request.getSession().removeAttribute("message");
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private List<Sucursal> getSucursales() {
        List<Sucursal> sucursales = new ArrayList<>();
        String selectSql = "SELECT id, direccion, telefono, empleadoEncargado FROM Sucursales";
        Connection conn = null;

        try {
            conn = ConexionDB.getConnection();
            if (conn != null) {
                try (PreparedStatement pstmt = conn.prepareStatement(selectSql);
                     ResultSet rs = pstmt.executeQuery()) {

                    while (rs.next()) {
                        Sucursal sucursal = new Sucursal();
                        sucursal.setIdSucursal(rs.getInt("id"));
                        sucursal.setDireccion(rs.getString("direccion"));
                        sucursal.setTelefono(rs.getString("telefono"));
                        sucursal.setEmpleadoEncargado(rs.getString("empleadoEncargado")); // Aquí obtiene el ID del empleado
                        sucursales.add(sucursal);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener sucursales: " + e.getMessage());
        } finally {
            ConexionDB.closeConnection(conn);
        }

        return sucursales;
    }
}
