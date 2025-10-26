<%-- 
    Document   : inicio_sesion
    Adaptado para el sistema FoodChef
    Fecha      : 13/10/2025
    Autor      : Johana Melo
--%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión - FoodChef</title>
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        /* (Dejo tus estilos igual que en tu versión) */
        /* ======== ESTILO GENERAL ======== */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', 'Times New Roman', sans-serif;
            background:
                linear-gradient(rgba(230, 224, 248, 0.9), rgba(230, 224, 248, 0.9)),
                url('imagenes/fondo-foodchef.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
            color: #333;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .login-container {
            background-color: #fff;
            border: 2px solid #D2B4DE;
            border-radius: 12px;
            padding: 30px 40px;
            margin-top: 60px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        .login-container h2 {
            color: #5B2C6F;
            font-size: 26px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .login-container img {
            height: 80px;
            margin-bottom: 15px;
        }

        .login-container label {
            display: block;
            text-align: left;
            margin-bottom: 8px;
            font-weight: bold;
            color: #4A235A;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #D2B4DE;
            border-radius: 8px;
            background-color: rgba(255, 255, 255, 0.9);
            font-size: 16px;
            box-sizing: border-box;
        }

        .login-btn {
            background-color: #8E44AD;
            color: white;
            border: none;
            border-radius: 8px;
            width: 100%;
            padding: 12px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .login-btn:hover {
            background-color: #BB8FCE;
            transform: scale(1.05);
        }

        .error {
            color: red;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>

<body>
    <div class="login-container">
        <img src="imagenes/logo_foodchef.png" alt="Logo FoodChef">
        <h2>Iniciar Sesión</h2>

        <form action="procesarFormulario" method="post">
            <label for="usuario"><i class="fas fa-user"></i> Usuario:</label>
            <input type="text" id="usuario" name="usuario" placeholder="Ingrese su usuario" required>

            <label for="clave"><i class="fas fa-lock"></i> Contraseña:</label>
            <input type="password" id="clave" name="clave" placeholder="Ingrese su contraseña" required>

            <button class="login-btn" type="submit">Ingresar</button>
        </form>

        <!-- Mostrar error si el servlet lo envía -->
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="error"><%= error %></div>
        <%
            }
        %>

        <a href="inicio.jsp" class="forgot-password">Volver al inicio</a>
    </div>
</body>
</html>
