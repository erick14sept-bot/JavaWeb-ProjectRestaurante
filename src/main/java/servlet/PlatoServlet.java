package servlet;

import Clases.Plato;
import control.GestionarPlatos;
import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "PlatoServlet", urlPatterns = {"/PlatoServlet"})
public class PlatoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();

        ArrayList<Plato> listaSesion = (ArrayList<Plato>) sesion.getAttribute("sesionPlatos");
        if (listaSesion == null) { 
            listaSesion = new ArrayList<>(); 
        }

        GestionarPlatos gp = new GestionarPlatos(listaSesion);
        
        try {
            String cod = request.getParameter("txtCodigo");
            String nom = request.getParameter("txtNombre");
            String des = request.getParameter("txtDescripcion");
            String preStr = request.getParameter("txtPrecio");
            double pre = (preStr != null && !preStr.isEmpty()) ? Double.parseDouble(preStr) : 0.0;
            String cat = request.getParameter("txtCategoria");

            Plato nuevoP = new Plato(cod, nom, des, pre, cat); 
            
            gp.agregarOEditar(nuevoP);

            sesion.setAttribute("sesionPlatos", gp.getLista());
            response.sendRedirect("listaItems.jsp");
            
        } catch (Exception e) {
            response.sendRedirect("adminItems.jsp?error=datos");
        }
    }
}