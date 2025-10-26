<%-- 
    Document   : salida_materia
    Created on : 19/10/2025, 10:18:18 p. m.
    Author     : Johana Melo
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
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
    <title>Salida de Materia Prima - FoodChef</title>
    <style>
        /* ======== ESTILO GENERAL ======== */
        body {
            font-family: 'Segoe UI', 'Times New Roman', sans-serif;
            background: linear-gradient(rgba(235, 228, 250, 0.9), rgba(235, 228, 250, 0.9)),
                        url('imagenes/fondo_foodchef.jpg');
            background-size: cover;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            color: #4A235A;
        }

        .container {
            width: 90%;
            max-width: 950px;
            margin: 50px auto;
            background: #fff;
            border-radius: 15px;
            border: 2px solid #D2B4DE;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.25);
            padding: 40px 50px;
        }

        h2 {
            color: #5B2C6F;
            text-align: center;
            margin-bottom: 30px;
            font-size: 26px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
            color: #5B2C6F;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #D2B4DE;
            border-radius: 8px;
            font-size: 15px;
            color: #333;
            transition: 0.3s;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #8E44AD;
            outline: none;
            box-shadow: 0 0 4px #BB8FCE;
        }

        textarea {
            resize: none;
        }

        /* ======== BOTONES ======== */
        .btn {
            background-color: #8E44AD;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn:hover {
            background-color: #BB8FCE;
            transform: scale(1.05);
        }

        .btn-secundario {
            background-color: #E74C3C;
        }

        .btn-secundario:hover {
            background-color: #C0392B;
        }

        .botones-acciones {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 15px;
        }

        /* ======== TABLA ======== */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #E2CFF0;
        }

        th {
            background-color: #F8F1FB;
            color: #5B2C6F;
            font-size: 15px;
        }

        td {
            font-size: 14px;
        }

        .footer-link {
            display: inline-block;
            text-align: center;
            margin-top: 30px;
            color: #5B2C6F;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        .footer-link:hover {
            color: #8E44AD;
            text-decoration: underline;
        }

        .separador {
            border-bottom: 2px solid #D2B4DE;
            margin: 25px 0;
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Salida de Materia Prima</h2>

    <!-- ======== FORMULARIO PRINCIPAL ======== -->
    <form id="formSalida" onsubmit="return false;">
        <div class="form-grid">
            <div>
                <label for="responsable">Responsable:</label>
                <input type="text" id="responsable" name="responsable" required>
            </div>
            <div>
                <label for="fechaSalida">Fecha de Salida:</label>
                <input type="date" id="fechaSalida" name="fechaSalida" required value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
            </div>
            <div>
                <label for="motivo">Motivo de salida:</label>
                <select id="motivo" name="motivo" required>
                    <option value="" disabled selected>Selecciona un motivo</option>
                    <option value="Producción">Producción</option>
                    <option value="Mermas">Mermas</option>
                    <option value="Donación">Donación</option>
                    <option value="Otro">Otro</option>
                </select>
            </div>
        </div>

        <div>
            <label for="observaciones">Observaciones:</label>
            <textarea id="observaciones" name="observaciones" rows="3" placeholder="Detalles adicionales..."></textarea>
        </div>

        <div class="separador"></div>

        <!-- ======== SECCIÓN DE PRODUCTOS ======== -->
        <h3 style="color:#5B2C6F;">Agregar Productos a Retirar</h3>
        <div class="form-grid">
            <div>
                <label for="codigoProducto">Código Producto:</label>
                <input type="text" id="codigoProducto" required>
            </div>
            <div>
                <label for="nombreProducto">Nombre Producto:</label>
                <input type="text" id="nombreProducto" required>
            </div>
            <div>
                <label for="medida">Medida:</label>
                <select id="medida" required>
                    <option value="" disabled selected>Selecciona</option>
                    <option value="kg">Kilogramos</option>
                    <option value="g">Gramos</option>
                    <option value="l">Litros</option>
                    <option value="ml">Mililitros</option>
                    <option value="unidades">Unidades</option>
                </select>
            </div>
            <div>
                <label for="cantidad">Cantidad a retirar:</label>
                <input type="number" id="cantidad" min="0.01" step="0.01" required>
            </div>
        </div>

        <div class="botones-acciones">
            <button type="button" class="btn" onclick="agregarProducto()">Agregar Producto</button>
            <button type="button" class="btn-secundario" onclick="limpiarCamposProducto()">Limpiar Campos</button>
        </div>

        <div class="separador"></div>

        <!-- ======== TABLA DE PRODUCTOS ======== -->
        <h3 style="text-align:center;color:#5B2C6F;">Productos a Retirar</h3>
        <table id="tablaProductos">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nombre</th>
                    <th>Medida</th>
                    <th>Cantidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <!-- Productos agregados se mostrarán aquí -->
            </tbody>
        </table>

        <div class="botones-acciones">
            <button type="submit" class="btn" onclick="confirmarEnvio()">Confirmar Salida</button>
            <button type="button" class="btn-secundario" onclick="limpiarTodo()">Limpiar Todo</button>
        </div>
    </form>

    <div style="text-align: center;">
        <a href="Bienvenido.jsp" class="footer-link">← Volver al panel principal</a>
    </div>
</div>

<script>
    let productos = [];

    function agregarProducto() {
        const codigo = document.getElementById('codigoProducto').value.trim();
        const nombre = document.getElementById('nombreProducto').value.trim();
        const medida = document.getElementById('medida').value;
        const cantidad = parseFloat(document.getElementById('cantidad').value);

        if (!codigo || !nombre || !medida || isNaN(cantidad)) {
            alert("Por favor completa todos los campos correctamente.");
            return;
        }

        productos.push({ codigo, nombre, medida, cantidad });
        actualizarTabla();
        limpiarCamposProducto();
    }

    function actualizarTabla() {
        const tbody = document.querySelector('#tablaProductos tbody');
        tbody.innerHTML = '';

        productos.forEach((p, index) => {
            const fila = document.createElement('tr');
            fila.innerHTML = `
                <td>${p.codigo}</td>
                <td>${p.nombre}</td>
                <td>${p.medida}</td>
                <td>${p.cantidad}</td>
                <td><button type="button" class="btn-secundario" onclick="eliminarProducto(${index})">Eliminar</button></td>
            `;
            tbody.appendChild(fila);
        });
    }

    function eliminarProducto(index) {
        productos.splice(index, 1);
        actualizarTabla();
    }

    function limpiarCamposProducto() {
        document.getElementById('codigoProducto').value = '';
        document.getElementById('nombreProducto').value = '';
        document.getElementById('medida').selectedIndex = 0;
        document.getElementById('cantidad').value = '';
        document.getElementById('codigoProducto').focus();
    }

    function limpiarTodo() {
        if (confirm("¿Deseas limpiar todos los datos ingresados?")) {
            productos = [];
            document.getElementById('formSalida').reset();
            document.querySelector('#tablaProductos tbody').innerHTML = '';
        }
    }

    function confirmarEnvio() {
        if (productos.length === 0) {
            alert("Agrega al menos un producto antes de confirmar la salida.");
            return false;
        }

        const salidaData = {
            responsable: document.getElementById('responsable').value,
            fechaSalida: document.getElementById('fechaSalida').value,
            motivo: document.getElementById('motivo').value,
            observaciones: document.getElementById('observaciones').value,
            productos: productos
        };

        const salidaJson = JSON.stringify(salidaData, null, 2);
        alert("Datos listos para enviar:\n" + salidaJson);

        // Aquí puedes hacer submit real al servlet si lo necesitas:
        // document.getElementById('productosJson').value = JSON.stringify(salidaData);
        // document.getElementById('formSalida').submit();

        return true;
    }
</script>

</body>
</html>
