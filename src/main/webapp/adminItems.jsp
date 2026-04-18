<<<<<<< HEAD
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
=======
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Plato"%>
<%@include file="lib/header.jsp"%>

<%
    String codEditar = request.getParameter("editCod");
    Plato pEdit = null;

    if (codEditar != null) {
        ArrayList<Plato> lista = (ArrayList<Plato>) session.getAttribute("sesionPlatos");
        if (lista != null) {
            for (Plato p : lista) {
                if (p.getCodigoPlato().equals(codEditar)) {
                    pEdit = p;
                    break;
                }
            }
        }
    }
%>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0"><%= (pEdit != null) ? "Editar Plato" : "Nuevo Plato"%></h4>
                </div>
                <div class="card-body">
                    <form action="listaItems.jsp" method="POST">
                        <div class="mb-3">
                            <label class="form-label">Código</label>
                            <input type="text" name="txtCodigo" class="form-control" 
                                   value="<%= (pEdit != null) ? pEdit.getCodigoPlato() : ""%>" 
                                   <%= (pEdit != null) ? "readonly" : "required"%>>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Nombre del Plato</label>
                            <input type="text" name="txtNombre" class="form-control" 
                                   value="<%= (pEdit != null) ? pEdit.getNombrePlato() : ""%>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Precio</label>

                            <input type="number" step="0.01" name="txtPrecio" class="form-control"
                                   <%= (pEdit != null) ? "value='" + pEdit.getPrecio() + "'" : ""%>
                                   required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Categoría</label>
                            <select name="txtCategoria" class="form-select">
                                <option value="Comidas Rapidas" <%= (pEdit != null && pEdit.getCategoria().equals("Comidas Rapidas")) ? "selected" : ""%>>Comidas Rapidas</option>
                                <option value="Plato Fuerte" <%= (pEdit != null && pEdit.getCategoria().equals("Plato Fuerte")) ? "selected" : ""%>>Plato Fuerte</option>
                                <option value="Bebida" <%= (pEdit != null && pEdit.getCategoria().equals("Bebida")) ? "selected" : ""%>>Bebida</option>
                                <option value="Postre" <%= (pEdit != null && pEdit.getCategoria().equals("Postre")) ? "selected" : ""%>>Postre</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success w-100">Guardar Cambios</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="lib/footer.jsp"%>
>>>>>>> 32877c08d85787c0eae24dd03842a75788bcd8b1
