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

        // 1. Instanciamos el gestor. 
        // Al hacer esto, el constructor de GestionarPlatos corre leerArchivo() 
        // y trae lo que ya esté guardado en el TXT.
        GestionarPlatos gp = new GestionarPlatos(); 
        
        try {
            // Captura de datos del formulario JSP
            String cod = request.getParameter("txtCodigo");
            String nom = request.getParameter("txtNombre");
            String des = request.getParameter("txtDescripcion");
            String preStr = request.getParameter("txtPrecio");
            
            // Validación básica del precio
            double pre = 0.0;
            if (preStr != null && !preStr.isEmpty()) {
                pre = Double.parseDouble(preStr);
            }
            
            String cat = request.getParameter("txtCategoria");
            
            // 2. Creamos el objeto Plato
            Plato nuevoP = new Plato(cod, nom, des, pre, cat); 
            
            // 3. LLAMADA CRÍTICA: agregarOEditar(nuevoP) añade el plato a la lista 
            // y automáticamente llama a escribirArchivo() para grabarlo en el disco.
            gp.agregarOEditar(nuevoP); 
            
            // 4. Actualizamos la variable de sesión.
            // MUY IMPORTANTE: Asegúrate de que en tu listaItems.jsp el forEach
            // o el scriptlet use el nombre "sesionPlatos".
            sesion.setAttribute("sesionPlatos", gp.getLista());
            
            // Redirección al éxito
            response.sendRedirect("listaItems.jsp");
            
        } catch (NumberFormatException e) {
            // Error si el precio no es un número válido
            e.printStackTrace();
            response.sendRedirect("adminItems.jsp?error=precio");
        } catch (Exception e) {
            // Cualquier otro error (como falta de permisos en el Disco C)
            e.printStackTrace(); 
            response.sendRedirect("adminItems.jsp?error=datos");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // En caso de que se acceda por GET, simplemente refrescamos la lista desde el archivo
        GestionarPlatos gp = new GestionarPlatos();
        request.getSession().setAttribute("sesionPlatos", gp.getLista());
        response.sendRedirect("listaItems.jsp");
    }
}