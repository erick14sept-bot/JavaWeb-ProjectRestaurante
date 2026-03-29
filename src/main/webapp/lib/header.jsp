<%@page import="Clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Persona logueado = (Persona) session.getAttribute("userLog");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FoodExpress - Gestión Gastronómica</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="styles/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
            <div class="container-fluid">
                <a class="navbar-brand fw-bold" href="index.jsp">
                    <span style="color: #e67e22;">Food</span>Express
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navFood">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse" id="navFood">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp"><i class="bi bi-house-door"></i> Inicio</a>
                        </li>
                        
                        <% if (logueado != null) { %>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                Personal
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="adminUsuarios.jsp">Registrar Usuario</a></li>
                                <li><a class="dropdown-item" href="listaUsuarios.jsp">Ver Listado</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                Menú
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="adminItems.jsp">Gestionar Platos</a></li>
                                <li><a class="dropdown-item" href="listaItems.jsp">Ver Carta</a></li>
                            </ul>
                        </li>
                        <% } %>
                    </ul>

                    <div class="d-flex align-items-center">
                        <% if (logueado != null) { %>
                            <span class="text-white me-3 small">
                                <i class="bi bi-person-circle text-warning"></i> <%= logueado.getNombre() %>
                            </span>
                            <a href="logout.jsp" class="btn btn-outline-danger btn-sm">Cerrar Sesión</a>
                        <% } else { %>
                            <a href="login.jsp" class="btn btn-warning btn-sm fw-bold">Iniciar Sesión</a>
                        <% } %>
                    </div>
                </div>
            </div>
        </nav>