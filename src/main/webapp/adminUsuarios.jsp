<%@page import="Clases.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="lib/header.jsp"%>
<%
    String correoEdit = request.getParameter("editCor");
    Persona pEdit = null;
    if (correoEdit != null) {
        ArrayList<Persona> lista = (ArrayList<Persona>) session.getAttribute("usuariosFood");
        if (lista != null) {
            for (Persona u : lista) {
                if (u.getCorreo().equalsIgnoreCase(correoEdit)) { pEdit = u; break; }
            }
        }
    }
%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card bg-dark text-white border-warning shadow">
                <div class="card-header bg-warning text-dark py-3">
                    <h4 class="mb-0"><i class="bi bi-person-gear"></i> <%= (pEdit != null) ? "Actualizar Usuario" : "Nuevo Personal"%></h4>
                </div>
                <div class="card-body p-4">
                    <form action="UsuarioServlet" method="POST">
                        <div class="mb-3">
                            <label class="form-label fw-bold">Nombre Completo</label>
                            <input type="text" name="nombre" class="form-control" value="<%= (pEdit != null) ? pEdit.getNombre() : ""%>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold text-orange">Correo (ID Único)</label>
                            <input type="email" name="correo" class="form-control" value="<%= (pEdit != null) ? pEdit.getCorreo() : ""%>" <%= (pEdit != null) ? "readonly" : "required"%>>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Contraseña</label>
                            <input type="password" name="txtPassword" class="form-control" value="<%= (pEdit != null) ? pEdit.getPassword() : ""%>" required>
                        </div>
                        <div class="row mb-4">
                            <div class="col-md-6">
                                <label class="form-label small">Ciudad</label>
                                <input type="text" name="ciudad" class="form-control" value="<%= (pEdit != null) ? pEdit.getCiudad() : "Pasto"%>">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label small">Teléfono</label>
                                <input type="text" name="contacto" class="form-control" value="<%= (pEdit != null) ? pEdit.getContacto() : ""%>">
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-bold">Rol</label>
                            <select name="tipoEmpleado" class="form-select" <%= (pEdit != null) ? "disabled" : ""%>>
                                <option value="Vendedor" <%= (pEdit instanceof Vendedor) ? "selected" : ""%>>Vendedor</option>
                                <option value="Administrador" <%= (pEdit instanceof Administrador) ? "selected" : ""%>>Administrador</option>
                            </select>
                            <% if(pEdit != null) { %> <input type="hidden" name="tipoEmpleado" value="<%= (pEdit instanceof Vendedor) ? "Vendedor" : "Administrador"%>"> <% } %>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-warning fw-bold text-dark">Confirmar Registro</button>
                            <a href="listaUsuarios.jsp" class="btn btn-outline-light btn-sm">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="lib/footer.jsp"%>

<%
    if (logueado == null || logueado instanceof Clases.Vendedor) {
        response.sendRedirect("index.jsp");
        return;
    }
%>