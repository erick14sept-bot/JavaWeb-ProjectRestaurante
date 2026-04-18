<%@page import="Clases.Plato"%>
<%@include file="lib/header.jsp"%>
<%
    Plato pEdit = (Plato) request.getAttribute("platoAEditar"); 
%>
<div class="container mt-5">
    <div class="card bg-dark text-white border-warning">
        <div class="card-header bg-warning text-dark">
            <h3 class="text-center"><%= (pEdit != null) ? "Editar Plato" : "Registrar Nuevo Plato" %></h3>
        </div>
        <div class="card-body">
<form action="PlatoServlet" method="POST">
    <div class="mb-3">
        <label>Código</label>
        <input type="text" name="txtCodigo" class="form-control" value="<%= (pEdit != null) ? pEdit.getCodigoPlato() : ""%>" required>
    </div>
    <div class="mb-3">
        <label>Nombre</label>
        <input type="text" name="txtNombre" class="form-control" value="<%= (pEdit != null) ? pEdit.getNombrePlato() : ""%>" required>
    </div>
    <div class="mb-3">
        <label>Precio</label>
        <input type="number" step="0.01" name="txtPrecio" class="form-control"
<%= (pEdit != null) ? "value='" + pEdit.getPrecio() + "'" : "" %> required>
    </div>
    <div class="mb-3">
        <label>Descripción</label>
        <input type="text" name="txtDescripcion" class="form-control" value="<%= (pEdit != null) ? pEdit.getDescripcion() : ""%>">
    </div>
    <div class="mb-3">
        <label>Categoría</label>
        <select name="txtCategoria" class="form-select">
            <option value="Comidas Rapidas">Comidas Rapidas</option>
            <option value="Plato Fuerte">Plato Fuerte</option>
            <option value="Bebida">Bebida</option>
        </select>
    </div>
    <button type="submit" class="btn btn-warning w-100 fw-bold">Guardar en FoodExpress</button>
</form>
        </div>
    </div>
</div>
    
<%

    if (logueado == null || logueado instanceof Clases.Vendedor) {
        response.sendRedirect("index.jsp");
        return; 
    }
%>