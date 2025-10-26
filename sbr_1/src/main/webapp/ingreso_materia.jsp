<%-- 
    Document   : ingreso_materia
    Created on : 19/10/2025, 10:05:13 p. m.
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
    <meta charset="UTF-8" />
    <title>Ingreso de Materia Prima - FoodChef</title>
    <style>
        /* ======== ESTILO GENERAL ======== */
        body {
            font-family: 'Segoe UI', 'Times New Roman', sans-serif;
            background: linear-gradient(rgba(230, 224, 248, 0.95), rgba(230, 224, 248, 0.95)),
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

        /* ======== FORMULARIOS ======== */
        form {
            margin-bottom: 25px;
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

        /* ======== PIE ======== */
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

        /* ======== CONTENEDOR DE BOTONES ======== */
        .botones-acciones {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 15px;
        }

        /* ======== RESPONSIVE ======== */
        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }
        }

        .separador {
            border-bottom: 2px solid #D2B4DE;
            margin: 25px 0;
        }
    </style>
</head>

<body>

    <div class="container">
        <h2>Ingreso de Materia Prima</h2>

        <!-- ======== FORMULARIO PRINCIPAL ======== -->
        <form id="formIngreso" onsubmit="return false;">
            <div class="form-grid">
                <div>
                    <label for="proveedor">Proveedor:</label>
                    <input type="text" id="proveedor" name="proveedor" required>
                </div>
                <div>
                    <label for="fechaIngreso">Fecha de Ingreso:</label>
                    <input type="date" id="fechaIngreso" name="fechaIngreso" required value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">
                </div>
            </div>

            <div>
                <label for="observaciones">Observaciones:</label>
                <textarea id="observaciones" name="observaciones" rows="3" placeholder="Escribe detalles adicionales aquí..."></textarea>
            </div>

            <div class="separador"></div>

            <!-- ======== SECCIÓN PARA AGREGAR PRODUCTOS ======== -->
            <h3 style="color:#5B2C6F;">Agregar Productos</h3>
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
                    <label for="cantidad">Cantidad:</label>
                    <input type="number" id="cantidad" min="0.01" step="0.01" required>
                </div>
                <div>
                    <label for="precioUnitario">Precio Unitario:</label>
                    <input type="number" id="precioUnitario" min="0.01" step="0.01" required>
                </div>
            </div>

            <div class="botones-acciones">
                <button type="button" class="btn" onclick="agregarProducto()">Agregar Producto</button>
                <button type="button" class="btn-secundario" onclick="limpiarFormularioProducto()">Limpiar Campos</button>
            </div>

            <div class="separador"></div>

            <!-- ======== TABLA DE PRODUCTOS (ABAJO) ======== -->
            <h3 style="text-align:center;color:#5B2C6F;">Productos Ingresados</h3>
            <table id="tablaProductos">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Medida</th>
                        <th>Cantidad</th>
                        <th>Precio Unitario</th>
                        <th>Subtotal</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Productos agregados se mostrarán aquí -->
                </tbody>
            </table>

            <div class="botones-acciones">
                <button type="submit" class="btn" onclick="confirmarEnvio()">Confirmar Ingreso</button>
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
            const precio = parseFloat(document.getElementById('precioUnitario').value);

            if (!codigo || !nombre || !medida || isNaN(cantidad) || isNaN(precio)) {
                alert("Por favor completa todos los campos correctamente.");
                return;
            }

            const subtotal = cantidad * precio;
            productos.push({ codigo, nombre, medida, cantidad, precio, subtotal });

            actualizarTabla();
            limpiarFormularioProducto();
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
                    <td>$${p.precio.toFixed(2)}</td>
                    <td>$${p.subtotal.toFixed(2)}</td>
                    <td><button type="button" class="btn-secundario" onclick="eliminarProducto(${index})">Eliminar</button></td>
                `;
                tbody.appendChild(fila);
            });
        }

        function eliminarProducto(index) {
            productos.splice(index, 1);
            actualizarTabla();
        }

        function limpiarFormularioProducto() {
            document.getElementById('codigoProducto').value = '';
            document.getElementById('nombreProducto').value = '';
            document.getElementById('medida').selectedIndex = 0;
            document.getElementById('cantidad').value = '';
            document.getElementById('precioUnitario').value = '';
            document.getElementById('codigoProducto').focus();
        }

        function limpiarTodo() {
            if (confirm("¿Deseas limpiar todos los datos ingresados?")) {
                productos = [];
                document.getElementById('formIngreso').reset();
                document.querySelector('#tablaProductos tbody').innerHTML = '';
            }
        }

        function confirmarEnvio() {
            if (productos.length === 0) {
                alert("Agrega al menos un producto antes de confirmar.");
                return false;
            }
            const productosJson = JSON.stringify(productos);
            alert("Productos listos para enviar:\n" + productosJson);
            return true;
        }
    </script>

</body>
</html>
