<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Plato"%>
<<<<<<< HEAD
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
        <h2 class="fw-bold">GestiÃ³n de <span class="text-orange">MenÃº</span></h2>
        <a href="adminItems.jsp" class="btn btn-primary shadow">
            <i class="bi bi-plus-lg"></i> Agregar Plato
        </a>
    </div>

    <div class="card table-dark-custom border-0 shadow">
        <table class="table table-dark table-hover align-middle mb-0">
            <thead>
                <tr>
                    <th class="ps-4">CÃ³digo</th>
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
                               onclick="return confirm('Â¿Eliminar este plato?')">Eliminar</a>
                        </td>
                    </tr>
                <% 
                    } 
                } 
                %>
=======
<%@include file="lib/header.jsp"%>

<%
    ArrayList<Plato> lista = (ArrayList<Plato>) session.getAttribute("sesionPlatos");
    if (lista == null) { lista = new ArrayList<>(); }

    String codDel = request.getParameter("delCod");
    if (codDel != null) {
        lista.removeIf(p -> p.getCodigoPlato().equals(codDel));
        session.setAttribute("sesionPlatos", lista);
    }

    String nom = request.getParameter("txtNombre");
    if (nom != null) {
        String cod = request.getParameter("txtCodigo");
        double pre = Double.parseDouble(request.getParameter("txtPrecio"));
        String cat = request.getParameter("txtCategoria");

        boolean actualizado = false;
        for (Plato p : lista) {
            if (p.getCodigoPlato().equals(cod)) {
                p.setNombrePlato(nom);
                p.setPrecio(pre);
                p.setCategoria(cat);
                actualizado = true;
                break;
            }
        }
        if (!actualizado) {
            lista.add(new Plato(cod, nom, "", pre, cat));
        }
        session.setAttribute("sesionPlatos", lista);
    }
%>

<div class="container">
    <div class="card shadow">
        <div class="card-header bg-dark text-white d-flex justify-content-between">
            <h4 class="mb-0">Carta de Menú</h4>
            <a href="adminItems.jsp" class="btn btn-sm btn-primary">Nuevo</a>
        </div>
        <table class="table table-hover mb-0">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Categoría</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% for (Plato p : lista) { %>
                <tr>
                    <td><%= p.getCodigoPlato() %></td>
                    <td><%= p.getNombrePlato() %></td>
                    <td>$<%= p.getPrecio() %></td>
                    <td><%= p.getCategoria() %></td>
                    <td>
                        <a href="adminItems.jsp?editCod=<%= p.getCodigoPlato() %>" class="btn btn-sm btn-warning">Editar</a>
                        <a href="listaItems.jsp?delCod=<%= p.getCodigoPlato() %>" class="btn btn-sm btn-danger">X</a>
                    </td>
                </tr>
                <% } %>
>>>>>>> 32877c08d85787c0eae24dd03842a75788bcd8b1
            </tbody>
        </table>
    </div>
</div>
<<<<<<< HEAD

=======
>>>>>>> 32877c08d85787c0eae24dd03842a75788bcd8b1
<%@include file="lib/footer.jsp"%>