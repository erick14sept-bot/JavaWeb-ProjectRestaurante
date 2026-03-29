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
                    </div>
                </div>
            </div>
        </div>
    </div>
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