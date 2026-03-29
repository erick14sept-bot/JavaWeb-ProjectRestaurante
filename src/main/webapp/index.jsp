<%@include file="lib/header.jsp"%>
<%@page import="Clases.*"%>

<%

    if (session.getAttribute("userLog") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<div class="main-wrapper">
    <div class="container mt-5 py-4 text-center">
        
        <div class="mb-4">
            <img src="images/Logo.png" alt="Logo FoodExpress" 
                 class="img-fluid shadow-sm" 
                 style="max-width: 200px; height: auto; border-radius: 50%;">
        </div>

        <h1 class="display-3 fw-bold">Bienvenido a <span class="text-warning">Food</span>Express</h1>
        <p class="lead text-muted mb-5">Sistema Integral de Gestión Gastronómica</p>

        <div class="row g-4 justify-content-center">
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm p-4 hover-card">
                    <div class="card-body">
                        <i class="bi bi-cart-check-fill display-3 text-success"></i>
                        <h2 class="mt-3 text-dark">Ventas</h2>
                        <p class="text-secondary">Toma órdenes de clientes y revisa el historial de pedidos.</p>
                        
                        <div class="d-grid gap-2 mt-3">
                            <a href="hacerPedido.jsp" class="btn btn-success btn-lg">
                                <i class="bi bi-plus-circle me-2"></i>Nuevo Pedido
                            </a>
                            <a href="listaPedidos.jsp" class="btn btn-outline-dark">
                                <i class="bi bi-clipboard-data me-2"></i>Ver Historial
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm p-4 hover-card">
                    <div class="card-body">
                        <i class="bi bi-journal-richtext display-3 text-primary"></i>
                        <h2 class="mt-3 text-dark">Gestión de Menú</h2>
                        <p class="text-secondary">Administra los platos, precios y categorías de la carta.</p>
                        <a href="listaItems.jsp" class="btn btn-primary btn-lg mt-3 w-100">Administrar</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm p-4 hover-card">
                    <div class="card-body">
                        <i class="bi bi-people-fill display-3 text-info"></i>
                        <h2 class="mt-3 text-dark">Personal</h2>
                        <p class="text-secondary">Gestiona el registro de vendedores y administradores.</p>
                        <a href="listaUsuarios.jsp" class="btn btn-info btn-lg mt-3 w-100 text-white">Ver Equipo</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="lib/footer.jsp"%>