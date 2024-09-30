package com.example.sucursales;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/DreamHouse?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "Minecraft9@!";

    public static void main(String[] args) {
        Connection connection = null;

        try {
            // Cargar el driver de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establecer la conexión
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexión establecida con éxito.");

            // Consultar la tabla de empleados
            String selectSql = "SELECT * FROM Empleados";
            try (PreparedStatement pstmt = connection.prepareStatement(selectSql);
                 ResultSet rs = pstmt.executeQuery()) {

                // Mostrar los empleados en la consola
                System.out.println("Empleados en la base de datos:");
                while (rs.next()) {
                    String id = rs.getString("id");
                    String primerNombre = rs.getString("primerNombre");
                    String primerApellido = rs.getString("primerApellido");
                    // Agrega aquí otros campos que desees mostrar
                    System.out.printf("ID: %s, Nombre: %s %s%n", id, primerNombre, primerApellido);
                }
            }

        } catch (ClassNotFoundException e) {
            System.err.println("Driver no encontrado: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos: " + e.getMessage());
        } finally {
            // Cerrar la conexión si está abierta
            if (connection != null) {
                try {
                    connection.close();
                    System.out.println("Conexión cerrada correctamente.");
                } catch (SQLException e) {
                    System.err.println("Error al cerrar la conexión: " + e.getMessage());
                }
            }
        }
    }
}
