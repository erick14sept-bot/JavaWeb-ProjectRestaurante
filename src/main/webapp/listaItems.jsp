<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Plato"%>
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
            </tbody>
        </table>
    </div>
</div>
<%@include file="lib/footer.jsp"%>