<%@include file="lib/header.jsp"%>
<%@page import="Clases.*"%>
<%
    if (session.getAttribute("userLog") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<style>
    body { 
        background-color: #121212 !important; 
    }

    .container {
        background: transparent !important;
        box-shadow: none !important;
    }

    .hover-card { 
        transition: transform 0.3s ease, box-shadow 0.3s ease; 
        background-color: #1e1e1e !important; 
        border: 1px solid #333 !important; 
    }
    .hover-card:hover { 
        transform: translateY(-5px); 
        box-shadow: 0 10px 20px rgba(255, 152, 0, 0.2) !important; 
        border-color: #ff9800 !important; 
    }
    
    .text-orange { color: #ff9800 !important; }
</style>

<div class="main-wrapper">
    <div class="container mt-5 py-4 text-center">
        
        <div class="mb-4">
            <i class="bi bi-fire text-orange" style="font-size: 5rem;"></i>
        </div>
        <h1 class="display-3 fw-bold text-white">
            Bienvenido a <span class="text-orange">Food</span><span class="text-white">Express</span>
        </h1>
        <p class="lead text-secondary mb-5">Sistema Integral de Gestión Gastronómica</p>
        
        <div class="row g-4 justify-content-center">
            
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm p-4 hover-card rounded-4">
                    <div class="card-body">
                        <i class="bi bi-cart-check-fill display-3 text-success"></i>
                        <h2 class="mt-3 text-white fw-bold">Ventas</h2>
                        <p class="text-secondary">Toma órdenes de clientes y revisa el historial de pedidos.</p>
                        
                        <div class="d-grid gap-2 mt-4">
                            <a href="hacerPedido.jsp" class="btn btn-success btn-lg fw-bold">
                                <i class="bi bi-plus-circle me-2"></i>Nuevo Pedido
                            </a>
                            <a href="listaPedidos.jsp" class="btn btn-outline-light">
                                <i class="bi bi-clipboard-data me-2"></i>Ver Historial
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <% if (logueado instanceof Administrador) { %>
            
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm p-4 hover-card rounded-4">
                    <div class="card-body">
                        <i class="bi bi-journal-richtext display-3 text-primary"></i>
                        <h2 class="mt-3 text-white fw-bold">Menú</h2>
                        <p class="text-secondary">Administra los platos, precios y categorías de la carta.</p>
                        <a href="listaItems.jsp" class="btn btn-primary btn-lg mt-4 w-100 fw-bold">Administrar</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm p-4 hover-card rounded-4">
                    <div class="card-body">
                        <i class="bi bi-people-fill display-3 text-info"></i>
                        <h2 class="mt-3 text-white fw-bold">Personal</h2>
                        <p class="text-secondary">Gestiona el registro de vendedores y administradores.</p>
                        <a href="listaUsuarios.jsp" class="btn btn-info btn-lg mt-4 w-100 text-dark fw-bold">Ver Equipo</a>
                    </div>
                </div>
            </div>
            
            <% } %>

        </div>
    </div>
</div>

<%@include file="lib/footer.jsp"%>