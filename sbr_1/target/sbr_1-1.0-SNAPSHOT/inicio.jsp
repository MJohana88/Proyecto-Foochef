<%-- 
    Document   : inicio
    Adaptado para el sistema FoodChef
    Fecha      : 13/10/2025
    Autor      : Johana Melo
--%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FoodChef - Inicio</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
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

        /* ======== ENCABEZADO ======== */
        #header {
            width: 100%;
            height: 120px;
            background-color: rgba(155, 89, 182, 0.95); /* Morado semitransparente */
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.3);
            border-bottom: 3px solid #D1C4E9;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        #header img {
            height: 80px;
            margin-right: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease;
            object-fit: contain;
        }

        #header img:hover {
            transform: scale(1.05);
        }

        #header h1 {
            font-size: 32px;
            color: #fff;
            font-weight: bold;
            letter-spacing: 1px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
        }

        /* ======== MENÚ PRINCIPAL ======== */
        .menu-container {
            width: 60%;
            background-color: rgba(255, 255, 255, 0.15);
            margin-top: 40px;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
            backdrop-filter: blur(4px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .menu-btn {
            background-color: #8E44AD; /* Morado intenso */
            color: #fff;
            border: none;
            border-radius: 8px;
            width: 250px;
            height: 50px;
            margin: 10px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .menu-btn:hover {
            background-color: #BB8FCE; /* Morado claro al pasar el cursor */
            transform: scale(1.05);
        }

        .icon {
            font-size: 22px;
            margin-right: 8px;
        }

        /* ======== RESPONSIVE ======== */
        @media (max-width: 768px) {
            #header h1 {
                font-size: 22px;
            }

            .menu-container {
                width: 85%;
                padding: 15px;
            }

            .menu-btn {
                width: 100%;
                font-size: 16px;
            }
        }
    </style>

    <script>
        // Redirección de botones
        function irA(pagina) {
            window.location.href = pagina;
        }
    </script>
</head>

<body>

    <!-- Encabezado principal -->
    <div id="header">
        <img src="imagenes/logo_foodchef.png" alt="Logo FoodChef">
        <h1>Bienvenido a FoodChef</h1>
    </div>

    <!-- Menú principal -->
    <div class="menu-container">
        <button class="menu-btn" onclick="irA('inicio_sesion.jsp')">
            <i class="fas fa-sign-in-alt icon"></i> Iniciar Sesión
        </button>

        <button class="menu-btn" onclick="irA('contacto.jsp')">
            <i class="fas fa-phone icon"></i> Contacto
        </button>

        <button class="menu-btn" onclick="irA('nosotros.jsp')">
            <i class="fas fa-users icon"></i> Nosotros
        </button>
    </div>

</body>
</html>
