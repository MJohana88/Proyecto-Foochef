<%-- 
    Document   : orden_compra
    Created on : 19/10/2025, 9:41:55 p. m.
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
    <title>Orden de Compra - FoodChef</title>
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
            padding: 20px;
        }

        /* ======== CONTENEDOR FORMULARIO ======== */
        .form-container {
            background-color: #fff;
            border: 2px solid #D2B4DE;
            border-radius: 12px;
            padding: 30px 40px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.25);
            width: 100%;
            max-width: 900px;
            margin: auto;
        }

        h2 {
            color: #5B2C6F;
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #4A235A;
            font-size: 16px;
        }

        input[type="text"],
        input[type="date"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px 12px;
            margin-top: 6px;
            border: 1px solid #D2B4DE;
            border-radius: 8px;
            font-size: 15px;
            font-family: inherit;
            color: #333;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        input[type="number"]:focus,
        textarea:focus {
            border-color: #8E44AD;
            outline: none;
        }

        textarea {
            resize: vertical;
        }

        /* Botones generales */
        button {
            margin-top: 20px;
            background-color: #8E44AD;
            color: white;
            font-weight: bold;
            padding: 12px 20px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            margin-right: 10px;
        }

        button:hover {
            background-color: #BB8FCE;
            transform: scale(1.05);
        }

        /* Contenedor de botones de producto */
        .product-buttons {
            margin-top: 10px;
            text-align: right;
        }

        /* Tabla de productos */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        th, td {
            border: 1px solid #D2B4DE;
            padding: 10px;
            text-align: center;
            color: #5B2C6F;
        }

        th {
            background-color: #F8F1FB;
        }

        /* Footer con confirmacion e imprimir */
        .footer-buttons {
            margin-top: 30px;
            text-align: center;
        }

        /* Link para volver */
        a.back-link {
            display: block;
            margin-top: 30px;
            text-align: center;
            color: #5B2C6F;
            font-weight: bold;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        a.back-link:hover {
            color: #8E44AD;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Orden de Compra</h2>

    <!-- Datos generales -->
    <label for="proveedor">Proveedor:</label>
    <input type="text" id="proveedor" placeholder="Nombre del proveedor" required>

    <label for="fecha_orden">Fecha de Orden:</label>
    <input type="date" id="fecha_orden" required>

    <!-- Datos productos -->
    <h3>Agregar Producto</h3>

    <label for="cod_producto">Código Producto:</label>
    <input type="text" id="cod_producto" placeholder="Código del producto" required>

    <label for="nombre_producto">Nombre Producto:</label>
    <input type="text" id="nombre_producto" placeholder="Nombre del producto" required>

    <label for="cantidad">Cantidad:</label>
    <input type="number" id="cantidad" min="1" placeholder="Cantidad" required>

    <label for="observaciones">Observaciones (general):</label>
    <textarea id="observaciones" rows="3" placeholder="Observaciones generales para la orden"></textarea>

    <div class="product-buttons">
        <button type="button" onclick="agregarProducto()">Agregar</button>
        <button type="button" onclick="modificarProducto()" disabled id="btnModificar">Modificar</button>
        <button type="button" onclick="eliminarProducto()" disabled id="btnEliminar">Eliminar</button>
    </div>

    <!-- Tabla de productos agregados -->
    <table id="tablaProductos">
        <thead>
            <tr>
                <th>Código Producto</th>
                <th>Nombre Producto</th>
                <th>Cantidad</th>
            </tr>
        </thead>
        <tbody>
            <!-- Productos agregados aquí -->
        </tbody>
    </table>

    <!-- Botones confirmar e imprimir -->
    <div class="footer-buttons">
        <button type="button" onclick="confirmarOrden()">Confirmar Orden</button>
        <button type="button" onclick="window.print()">Imprimir</button>
    </div>

    <a href="Bienvenido.jsp" class="back-link">Volver al panel</a>
</div>

<script>
    let productos = [];
    let indiceSeleccionado = -1;

    function limpiarCamposProducto() {
        document.getElementById('cod_producto').value = '';
        document.getElementById('nombre_producto').value = '';
        document.getElementById('cantidad').value = '';
        document.getElementById('btnModificar').disabled = true;
        document.getElementById('btnEliminar').disabled = true;
        indiceSeleccionado = -1;
    }

    function agregarProducto() {
        const codigo = document.getElementById('cod_producto').value.trim();
        const nombre = document.getElementById('nombre_producto').value.trim();
        const cantidad = parseInt(document.getElementById('cantidad').value);

        if (!codigo || !nombre || isNaN(cantidad) || cantidad < 1) {
            alert("Por favor, completa todos los campos de producto correctamente.");
            return;
        }

        // Evitar agregar producto con mismo código repetido
        if(productos.some(p => p.codigo === codigo)) {
            alert("El producto ya fue agregado. Puedes modificarlo si deseas cambiar la cantidad.");
            return;
        }

        productos.push({codigo: codigo, nombre: nombre, cantidad: cantidad});
        actualizarTabla();
        limpiarCamposProducto();
    }

    function actualizarTabla() {
        const tbody = document.querySelector('#tablaProductos tbody');
        tbody.innerHTML = '';

        productos.forEach((prod, index) => {
            const fila = document.createElement('tr');
            fila.innerHTML = `<td>${prod.codigo}</td><td>${prod.nombre}</td><td>${prod.cantidad}</td>`;
            fila.style.cursor = 'pointer';
            fila.onclick = () => seleccionarProducto(index);
            if(index === indiceSeleccionado) {
                fila.style.backgroundColor = '#E8DAEF';
            }
            tbody.appendChild(fila);
        });
    }

    function seleccionarProducto(index) {
        indiceSeleccionado = index;
        const prod = productos[index];

        document.getElementById('cod_producto').value = prod.codigo;
        document.getElementById('nombre_producto').value = prod.nombre;
        document.getElementById('cantidad').value = prod.cantidad;

        document.getElementById('btnModificar').disabled = false;
        document.getElementById('btnEliminar').disabled = false;

        actualizarTabla();
    }

    function modificarProducto() {
        if(indiceSeleccionado < 0) return;

        const codigo = document.getElementById('cod_producto').value.trim();
        const nombre = document.getElementById('nombre_producto').value.trim();
        const cantidad = parseInt(document.getElementById('cantidad').value);

        if (!codigo || !nombre || isNaN(cantidad) || cantidad < 1) {
            alert("Por favor, completa todos los campos de producto correctamente.");
            return;
        }

        // Verificar si el código modificado ya existe en otro producto
        for(let i = 0; i < productos.length; i++) {
            if(i !== indiceSeleccionado && productos[i].codigo === codigo) {
                alert("Ya existe otro producto con este código.");
                return;
            }
        }

        productos[indiceSeleccionado] = {codigo: codigo, nombre: nombre, cantidad: cantidad};
        limpiarCamposProducto();
        actualizarTabla();
    }

    function eliminarProducto() {
        if(indiceSeleccionado < 0) return;

        productos.splice(indiceSeleccionado, 1);
        limpiarCamposProducto();
        actualizarTabla();
    }

    function confirmarOrden() {
        const proveedor = document.getElementById('proveedor').value.trim();
        const fechaOrden = document.getElementById('fecha_orden').value;
        const observaciones = document.getElementById('observaciones').value.trim();

        if(!proveedor || !fechaOrden) {
            alert("Por favor, ingresa proveedor y fecha de orden.");
            return;
        }

        if(productos.length === 0) {
            alert("Agrega al menos un producto a la orden.");
            return;
        }

        // Aquí podrías enviar los datos al servidor vía AJAX o formulario.
        // Por simplicidad, te muestro cómo crear un formulario y enviarlo por POST

        // Crear formulario dinámico para enviar datos
        const form = document.createElement('form');
        form.method = 'post';
        form.action = 'RegistrarOrdenCompra'; // tu servlet o controlador que procese la orden

        form.appendChild(crearInputOculto('proveedor', proveedor));
        form.appendChild(crearInputOculto('fecha_orden', fechaOrden));
        form.appendChild(crearInputOculto('observaciones', observaciones));
        form.appendChild(crearInputOculto('productos', JSON.stringify(productos)));

        document.body.appendChild(form);
        form.submit();
    }

    function crearInputOculto(name, value) {
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = name;
        input.value = value;
        return input;
    }
</script>

</body>
</html>
