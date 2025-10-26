/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Svinicio_sesion")
public class Svinicio_sesion extends HttpServlet {

    private static final String USUARIO_VALIDO = "jmelo";
    private static final String CLAVE_VALIDA = "123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirigir al formulario de inicio de sesión si acceden por GET
        response.sendRedirect("inicio_sesion.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        if (USUARIO_VALIDO.equals(usuario) && CLAVE_VALIDA.equals(clave)) {
            // Crear la sesión y guardar el usuario
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);

            // Redirigir a la página de bienvenida
            response.sendRedirect("bienvenido.jsp");
        } else {
            // Enviar mensaje de error y mostrar la página de inicio sesión
            request.setAttribute("error", "Usuario o contraseña incorrectos.");
            request.getRequestDispatcher("inicio_sesion.jsp").forward(request, response);
        }
    }
}
