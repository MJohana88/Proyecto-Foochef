<%-- 
    Document   : Bienvenido
    Adaptado para el sistema FoodChef
    Fecha      : 16/10/2025
    Autor      : Johana Melo
--%>

<%
    // Verificar sesión activa
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("inicio_sesion.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Principal - FoodChef</title>

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
        }

        /* ======== CONTENEDOR CENTRAL ======== */
        .panel-container {
            background-color: #fff;
            border: 2px solid #D2B4DE;
            border-radius: 12px;
            padding: 40px;
            margin-top: 70px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25);
            width: 90%;
            max-width: 850px;
        }

        .panel-container img.logo {
            height: 90px;
            margin-bottom: 15px;
        }

        h2 {
            color: #5B2C6F;
            font-size: 26px;
            margin-bottom: 10px;
        }

        p {
            color: #4A235A;
            font-size: 18px;
            margin-bottom: 25px;
        }

        /* ======== GRID DE MÓDULOS ======== */
        .modulos {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 25px;
            justify-items: center;
        }

        .modulo {
            background-color: #F8F1FB;
            border: 1px solid #D2B4DE;
            border-radius: 10px;
            padding: 25px 15px;
            width: 180px;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
            text-decoration: none;
            color: #5B2C6F;
        }

        .modulo:hover {
            background-color: #E8DAEF;
            transform: translateY(-5px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .modulo img {
            width: 70px;
            height: 70px;
            object-fit: contain;
            margin-bottom: 12px;
        }

        .modulo span {
            display: block;
            font-weight: bold;
            font-size: 16px;
        }

        /* ======== BOTÓN DE CERRAR SESIÓN ======== */
        .logout {
            background-color: #8E44AD;
            color: #fff;
            text-decoration: none;
            border-radius: 8px;
            padding: 12px 24px;
            font-weight: bold;
            transition: all 0.3s ease;
            display: inline-block;
            margin-top: 35px;
        }

        .logout:hover {
            background-color: #BB8FCE;
            transform: scale(1.05);
        }

        /* ======== PIE DE PÁGINA ======== */
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

    <div class="panel-container">
        <img src="imagenes/logo_foodchef.png" alt="Logo FoodChef" class="logo">
        <h2>¡Bienvenido, <%= usuario %>!</h2>
        <p>Selecciona el módulo al que deseas ingresar:</p>

        <!-- ======== MÓDULOS ======== -->
        <div class="modulos">
            <a href="crear_usuario.jsp" class="modulo">
                <img src="imagenes/icono-usuario.png" alt="Crear Usuario">
                <span>Crear Usuario</span>
            </a>

            <a href="inventario.jsp" class="modulo">
                <img src="imagenes/icono-inventario.png" alt="Inventario">
                <span>Inventario</span>
            </a>

            <a href="orden_compra.jsp" class="modulo">
                <img src="imagenes/icono-orden.png" alt="Orden de Compra">
                <span>Orden de Compra</span>
            </a>

            <a href="ingreso_materia.jsp" class="modulo">
                <img src="imagenes/icono-ingreso.png" alt="Ingreso de Materia Prima">
                <span>Ingreso Materia Prima</span>
            </a>

            <a href="salida_materia.jsp" class="modulo">
                <img src="imagenes/icono-salida.png" alt="Salida de Materia Prima">
                <span>Salida Materia Prima</span>
            </a>
        </div>

        <!-- ======== BOTÓN DE CERRAR SESIÓN ======== -->
        <a href="CerrarSesion" class="logout">
                       Cerrar sesión
        </a>
    </div>

    <!-- ======== PIE DE PÁGINA ======== -->
    <footer>
        &copy; 2025 FoodChef | Sistema de Gestión de Inventario
    </footer>

</body>
</html>

