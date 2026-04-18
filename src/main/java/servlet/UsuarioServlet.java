package servlet;

import Clases.Administrador;
import Clases.Persona;
import Clases.Vendedor;
import control.GestionarUsuarios;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

    private static final String MASTER_KEY = "FOODEX464";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        ArrayList<Persona> listaSesion = (ArrayList<Persona>) sesion.getAttribute("usuariosFood");
        GestionarUsuarios gu = new GestionarUsuarios(listaSesion);

        String nom = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String pass = request.getParameter("txtPassword");
        String ciu = request.getParameter("ciudad");
        String con = request.getParameter("contacto");
        String tipo = request.getParameter("tipoEmpleado");
        String codSeguridad = request.getParameter("txtSecurityCode");

        Persona usuarioLogueado = (Persona) sesion.getAttribute("userLog");
        boolean esAdminLogueado = (usuarioLogueado instanceof Administrador);

        if ("Administrador".equals(tipo) && !esAdminLogueado && !MASTER_KEY.equals(codSeguridad)) {
            String origen = request.getParameter("origen");
            String redir = ("registro".equals(origen)) ? "registro.jsp" : "adminUsuarios.jsp";
            response.sendRedirect(redir + "?errorSeguridad=true");
            return;
        }

        Persona nuevoU;
        if ("Administrador".equals(tipo)) {
            nuevoU = new Administrador(nom, ciu, correo, con, pass, tipo);
        } else {
            nuevoU = new Vendedor(nom, ciu, correo, con, pass, tipo);
        }

        gu.agregarOEditarUsuario(nuevoU);
        sesion.setAttribute("usuariosFood", gu.getLista());
        
        String origen = request.getParameter("origen");
        if ("registro".equals(origen)) {
            response.sendRedirect("login.jsp?reg=ok");
        } else {
            response.sendRedirect("listaUsuarios.jsp");
        }
    }
}