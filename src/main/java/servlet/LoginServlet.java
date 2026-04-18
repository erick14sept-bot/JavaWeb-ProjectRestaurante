package servlet;

import Clases.Persona;
import control.GestionarUsuarios;
import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();

        ArrayList<Persona> listaSesion = (ArrayList<Persona>) sesion.getAttribute("usuariosFood");

        GestionarUsuarios gu = new GestionarUsuarios(listaSesion);

        sesion.setAttribute("usuariosFood", gu.getLista());

        String correo = request.getParameter("u");
        String pass = request.getParameter("p");

        Persona usuarioLogueado = gu.validarLogin(correo, pass);

        if (usuarioLogueado != null) {
            sesion.setAttribute("userLog", usuarioLogueado);
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp?error=true");
        }
    }
}