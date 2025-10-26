<%-- 
    Document   : crear_usuario
    Sistema    : FoodChef
    Fecha      : 19/10/2025
    Autor      : Johana Melo
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Usuario - FoodChef</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(rgba(240, 240, 255, 0.9), rgba(240, 240, 255, 0.9)),
                        url('imagenes/fondo_foodchef.jpg');
            background-size: cover;
            background-attachment: fixed;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #fff;
            border: 2px solid #D2B4DE;
            border-radius: 12px;
            padding: 40px;
            margin-top: 60px;
            width: 90%;
            max-width: 600px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.25);
        }

        h2 {
            color: #5B2C6F;
            font-size: 26px;
            margin-bottom: 25px;
        }

        form {
            width: 100%;
            text-align: left;
        }

        label {
            font-weight: bold;
            color: #5B2C6F;
            display: block;
            margin-top: 15px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #D2B4DE;
            border-radius: 8px;
            margin-top: 5px;
            font-size: 16px;
        }

        .btn {
            background-color: #8E44AD;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            margin-top: 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
        }

        .btn:hover {
            background-color: #BB8FCE;
            transform: scale(1.05);
        }

        .volver {
            background-color: #8E44AD;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 8px;
            display: inline-block;
            margin-top: 20px;
            transition: 0.3s;
        }

        .volver:hover {
            background-color: #BB8FCE;
            transform: scale(1.05);
        }

        .mensaje {
            color: green;
            font-weight: bold;
            margin-top: 15px;
        }

        footer {
            text-align: center;
            padding: 20px;
            color: #5B2C6F;
            font-weight: bold;
            margin-top: 40px;
        }
    </style>
</head>

<body>

    <div class="container">
        <h2><i class="fas fa-user-plus"></i> Registrar nuevo usuario</h2>

        <form action="RegistrarUsuario" method="post">
            <label>Nombre completo:</label>
            <input type="text" name="nombre" required>

            <label>Fecha de nacimiento:</label>
            <input type="date" name="fecha_nacimiento" required>

            <label>Correo electrónico:</label>
            <input type="email" name="email" required>

            <label>Teléfono:</label>
            <input type="text" name="telefono">

            <label>Contraseña:</label>
            <input type="password" name="contrasena" required>

            <label>Rol del usuario:</label>
            <select name="rol" required>
                <option value="">-- Selecciona un rol --</option>
                <option value="Administrador">Administrador</option>
                <option value="Chef">Chef</option>
                <option value="Auxiliar cocina">Auxiliar cocina</option>
                <option value="Bodega">Bodega</option>
            </select>

            <button type="submit" class="btn">Registrar usuario</button>
        </form>

        <% if (request.getParameter("msg") != null) { %>
            <p class="mensaje"><%= request.getParameter("msg") %></p>
        <% } %>

        <a href="Bienvenido.jsp" class="volver"><i class="fas fa-arrow-left"></i> Volver al panel</a>
    </div>

    <footer>
        &copy; 2025 FoodChef | Sistema de Gestión de Inventario
    </footer>

</body>
</html>
