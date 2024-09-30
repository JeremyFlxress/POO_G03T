package com.example.sucursales;

public class Sucursal {
    private int idSucursal;
    private String direccion;
    private String telefono;
    private String empleadoEncargado; // Cambiado a String según la tabla Empleados

    // Métodos de acceso
    public int getIdSucursal() {
        return idSucursal;
    }

    public void setIdSucursal(int idSucursal) {
        this.idSucursal = idSucursal;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmpleadoEncargado() {
        return empleadoEncargado;
    }

    public void setEmpleadoEncargado(String empleadoEncargado) {
        this.empleadoEncargado = empleadoEncargado;
    }
}
