<%-- 
    Document   : contacto
    Sistema    : FoodChef
    Fecha      : 19/10/2025
    Autor      : Johana Melo
--%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contacto - FoodChef</title>
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
            font-size: 28px;
        }

        /* ======== CONTENEDOR ======== */
        .container {
            background-color: #fff;
            border: 2px solid #D2B4DE;
            border-radius: 12px;
            padding: 40px;
            margin-top: 60px;
            width: 90%;
            max-width: 900px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.25);
        }

        h2 {
            color: #5B2C6F;
            font-size: 26px;
            margin-bottom: 30px;
        }

        .contacto-info {
            display: flex;
            flex-direction: column;
            gap: 25px;
            align-items: center;
        }

        .persona {
            background-color: #F8F1FB;
            border: 1px solid #D2B4DE;
            border-radius: 10px;
            padding: 20px;
            width: 80%;
            max-width: 500px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .persona:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .persona h3 {
            color: #6C3483;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .persona p {
            font-size: 17px;
            color: #4A235A;
            margin: 5px 0;
        }

        .persona i {
            color: #8E44AD;
            margin-right: 8px;
        }

        /* ======== FORMULARIO ======== */
        form {
            margin-top: 40px;
            text-align: left;
            width: 100%;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        label {
            font-weight: bold;
            color: #5B2C6F;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            margin-bottom: 20px;
            border: 1px solid #D2B4DE;
            border-radius: 8px;
            font-size: 16px;
            outline: none;
            resize: none;
        }

        input:focus, textarea:focus {
            border-color: #8E44AD;
            box-shadow: 0 0 6px rgba(142,68,173,0.3);
        }

        button {
            background-color: #8E44AD;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px 24px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            display: block;
            margin: 0 auto;
        }

        button:hover {
            background-color: #BB8FCE;
            transform: scale(1.05);
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
            margin-top: 30px;
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
        <h1><i class="fas fa-phone-alt"></i> Contacto</h1>
    </div>

    <!-- Contenido principal -->
    <div class="container">
        <h2>Comunícate con el equipo de <span style="color:#8E44AD;">FoodChef</span></h2>

        <div class="contacto-info">
            <!-- Persona 1 -->
            <div class="persona">
                <h3><i class="fas fa-user"></i> Johana Edith Melo Chaparro</h3>
                <p><i class="fas fa-phone"></i> Celular: <strong>313 257 0036</strong></p>
                <p><i class="fas fa-envelope"></i> Correo: <strong>sistemafoodchef@gmail.com</strong></p>
            </div>

            <!-- Persona 2 -->
            <div class="persona">
                <h3><i class="fas fa-user"></i> Jenny Lorena Useche Guerrero</h3>
                <p><i class="fas fa-phone"></i> Celular: <strong>320 211 6349</strong></p>
                <p><i class="fas fa-envelope"></i> Correo: <strong>sistemafoodchef@gmail.com</strong></p>
            </div>
        </div>

        <!-- ======== FORMULARIO DE CONTACTO ======== -->
        <form action="EnviarMensaje" method="post">
            <h3 style="color:#6C3483; text-align:center; margin-bottom:20px;">
                <i class="fas fa-envelope-open-text"></i> Envíanos un mensaje
            </h3>

            <label for="nombre">Nombre completo:</label>
            <input type="text" id="nombre" name="nombre" required>

            <label for="correo">Correo electrónico:</label>
            <input type="email" id="correo" name="correo" required>

            <label for="asunto">Asunto:</label>
            <input type="text" id="asunto" name="asunto" required>

            <label for="mensaje">Mensaje:</label>
            <textarea id="mensaje" name="mensaje" rows="5" required></textarea>

            <button type="submit"><i class="fas fa-paper-plane"></i> Enviar mensaje</button>
        </form>

        <a href="inicio.jsp" class="volver">
            <i class="fas fa-arrow-left"></i> Volver al inicio
        </a>
    </div>

    <footer>
        &copy; 2025 FoodChef | Sistema de Gestión de Inventario
    </footer>

</body>
</html>
