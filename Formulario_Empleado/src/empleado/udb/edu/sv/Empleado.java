package empleado.udb.edu.sv;

public class Empleado {
    private String numeroEmpleado;
    private String primerNombre;
    private String segundoNombre;
    private String primerApellido;
    private String segundoApellido;
    private String direccion;
    private String categoriaLaboral;
    private double salario;
    private String correo;
    private String fechaNacimiento;
    private int edad;
    private String sucursal;

    public Empleado(String numeroEmpleado, String primerNombre, String segundoNombre, String primerApellido,
                    String segundoApellido, String direccion, String categoriaLaboral, double salario,
                    String correo, String fechaNacimiento, int edad, String sucursal) {
        this.numeroEmpleado = numeroEmpleado;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.direccion = direccion;
        this.categoriaLaboral = categoriaLaboral;
        this.salario = salario;
        this.correo = correo;
        this.fechaNacimiento = fechaNacimiento;
        this.edad = edad;
        this.sucursal = sucursal;
    }

    // Getters y setters (puedes generar todos los métodos getters y setters necesarios)
    public String getNumeroEmpleado() {
        return numeroEmpleado;
    }

    public void setNumeroEmpleado(String numeroEmpleado) {
        this.numeroEmpleado = numeroEmpleado;
    }

    public String getPrimerNombre() {
        return primerNombre;
    }

    public void setPrimerNombre(String primerNombre) {
        this.primerNombre = primerNombre;
    }

    // Resto de getters y setters...
}
