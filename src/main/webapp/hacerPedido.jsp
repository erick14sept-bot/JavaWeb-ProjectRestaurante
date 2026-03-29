<%@page import="java.util.ArrayList"%>
<%@page import="Clases.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="lib/header.jsp"%>

<%
    ArrayList<Plato> carta = (ArrayList<Plato>) session.getAttribute("sesionPlatos");
    Pedido miPedido = (Pedido) session.getAttribute("carrito");

    if (request.getParameter("nuevo") != null) {
        session.removeAttribute("carrito");
        response.sendRedirect("hacerPedido.jsp");
        return;
    }

    if (miPedido == null) {
        String idV = "V-" + (int)(Math.random() * 9000 + 1000);
        miPedido = new Pedido(); 
        miPedido.setIdVenta(idV);
        miPedido.setCliente(new Cliente("Invitado", "---"));
        session.setAttribute("carrito", miPedido);
    }

    String codAdd = request.getParameter("addCod");
    if (codAdd != null && carta != null) {
        for (Plato p : carta) {
            if (p.getCodigoPlato().equals(codAdd)) {
                miPedido.agregarPlato(p);
                break;
            }
        }
    }

    String delIdx = request.getParameter("delIdx");
    if (delIdx != null) {
        int idx = Integer.parseInt(delIdx);
        double precioResta = miPedido.getItems().get(idx).getPrecio();
        miPedido.setTotal(miPedido.getTotal() - precioResta);
        miPedido.getItems().remove(idx);
    }
%>

<div class="main-wrapper">
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-8">
                <h2 class="fw-bold mb-4">Menú FoodExpress</h2>
                <div class="row g-3">
                    <% if (carta == null || carta.isEmpty()) { %>
                        <div class="alert alert-warning">No hay platos registrados.</div>
                    <% } else { 
                        for (Plato p : carta) { %>
                        <div class="col-md-6">
                            <div class="card border-0 shadow-sm">
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="mb-0 fw-bold"><%= p.getNombrePlato() %></h6>
                                        <span class="text-success small">$<%= p.getPrecio() %></span>
                                    </div>
                                    <a href="hacerPedido.jsp?addCod=<%= p.getCodigoPlato() %>" class="btn btn-warning btn-sm">+</a>
                                </div>
                            </div>
                        </div>
                    <% } } %>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card bg-dark text-white shadow">
                    <div class="card-header border-secondary text-center">
                        <small class="text-muted">Orden: <%= miPedido.getIdVenta() %></small>
                    </div>
                    <div class="card-body">
                        <div class="mb-3" style="max-height: 200px; overflow-y: auto;">
                            <% int i = 0; for (Plato item : miPedido.getItems()) { %>
                                <div class="d-flex justify-content-between mb-2 small">
                                    <span><%= item.getNombrePlato() %></span>
                                    <span>$<%= item.getPrecio() %> 
                                        <a href="hacerPedido.jsp?delIdx=<%= i %>" class="text-danger ms-2"><i class="bi bi-x-circle"></i></a>
                                    </span>
                                </div>
                            <% i++; } %>
                        </div>
                        <hr class="bg-secondary">
                        <h4 class="text-warning text-end">Total: $<%= miPedido.getTotal() %></h4>
                        <div class="d-grid gap-2 mt-3">
                            <a href="verPedido.jsp" class="btn btn-primary <%= miPedido.getItems().isEmpty()?"disabled":"" %>">Confirmar</a>
                            <a href="hacerPedido.jsp?nuevo=true" class="btn btn-outline-danger btn-sm">Vaciar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="lib/footer.jsp"%>