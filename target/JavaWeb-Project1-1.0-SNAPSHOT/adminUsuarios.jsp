<%@page import="java.util.ArrayList"%>
<%@page import="Clases.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="lib/header.jsp"%>

<%
    String correoEdit = request.getParameter("editCor");
    Persona pEdit = null;

    if (correoEdit != null) {
        ArrayList<Persona> lista = (ArrayList<Persona>) session.getAttribute("usuariosFood");
        if (lista != null) {
            for (Persona u : lista) {
                if (u.getCorreo().equalsIgnoreCase(correoEdit)) {
                    pEdit = u;
                    break;
                }
            }
        }
    }
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card shadow border-0">
                <div class="card-header bg-primary text-white py-3">
                    <h4 class="mb-0">
                        <i class="bi bi-person-gear me-2"></i>
                        <%= (pEdit != null) ? "Actualizar Datos de Usuario" : "Registro de Nuevo Personal"%>
                    </h4>
                </div>
                <div class="card-body p-4">
                    <form action="listaUsuarios.jsp" method="POST">

                        <div class="row mb-3">
                            <div class="col-md-12">
                                <label class="form-label fw-bold">Nombre Completo</label>
                                <input type="text" name="nombre" class="form-control" 
                                       value="<%= (pEdit != null) ? pEdit.getNombre() : ""%>" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Correo Electrónico (ID Único)</label>
                            <input type="email" name="correo" class="form-control" 
                                   value="<%= (pEdit != null) ? pEdit.getCorreo() : ""%>" 
                                   <%= (pEdit != null) ? "readonly style='background-color: #f1f1f1;'" : "required"%>>
                            <% if (pEdit != null) { %>
                            <small class="text-danger">* El correo no se puede cambiar en edición.</small>
                            <% }%>
                        </div>
                        <div class="mb-3">
                            <label class="fw-bold">Contraseña de Acceso</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="bi bi-lock-fill"></i></span>
                                <input type="password" name="txtPassword" class="form-control" 
                                       placeholder="Mínimo 6 caracteres" 
                                       value="<%= (pEdit != null) ? pEdit.getPassword() : ""%>" required>
                            </div>
                            <small class="text-muted text-warning">Protege los datos de FoodExpress.</small>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Ciudad</label>
                                <input type="text" name="ciudad" class="form-control" 
                                       value="<%= (pEdit != null) ? pEdit.getCiudad() : ""%>">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Teléfono / Contacto</label>
                                <input type="text" name="contacto" class="form-control" 
                                       value="<%= (pEdit != null) ? pEdit.getContacto() : ""%>">
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold">Tipo de Empleado</label>
                            <% if (pEdit != null) {%>
                            <%-- Si editamos, el tipo no se cambia para evitar conflictos de clase --%>
                            <input type="text" class="form-control" value="<%= (pEdit instanceof Vendedor) ? "Vendedor" : "Administrador"%>" readonly>
                            <input type="hidden" name="tipoEmpleado" value="<%= (pEdit instanceof Vendedor) ? "Vendedor" : "Administrador"%>">
                            <% } else { %>
                            <select name="tipoEmpleado" class="form-select">
                                <option value="Vendedor">Vendedor</option>
                                <option value="Administrador">Administrador</option>
                            </select>
                            <% }%>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="bi bi-check-circle me-2"></i>
                                <%= (pEdit != null) ? "Guardar Cambios" : "Registrar en el Sistema"%>
                            </button>
                            <a href="listaUsuarios.jsp" class="btn btn-light border">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="lib/footer.jsp"%>