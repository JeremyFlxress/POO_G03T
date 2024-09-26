package empleado.udb.edu.sv;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmpleadoServlet", urlPatterns = {"/EmpleadoServlet"})
public class ServletEmpleado extends HttpServlet {

    // Lista temporal para almacenar empleados (puedes cambiarlo por una base de datos)
    private List<Empleado> empleados = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Recoger los datos del formulario
        String numeroEmpleado = request.getParameter("numeroEmpleado");
        String primerNombre = request.getParameter("primerNombre");
        String segundoNombre = request.getParameter("segundoNombre");
        String primerApellido = request.getParameter("primerApellido");
        String segundoApellido = request.getParameter("segundoApellido");
        String direccion = request.getParameter("direccion");
        String categoriaLaboral = request.getParameter("categoriaLaboral");
        String salario = request.getParameter("salario");
        String correo = request.getParameter("correo");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String edad = request.getParameter("edad");
        String sucursal = request.getParameter("sucursal");

        // Crear un objeto empleado con los datos recibidos
        Empleado nuevoEmpleado = new Empleado(numeroEmpleado, primerNombre, segundoNombre, primerApellido,
                segundoApellido, direccion, categoriaLaboral, Double.parseDouble(salario),
                correo, fechaNacimiento, Integer.parseInt(edad), sucursal);

        // Agregar el nuevo empleado a la lista
        empleados.add(nuevoEmpleado);

        // Redirigir de nuevo al formulario para mostrar la lista de empleados
        request.setAttribute("empleados", empleados);
        request.getRequestDispatcher("empleadoForm.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Muestra la lista de empleados (acción leer)
        request.setAttribute("empleados", empleados);
        request.getRequestDispatcher("empleadoForm.jsp").forward(request, response);
    }
}
