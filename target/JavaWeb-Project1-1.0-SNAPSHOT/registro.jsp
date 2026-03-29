<%@page import="java.util.ArrayList"%>
<%@page import="Clases.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registro - FoodExpress</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card shadow border-0">
                        <div class="card-body p-4">
                            <h3 class="text-center fw-bold mb-4">Crear Cuenta</h3>
                            <form action="registro.jsp" method="POST">
                                <div class="mb-3">
                                    <label class="form-label">Nombre Completo</label>
                                    <input type="text" name="txtNombre" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Correo Electrónico</label>
                                    <input type="email" name="txtCorreo" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Contraseña</label>
                                    <input type="password" name="txtPass" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label fw-bold">Rol en el Sistema</label>
                                    <select name="txtRol" class="form-select" required>
                                        <option value="" selected disabled>Seleccione un rol...</option>
                                        <option value="Administrador">Administrador</option>
                                        <option value="Vendedor">Vendedor</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-warning w-100 fw-bold">Registrarse</button>
                            </form>
                            <p class="text-center mt-3 small">¿Ya tienes cuenta? <a href="login.jsp">Inicia sesión</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

<%
    String correo = request.getParameter("txtCorreo");
    String rol = request.getParameter("txtRol"); 

    if (correo != null && rol != null) {
        ArrayList<Persona> lista = (ArrayList<Persona>) session.getAttribute("usuariosFood");
        if (lista == null) lista = new ArrayList<>();

        Persona nuevoUsuario; 

        if (rol.equals("Administrador")) {
            Administrador admin = new Administrador();
            admin.setTipoEmpleado("Administrador");
            nuevoUsuario = admin;
        } else {
            Vendedor vend = new Vendedor(); 
            vend.setTipoEmpleado("Vendedor");
            nuevoUsuario = vend;
        }

        nuevoUsuario.setNombre(request.getParameter("txtNombre"));
        nuevoUsuario.setCorreo(correo);
        nuevoUsuario.setPassword(request.getParameter("txtPass"));
        nuevoUsuario.setCiudad("Pasto"); 
        
        lista.add(nuevoUsuario);
        session.setAttribute("usuariosFood", lista);
        response.sendRedirect("login.jsp?reg=ok");
    }
%>