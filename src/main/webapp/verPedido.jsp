<%@page import="java.util.ArrayList"%>
<%@page import="Clases.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="lib/header.jsp"%>

<%
<<<<<<< HEAD
=======

>>>>>>> 32877c08d85787c0eae24dd03842a75788bcd8b1
    Pedido miPedido = (Pedido) session.getAttribute("carrito");
    
    if (miPedido == null || miPedido.getItems().isEmpty()) {
        response.sendRedirect("hacerPedido.jsp");
        return;
    }
<<<<<<< HEAD
=======

    String nombreCli = request.getParameter("txtCliente");
    
    if (nombreCli != null) {

        miPedido.getCliente().setNombre(nombreCli);

        ArrayList<Pedido> historial = (ArrayList<Pedido>) session.getAttribute("historialVentas");
        if (historial == null) {
            historial = new ArrayList<>();
        }

        historial.add(miPedido);
        session.setAttribute("historialVentas", historial);

        session.removeAttribute("carrito");

        response.sendRedirect("listaPedidos.jsp");
        return;
    }
>>>>>>> 32877c08d85787c0eae24dd03842a75788bcd8b1
%>

<div class="main-wrapper">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg border-0">
                    <div class="card-header bg-dark text-white text-center py-3">
                        <h4 class="mb-0">CONFIRMAR VENTA</h4>
                        <small>Ticket: <%= miPedido.getIdVenta() %></small>
                    </div>
                    <div class="card-body p-4">
<<<<<<< HEAD
                        <form action="PedidoServlet" method="POST">
=======
                        <form action="verPedido.jsp" method="POST">
>>>>>>> 32877c08d85787c0eae24dd03842a75788bcd8b1
                            <div class="mb-4">
                                <label class="fw-bold mb-2 small text-uppercase">Nombre del Cliente</label>
                                <input type="text" name="txtCliente" class="form-control form-control-lg" placeholder="Ej: Joan Trujillo" required>
                            </div>

                            <div class="bg-light p-3 rounded mb-4">
                                <div class="d-flex justify-content-between mb-2 border-bottom">
                                    <span class="text-muted">Subtotal:</span>
                                    <span>$<%= miPedido.getTotal() %></span>
                                </div>
                                <div class="d-flex justify-content-between fs-4 fw-bold">
                                    <span class="text-dark">TOTAL A PAGAR:</span>
                                    <span class="text-success">$<%= miPedido.getTotal() %></span>
                                </div>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary btn-lg shadow">
                                    <i class="bi bi-check-circle me-2"></i>Finalizar y Registrar Venta
                                </button>
                                <a href="hacerPedido.jsp" class="btn btn-outline-secondary">Volver a la carta</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="lib/footer.jsp"%>