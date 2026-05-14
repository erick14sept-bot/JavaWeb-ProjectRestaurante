<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - FoodExpress</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        body {
            background-color: #121212;
            color: #ffffff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px 0;
        }
        .card-registro {
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
        .text-orange { color: #ff9800; }
        .form-control:focus, .form-select:focus {
            border-color: #ff9800;
            box-shadow: 0 0 0 0.25rem rgba(255, 152, 0, 0.25);
        }
        .fade-in {
            animation: fadeIn 0.5s;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card card-registro">
                    <div class="card-body p-4 p-md-5">
                        
                        <div class="text-center mb-4">
                            <i class="bi bi-person-badge text-orange" style="font-size: 3rem;"></i>
                            <h3 class="fw-bold mt-2">Crear Cuenta</h3>
                            <p class="text-muted small">Únete al equipo de FoodExpress</p>
                        </div>

                        <%-- Mensaje de Error de Seguridad (Viene del Servlet) --%>
                        <% if(request.getParameter("errorSeguridad") != null) { %>
                            <div class="alert alert-danger small text-center mb-4 fade-in">
                                <i class="bi bi-shield-exclamation fw-bold fs-5 d-block"></i>
                                El código maestro es incorrecto. No puedes registrarte como Administrador.
                            </div>
                        <% } %>

                        <form action="UsuarioServlet" method="POST">
                            
                            <input type="hidden" name="origen" value="registro">

                            <div class="form-floating mb-3 text-dark">
                                <input type="text" name="nombre" class="form-control" id="floatNombre" placeholder="Tu Nombre" required>
                                <label for="floatNombre"><i class="bi bi-person"></i> Nombre Completo</label>
                            </div>

                            <div class="form-floating mb-3 text-dark">
                                <input type="email" name="correo" class="form-control" id="floatCorreo" placeholder="name@example.com" required>
                                <label for="floatCorreo"><i class="bi bi-envelope"></i> Correo Electrónico</label>
                            </div>

                            <div class="form-floating mb-3 text-dark">
                                <input type="password" name="txtPassword" class="form-control" id="floatPass" placeholder="Contraseña" required>
                                <label for="floatPass"><i class="bi bi-lock"></i> Contraseña</label>
                            </div>

                            <div class="row mb-3">
                                <div class="col-6">
                                    <div class="form-floating text-dark">
                                        <input type="text" name="ciudad" class="form-control" id="floatCiudad" placeholder="Ciudad" value="Pasto">
                                        <label for="floatCiudad">Ciudad</label>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-floating text-dark">
                                        <input type="text" name="contacto" class="form-control" id="floatContacto" placeholder="Teléfono">
                                        <label for="floatContacto">Teléfono</label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-floating mb-3 text-dark">
                                <select name="tipoEmpleado" class="form-select" id="floatRol" required>
                                    <option value="" selected disabled>Selecciona tu cargo...</option>
                                    <option value="Administrador">Administrador</option>
                                    <option value="Vendedor">Vendedor</option>
                                </select>
                                <label for="floatRol"><i class="bi bi-briefcase"></i> Rol en el Sistema</label>
                            </div>

                            <div id="securitySection" style="display: none;" class="mb-4 fade-in">
                                <div class="form-floating text-dark border border-danger rounded">
                                    <input type="password" name="txtSecurityCode" class="form-control" id="floatSec" placeholder="Código Maestro">
                                    <label for="floatSec" class="text-danger fw-bold"><i class="bi bi-key-fill"></i> Código Maestro (Admins)</label>
                                </div>
                                <div class="form-text text-warning mt-1" style="font-size: 0.8rem;">
                                    <i class="bi bi-info-circle"></i> Clave requerida para permisos nivel Jefe.
                                </div>
                            </div>

                            <button type="submit" class="btn btn-orange w-100 py-2 fs-5 mt-2">Registrarse</button>
                        </form>

                        <hr class="border-secondary mt-4 mb-3">
                        
                        <div class="text-center">
                            <a href="login.jsp" class="text-decoration-none text-light small">
                                ¿Ya tienes cuenta? <span class="text-orange fw-bold">Inicia sesión</span>
                            </a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        document.getElementById('floatRol').addEventListener('change', function() {
            const secSection = document.getElementById('securitySection');
            const secInput = document.getElementById('floatSec');
            
            if (this.value === 'Administrador') {
                secSection.style.display = 'block';
                secInput.required = true; 
            } else {
                secSection.style.display = 'none';
                secInput.required = false; 
                secInput.value = ''; 
            }
        });
    </script>
</body>
</html>