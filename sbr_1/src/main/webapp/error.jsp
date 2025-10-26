<%-- 
    Document   : error
    Created on : 15/10/2025, 8:53:15 p. m.
    Author     : Johana Melo
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error de inicio de sesión - FoodChef</title>
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        /* ======== ESTILO GENERAL ======== */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', 'Times New Roman', sans-serif;
            background:
                linear-gradient(rgba(230, 224, 248, 0.9), rgba(230, 224, 248, 0.9)),
                url('imagenes/fondo_foodchef.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: #333;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        /* ======== CONTENEDOR ======== */
        .error-container {
            background-color: #fff;
            border: 2px solid #E57373;
            border-radius: 12px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            width: 400px;
        }

        .error-container img {
            height: 90px;
            margin-bottom: 10px;
        }

        .error-container h1 {
            color: #C0392B;
            font-size: 28px;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .error-message {
            color: #E74C3C;
            font-weight: bold;
            margin-bottom: 25px;
            font-size: 16px;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #D2B4DE;
            border-radius: 8px;
            font-size: 16px;
        }

        .btn {
            background-color: #8E44AD;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            width: 100%;
        }

        .btn:hover {
            background-color: #BB8FCE;
            transform: scale(1.05);
        }

        .back-link {
            display: block;
            margin-top: 20px;
            color: #6C3483;
            font-weight: bold;
            text-decoration: none;
        }

        .back-link:hover {
            color: #AF7AC5;
        }
    </style>
</head>

<body>

    <div class="error-container">
        <img src="imagenes/logo_foodchef.png" alt="Logo FoodChef">
        <h1><i class="fas fa-exclamation-triangle"></i> Error de inicio de sesión</h1>

        <%
            String error = (String) request.getAttribute("error");
            if (error == null) {
                error = "Usuario o contraseña incorrectos.";
            }
        %>

        <p class="error-message"><%= error %></p>

        <form action="Svinicio_sesion" method="post" autocomplete="off">
            <div class="form-group">
                <label for="usuario"><i class="fas fa-user"></i> Usuario:</label>
                <input type="text" id="usuario" name="usuario" placeholder="Ingrese su usuario" required>
            </div>

            <div class="form-group">
                <label for="clave"><i class="fas fa-lock"></i> Contraseña:</label>
                <input type="password" id="clave" name="clave" placeholder="Ingrese su contraseña" required>
            </div>

            <button class="btn" type="submit"><i class="fas fa-sign-in-alt"></i> Reintentar</button>
        </form>

        <a href="inicio.jsp" class="back-link"><i class="fas fa-home"></i> Volver al inicio</a>
    </div>

</body>
</html>
