<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Plato"%>
<%@page import="Clases.Persona"%>
<%@page import="Clases.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="lib/header.jsp"%>

<%
    if (logueado == null || !(logueado instanceof Administrador)) {
        response.sendRedirect("index.jsp");
        return;
    }

    ArrayList<Plato> listaP = (ArrayList<Plato>) session.getAttribute("sesionPlatos");
    if (listaP == null) {
        listaP = new ArrayList<>();
    }
%>

<style>
    body { background-color: #121212 !important; color: white; }
    .container { background: transparent !important; box-shadow: none !important; }
    .table-dark-custom { background-color: #1e1e1e; border-radius: 15px; overflow: hidden; }
    .text-orange { color: #ff9800 !important; }
</style>

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold">Gestión de <span class="text-orange">Menú</span></h2>
        <a href="adminItems.jsp" class="btn btn-primary shadow">
            <i class="bi bi-plus-lg"></i> Agregar Plato
        </a>
    </div>

    <div class="card table-dark-custom border-0 shadow">
        <table class="table table-dark table-hover align-middle mb-0">
            <thead>
                <tr>
                    <th class="ps-4">Código</th>
                    <th>Nombre del Plato</th>
                    <th>Precio</th>
                    <th class="text-center">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% if (listaP.isEmpty()) { %>
                    <tr>
                        <td colspan="4" class="text-center py-5 text-muted">No hay platos registrados.</td>
                    </tr>
                <% } else { 
                    for (Plato p : listaP) { 
                %>
                    <tr>
                        <td class="ps-4"><span class="badge bg-secondary"><%= p.getCodigoPlato() %></span></td>
                        <td class="fw-bold"><%= p.getNombrePlato() %></td>
                        <td class="text-success fw-bold">$<%= p.getPrecio() %></td>
                        <td class="text-center">
                            <a href="adminItems.jsp?editCod=<%= p.getCodigoPlato() %>" class="btn btn-sm btn-outline-warning">Editar</a>
                            <a href="ItemServlet?accion=eliminar&cod=<%= p.getCodigoPlato() %>" 
                               class="btn btn-sm btn-outline-danger ms-1"
                               onclick="return confirm('¿Eliminar este plato?')">Eliminar</a>
                        </td>
                    </tr>
                <% 
                    } 
                } 
                %>
            </tbody>
        </table>
    </div>
</div>

<%@include file="lib/footer.jsp"%>