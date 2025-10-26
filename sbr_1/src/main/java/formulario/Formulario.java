/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package formulario;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/procesarFormulario") // Asegúrate que coincida con el 'action' del formulario JSP
public class Formulario extends HttpServlet {

    // Credenciales válidas (solo ejemplo)
    private static final String USUARIO_VALIDO = "jmelo";
    private static final String CLAVE_VALIDA = "123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Si alguien entra directamente al servlet, se redirige al login
        response.sendRedirect("inicio_sesion.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener los datos enviados desde el formulario
        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        // Validación de credenciales
        if (USUARIO_VALIDO.equals(usuario) && CLAVE_VALIDA.equals(clave)) {

            // Crear o recuperar sesión existente
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);

            // Redirigir a la página de bienvenida
            response.sendRedirect("Bienvenido.jsp");

        } else {
            // Si el login falla, mostrar la página de error personalizada
            request.setAttribute("error", "Usuario o contraseña incorrectos.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
