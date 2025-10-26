<%-- 
    Document   : nosotros
    Sistema    : FoodChef
    Fecha      : 19/10/2025
    Autor      : Johana Melo
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nosotros - FoodChef</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(rgba(240,240,255,0.9), rgba(240,240,255,0.9)),
                        url('imagenes/fondo_foodchef.jpg');
            background-size: cover;
            background-attachment: fixed;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        /* ======== ENCABEZADO ======== */
        #header {
            width: 100%;
            height: 120px;
            background-color: rgba(155, 89, 182, 0.95);
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.3);
            border-bottom: 3px solid #D1C4E9;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        #header img {
            height: 80px;
            border-radius: 10px;
        }

        #header h1 {
            font-size: 30px;
            color: #fff;
            display: flex;
            align-items: center;
            gap: 10px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
        }

        #header h1 i {
            color: #F8F1FB;
            font-size: 30px;
        }

        /* ======== CONTENIDO ======== */
        .container {
            background-color: #fff;
            border: 2px solid #D2B4DE;
            border-radius: 12px;
            padding: 40px;
            margin-top: 60px;
            width: 90%;
            max-width: 800px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.25);
        }

        h2 {
            color: #5B2C6F;
            font-size: 26px;
            margin-bottom: 30px;
        }

        .section {
            margin-bottom: 40px;
        }

        h3 {
            color: #6C3483;
            font-size: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        h3 i {
            color: #8E44AD;
            font-size: 28px;
        }

        p {
            font-size: 18px;
            color: #4A235A;
            line-height: 1.6;
            margin-top: 10px;
        }

        .volver {
            background-color: #8E44AD;
            color: white;
            text-decoration: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: bold;
            transition: all 0.3s ease;
            display: inline-block;
            margin-top: 25px;
        }

        .volver:hover {
            background-color: #BB8FCE;
            transform: scale(1.05);
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

    <!-- Encabezado -->
    <div id="header">
        <img src="imagenes/logo_foodchef.png" alt="Logo FoodChef">
        <h1> Nosotros</h1>
    </div>

    <!-- Contenido principal -->
    <div class="container">
        <h2>Conoce más sobre <span style="color:#8E44AD;">FoodChef</span></h2>

        <div class="section">
            <h3><i class="fas fa-eye"></i> Visión</h3>
            <p>
                Ser un sistema de gestión de inventarios para restaurantes, 
                optimizando el control de insumos y recursos mediante soluciones 
                tecnológicas innovadoras que impulsen la eficiencia, la trazabilidad 
                y la rentabilidad en el sector gastronómico.
            </p>
        </div>

        <div class="section">
            <h3><i class="fas fa-bullseye"></i> Misión</h3>
            <p>
                Brindar a los restaurantes una herramienta integral, intuitiva y segura 
                para gestionar sus inventarios, órdenes de compra e insumos alimenticios, 
                facilitando la toma de decisiones y promoviendo una administración más 
                eficiente y sostenible de los recursos.
            </p>
        </div>

        <a href="inicio.jsp" class="volver">
            <i class="fas fa-arrow-left"></i> Volver al inicio
        </a>
    </div>

    <footer>
        &copy; 2025 FoodChef | Sistema de Gestión de Inventario
    </footer>

</body>
</html>
