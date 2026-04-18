<%@page import="java.util.ArrayList"%>
<%@page import="Clases.*"%>
<%@include file="lib/header.jsp"%>

<%
    ArrayList<Persona> listaU = (ArrayList<Persona>) session.getAttribute("usuariosFood");
    if (listaU == null) { listaU = new ArrayList<>(); }
%>

<div class="container mt-5">
    <h2 class="text-orange">Equipo FoodExpress</h2>
    <table class="table table-dark">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <% for (Persona u : listaU) { %>
            <tr>
                <td><%= u.getNombre() %></td>
                <td><%= u.getCorreo() %></td>
                <td>
                    <a href="adminUsuarios.jsp?editCor=<%= u.getCorreo() %>" class="btn btn-warning">Editar</a>
                    
                    <a href="UsuarioServlet?accion=eliminar&correo=<%= u.getCorreo() %>" class="btn btn-danger">Eliminar</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
        
<%
    if (logueado == null || logueado instanceof Clases.Vendedor) {
        response.sendRedirect("index.jsp");
        return;
    }
%>