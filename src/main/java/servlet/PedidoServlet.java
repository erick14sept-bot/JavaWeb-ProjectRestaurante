package servlet;

import Clases.Cliente;
import Clases.Pedido;
import Clases.Plato;
import control.GestionarPedidos;
import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "PedidoServlet", urlPatterns = {"/PedidoServlet"})
public class PedidoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession sesion = request.getSession();
        String accion = request.getParameter("accion");
        
        Pedido miPedido = (Pedido) sesion.getAttribute("carrito");
        if (miPedido == null) {
            miPedido = new Pedido("V-" + (int)(Math.random() * 9000 + 1000), new Cliente("Invitado", ""));
        }

        if ("agregar".equals(accion)) {
            String codAdd = request.getParameter("cod");
            ArrayList<Plato> carta = (ArrayList<Plato>) sesion.getAttribute("sesionPlatos");
            if (carta != null) {
                for (Plato p : carta) {
                    if (p.getCodigoPlato().equals(codAdd)) {
                        miPedido.agregarPlato(p); 
                        break;
                    }
                }
            }
        } 
        else if ("eliminar".equals(accion)) {
            int idx = Integer.parseInt(request.getParameter("idx"));
            double precioResta = miPedido.getItems().get(idx).getPrecio();
            miPedido.setTotal(miPedido.getTotal() - precioResta);
            miPedido.getItems().remove(idx);
        }
        else if ("vaciar".equals(accion)) {
            sesion.removeAttribute("carrito");
            response.sendRedirect("hacerPedido.jsp");
            return;
        }

        sesion.setAttribute("carrito", miPedido);
        response.sendRedirect("hacerPedido.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        Pedido miPedido = (Pedido) sesion.getAttribute("carrito");
        
        if (miPedido != null && !miPedido.getItems().isEmpty()) {
            String nombreCli = request.getParameter("txtCliente");
            miPedido.getCliente().setNombre(nombreCli);

            ArrayList<Pedido> historial = (ArrayList<Pedido>) sesion.getAttribute("historialVentas");
            GestionarPedidos gp = new GestionarPedidos(historial);
            gp.registrarVenta(miPedido);

            sesion.setAttribute("historialVentas", gp.getHistorial());
            sesion.removeAttribute("carrito");
            
            response.sendRedirect("listaPedidos.jsp");
        } else {
            response.sendRedirect("hacerPedido.jsp");
        }
    }
}