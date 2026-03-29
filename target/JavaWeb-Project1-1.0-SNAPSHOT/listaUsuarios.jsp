<%@page import="java.util.ArrayList"%>
<%@page import="Clases.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="lib/header.jsp"%>

<%

    ArrayList<Persona> listaU = (ArrayList<Persona>) session.getAttribute("usuariosFood");
    if (listaU == null) {
        listaU = new ArrayList<>();
    }

    String correoEliminar = request.getParameter("delCor");
    if (correoEliminar != null) {
        listaU.removeIf(u -> u.getCorreo().equalsIgnoreCase(correoEliminar));
        session.setAttribute("usuariosFood", listaU);
    }

    String correoForm = request.getParameter("correo");
    if (correoForm != null) {
        String nom = request.getParameter("nombre");
        String ciu = request.getParameter("ciudad");
        String con = request.getParameter("contacto");
        String pass = request.getParameter("txtPassword");
        String tipo = request.getParameter("tipoEmpleado");

        boolean encontrado = false;
        

        for (Persona u : listaU) {
            if (u.getCorreo().equalsIgnoreCase(correoForm)) {
                u.setNombre(nom);
                u.setCiudad(ciu);
                u.setContacto(con);
                u.setPassword(pass); 
                encontrado = true;
                break;
            }
        }

        if (!encontrado) {
            Persona nuevoU;
            if (tipo != null && tipo.equals("Vendedor")) {
                nuevoU = new Vendedor(nom, ciu, correoForm, con, pass, "Vendedor");
            } else {
                nuevoU = new Administrador(nom, ciu, correoForm, con, pass,"Administrador");
            }
            nuevoU.setPassword(pass);
            listaU.add(nuevoU);
        }

        session.setAttribute("usuariosFood", listaU);
    }
%>

<div class="main-wrapper">
    <div class="container mt-5">
        <div class="d-flex justify-content-between mb-4">
            <h2 class="fw-bold text-dark">Personal de FoodExpress</h2>
            <a href="adminUsuarios.jsp" class="btn btn-success shadow-sm">Nuevo Usuario</a>
        </div>

        <div class="card shadow-sm border-0">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>Nombre</th>
                        <th>Correo (ID)</th>
                        <th>Rol</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (listaU.isEmpty()) { %>
                        <tr><td colspan="4" class="text-center py-4 text-muted">No hay personal registrado.</td></tr>
                    <% } else { 
                        for (Persona u : listaU) { %>
                        <tr>
                            <td><strong><%= u.getNombre() %></strong></td>
                            <td><%= u.getCorreo() %></td>
                            <td>
                                <span class="badge rounded-pill <%= (u instanceof Vendedor) ? "bg-info text-dark" : "bg-primary" %>">
                                    <%= (u instanceof Vendedor) ? "Vendedor" : "Administrador" %>
                                </span>
                            </td>
                            <td class="text-center">
                                <a href="adminUsuarios.jsp?editCor=<%= u.getCorreo() %>" class="btn btn-sm btn-warning">
                                    <i class="bi bi-pencil-square"></i> Editar
                                </a>
                                <a href="listaUsuarios.jsp?delCor=<%= u.getCorreo() %>" 
                                   class="btn btn-sm btn-danger" 
                                   onclick="return confirm('¿Eliminar usuario?')">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </td>
                        </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<table class="table table-hover">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Correo</th>
            <th>Rol / Cargo</th>
        </tr>
    </thead>
    <tbody>
        <% 
        ArrayList<Persona> lista = (ArrayList<Persona>) session.getAttribute("usuariosFood");
        if (lista != null) {
            for (Persona p : lista) { 
                String cargo = "Usuario";
                if (p instanceof Administrador) {
                    cargo = ((Administrador)p).getTipoEmpleado();
                } 
        %>
            <tr>
                <td><%= p.getNombre() %></td>
                <td><%= p.getCorreo() %></td>
                <td>
                    <span class="badge <%= cargo.equals("Administrador") ? "bg-danger" : "bg-info" %>">
                        <%= cargo %>
                    </span>
                </td>
            </tr>
        <% } } %>
    </tbody>
</table>
<%@include file="lib/footer.jsp"%>