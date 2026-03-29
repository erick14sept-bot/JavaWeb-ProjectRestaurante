<%@page import="java.util.ArrayList"%>
<%@page import="Clases.*"%>
<%@include file="lib/header.jsp"%>

<%
    ArrayList<Pedido> historial = (ArrayList<Pedido>) session.getAttribute("historialVentas");
    double granTotal = 0;
    if (historial != null) {
        for(Pedido p : historial) granTotal += p.getTotal();
    }
%>

<div class="main-wrapper">
    <div class="container mt-5">
        <div class="d-flex justify-content-between mb-4">
            <h2 class="fw-bold">Historial de Ventas</h2>
            <div class="text-end">
                <span class="text-muted small">Recaudación Total:</span>
                <h4 class="text-success fw-bold">$<%= granTotal %></h4>
            </div>
        </div>

        <div class="card shadow-sm border-0">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>ID Venta</th>
                        <th>Cliente</th>
                        <th>Items</th>
                        <th>Total</th>
                        <th class="text-center">Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (historial == null || historial.isEmpty()) { %>
                        <tr><td colspan="5" class="text-center py-4 text-muted">Aún no hay ventas.</td></tr>
                    <% } else { 
                        for (Pedido p : historial) { %>
                        <tr>
                            <td><span class="badge bg-secondary"><%= p.getIdVenta() %></span></td>
                            <td><strong><%= p.getCliente().getNombre() %></strong></td>
                            <td><%= p.getItems().size() %></td>
                            <td class="fw-bold">$<%= p.getTotal() %></td>
                            <td class="text-center"><span class="badge bg-success">Completado</span></td>
                        </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>
        <div class="mt-4">
            <a href="index.jsp" class="btn btn-outline-secondary">Volver al Inicio</a>
        </div>
    </div>
</div>

<%@include file="lib/footer.jsp"%>