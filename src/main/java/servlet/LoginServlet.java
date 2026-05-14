package servlet;

import Clases.Persona;
import control.GestionarUsuarios;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        GestionarUsuarios gu = new GestionarUsuarios(); 
        
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