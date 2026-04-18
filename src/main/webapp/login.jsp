<<<<<<< HEAD
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userLog") != null) { 
        response.sendRedirect("index.jsp"); 
        return; 
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - FoodExpress</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        body {
            background-color: #121212;
            color: #ffffff;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card-login {
            background-color: #1e1e1e;
            border: 1px solid #ff9800;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(255, 152, 0, 0.2);
        }
        .btn-orange {
            background-color: #ff9800;
            color: #121212;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        .btn-orange:hover {
            background-color: #e68a00;
            color: #ffffff;
            transform: translateY(-2px);
        }
        .text-orange {
            color: #ff9800;
        }
        .form-control:focus {
            border-color: #ff9800;
            box-shadow: 0 0 0 0.25rem rgba(255, 152, 0, 0.25);
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="card card-login">
                    <div class="card-body p-5 text-center">
                        
                        <i class="bi bi-fire text-orange" style="font-size: 3.5rem;"></i>
                        <h2 class="fw-bold mb-4 mt-2">Food<span class="text-orange">Express</span></h2>

                        <% if(request.getParameter("error") != null) { %>
                            <div class="alert alert-danger small py-2 d-flex align-items-center justify-content-center" role="alert">
                                <i class="bi bi-exclamation-triangle-fill me-2"></i> Credenciales incorrectas
                            </div>
                        <% } %>

                        <form action="LoginServlet" method="POST">
                            
                            <div class="form-floating mb-3 text-dark">
                                <input type="email" name="u" class="form-control" id="floatingInput" placeholder="name@example.com" required>
                                <label for="floatingInput"><i class="bi bi-envelope"></i> Correo Electrónico</label>
                            </div>
                            
                            <div class="form-floating mb-4 text-dark">
                                <input type="password" name="p" class="form-control" id="floatingPassword" placeholder="Contraseña" required>
                                <label for="floatingPassword"><i class="bi bi-lock"></i> Contraseña</label>
                            </div>
                            
                            <button type="submit" class="btn btn-orange w-100 py-2 mb-3 fs-5">Ingresar al Sistema</button>
                        </form>
                        
                        <hr class="border-secondary mb-3">
                        
                        <a href="registro.jsp" class="text-decoration-none text-light small">
                            ¿No tienes cuenta? <span class="text-orange fw-bold">Regístrate aquí</span>
                        </a>
                        
=======
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("userLog") != null) { response.sendRedirect("index.jsp"); }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - FoodExpress</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark">
    <div class="container mt-5">
        <div class="row justify-content-center pt-5">
            <div class="col-md-4">
                <div class="card shadow-lg border-0">
                    <div class="card-body p-4 text-center">
                        <h2 class="fw-bold text-warning mb-4">FoodExpress</h2>
                        <form action="login.jsp" method="POST">
                            <input type="email" name="u" class="form-control mb-3" placeholder="Correo" required>
                            <input type="password" name="p" class="form-control mb-3" placeholder="Contraseña" required>
                            <button type="submit" class="btn btn-primary w-100">Ingresar</button>
                        </form>
                        <hr>
                        <a href="registro.jsp" class="btn btn-link text-muted small">No tengo cuenta, registrarme</a>
>>>>>>> 32877c08d85787c0eae24dd03842a75788bcd8b1
                    </div>
                </div>
            </div>
        </div>
    </div>
<<<<<<< HEAD

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
=======
</body>
</html>

<%
    String u = request.getParameter("u");
    String p = request.getParameter("p");

    if (u != null && p != null) {

        ArrayList<Persona> lista = (ArrayList<Persona>) session.getAttribute("usuariosFood");
        boolean acceso = false;
        Persona encontrado = null;

        if (lista != null) {
            for (Persona user : lista) {

                if (user.getCorreo().equalsIgnoreCase(u) && user.getPassword().equals(p)) {
                    encontrado = user;
                    acceso = true;
                    break;
                }
            }
        }

        if (acceso) {

            session.setAttribute("userLog", encontrado);
            response.sendRedirect("index.jsp");
        } else {

            out.print("<script>alert('Usuario no encontrado o datos incorrectos. ¿Ya te registraste?');</script>");
        }
    }
%>
>>>>>>> 32877c08d85787c0eae24dd03842a75788bcd8b1
