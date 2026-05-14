package servlet;

import Clases.Plato;
import control.GestionarPlatos;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "PlatoServlet", urlPatterns = {"/PlatoServlet"})
public class PlatoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        String codigo = request.getParameter("codigo");

        GestionarPlatos gp = new GestionarPlatos();

        if ("eliminar".equals(accion) && codigo != null) {
            gp.eliminarPlato(codigo); 
            
            request.getSession().setAttribute("sesionPlatos", gp.getLista());
        } else {

            request.getSession().setAttribute("sesionPlatos", gp.getLista());
        }

        response.sendRedirect("listaItems.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        GestionarPlatos gp = new GestionarPlatos(); 
        
        try {

            String cod = request.getParameter("txtCodigo");
            String nom = request.getParameter("txtNombre");
            String des = request.getParameter("txtDescripcion");
            String preStr = request.getParameter("txtPrecio");

            double pre = 0.0;
            if (preStr != null && !preStr.isEmpty()) {
                pre = Double.parseDouble(preStr);
            }
            
            String cat = request.getParameter("txtCategoria");

            Plato nuevoP = new Plato(cod, nom, des, pre, cat); 
            gp.agregarOEditar(nuevoP); 

            sesion.setAttribute("sesionPlatos", gp.getLista());

            response.sendRedirect("listaItems.jsp");
            
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("adminItems.jsp?error=precio");
        } catch (Exception e) {
            e.printStackTrace(); 
            response.sendRedirect("adminItems.jsp?error=datos");
        }
    }
}