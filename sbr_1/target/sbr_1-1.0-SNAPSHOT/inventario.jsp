<%-- 
    Document   : inventario
    Created on : 19/10/2025, 9:52:18 p. m.
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
    <title>Inventario y Movimientos - FoodChef</title>
    <style>
        body {
            margin: 0; padding: 0;
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
        .container {
            background: #fff;
            border: 2px solid #D2B4DE;
            border-radius: 12px;
            padding: 30px 40px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.25);
            max-width: 1100px;
            margin: auto;
        }
        h2 {
            color: #5B2C6F;
            text-align: center;
            margin-bottom: 20px;
        }
        form {
            margin-bottom: 30px;
            display: grid;
            grid-template-columns: repeat(auto-fit,minmax(220px,1fr));
            gap: 20px;
            align-items: end;
        }
        label {
            font-weight: bold;
            color: #5B2C6F;
        }
        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 6px 8px;
            border: 1px solid #D2B4DE;
            border-radius: 5px;
            font-size: 14px;
        }
        button {
            background-color: #8E44AD;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
            grid-column: span 1;
            justify-self: start;
        }
        button:hover {
            background-color: #BB8FCE;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 40px;
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
        .actions button {
            margin: 2px;
            padding: 5px 10px;
            font-weight: normal;
            font-size: 13px;
        }
        .btn-confirmar {
            background-color: #27AE60;
            color: white;
        }
        .btn-confirmar:hover {
            background-color: #2ECC71;
        }
        .btn-imprimir {
            background-color: #2980B9;
            color: white;
        }
        .btn-imprimir:hover {
            background-color: #3498DB;
        }
        a {
            color: #5B2C6F; 
            text-decoration: none; 
            font-weight: bold;
        }
        a:hover {
            color: #8E44AD;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Inventario y Movimientos</h2>
    <form action="InventarioServlet" method="get">
        <div>
            <label for="fechaInicio">Fecha inicio:</label><br>
            <input type="date" id="fechaInicio" name="fechaInicio" value="<%= request.getAttribute("fechaInicio") != null ? request.getAttribute("fechaInicio") : "" %>">
        </div>
        <div>
            <label for="fechaFin">Fecha final:</label><br>
            <input type="date" id="fechaFin" name="fechaFin" value="<%= request.getAttribute("fechaFin") != null ? request.getAttribute("fechaFin") : "" %>">
        </div>
        <div>
            <label for="proveedor">Proveedor:</label><br>
            <input type="text" id="proveedor" name="proveedor" placeholder="Nombre proveedor" value="<%= request.getAttribute("proveedorFiltro") != null ? request.getAttribute("proveedorFiltro") : "" %>">
        </div>
        <div>
            <label for="codigoProducto">Código producto:</label><br>
            <input type="text" id="codigoProducto" name="codigoProducto" placeholder="Código" value="<%= request.getAttribute("codigoProductoFiltro") != null ? request.getAttribute("codigoProductoFiltro") : "" %>">
        </div>
        <div>
            <label for="nombreProducto">Nombre producto:</label><br>
            <input type="text" id="nombreProducto" name="nombreProducto" placeholder="Nombre" value="<%= request.getAttribute("nombreProductoFiltro") != null ? request.getAttribute("nombreProductoFiltro") : "" %>">
        </div>
        <div>
            <button type="submit">Filtrar</button>
        </div>
    </form>

    <h3>Productos Filtrados</h3>
    <table>
        <thead>
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Cantidad Actual</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                java.util.List productos = (java.util.List) request.getAttribute("productos");
                if (productos != null && !productos.isEmpty()) {
                    for (Object obj : productos) {
                        java.util.Map prod = (java.util.Map) obj;
                        int id = (Integer) prod.get("id");
                        String codigo = (String) prod.get("codigo");
                        String nombre = (String) prod.get("nombre");
                        int cantidad = (Integer) prod.get("cantidad_actual");
            %>
            <tr>
                <td><%= codigo %></td>
                <td><%= nombre %></td>
                <td><%= cantidad %></td>
                <td class="actions">
                    <form action="AgregarMovimientoServlet" method="post" style="display:inline;">
                        <input type="hidden" name="productoId" value="<%= id %>">
                        <button type="submit">Agregar</button>
                    </form>
                    <form action="ModificarProductoServlet" method="get" style="display:inline;">
                        <input type="hidden" name="productoId" value="<%= id %>">
                        <button type="submit">Modificar</button>
                    </form>
                    <form action="EliminarProductoServlet" method="post" style="display:inline;" onsubmit="return confirm('¿Estás seguro de eliminar este producto?');">
                        <input type="hidden" name="productoId" value="<%= id %>">
                        <button type="submit">Eliminar</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4">No se encontraron productos.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <h3>Movimientos Filtrados</h3>
    <table>
        <thead>
            <tr>
                <th>Fecha</th>
                <th>Proveedor</th>
                <th>Código</th>
                <th>Nombre Producto</th>
                <th>Tipo</th>
                <th>Cantidad</th>
                <th>Observaciones</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                java.util.List movimientos = (java.util.List) request.getAttribute("movimientos");
                if (movimientos != null && !movimientos.isEmpty()) {
                    for (Object obj : movimientos) {
                        java.util.Map mov = (java.util.Map) obj;
                        int movId = (Integer) mov.get("id");
                        java.sql.Date fecha = (java.sql.Date) mov.get("fecha");
                        String prov = (String) mov.get("proveedor");
                        String codigo = (String) mov.get("codigo");
                        String nombre = (String) mov.get("nombre");
                        String tipo = (String) mov.get("tipo");
                        int cantidad = (Integer) mov.get("cantidad");
                        String obs = (String) mov.get("observaciones");
            %>
            <tr>
                <td><%= fecha %></td>
                <td><%= prov != null ? prov : "-" %></td>
                <td><%= codigo %></td>
                <td><%= nombre %></td>
                <td><%= tipo %></td>
                <td><%= cantidad %></td>
                <td><%= obs != null ? obs : "-" %></td>
                <td class="actions">
                    <form action="ModificarMovimientoServlet" method="get" style="display:inline;">
                        <input type="hidden" name="movimientoId" value="<%= movId %>">
                        <button type="submit">Modificar</button>
                    </form>
                    <form action="EliminarMovimientoServlet" method="post" style="display:inline;" onsubmit="return confirm('¿Estás seguro de eliminar este movimiento?');">
                        <input type="hidden" name="movimientoId" value="<%= movId %>">
                        <button type="submit">Eliminar</button>
                    </form>
                    <form action="ConfirmarMovimientoServlet" method="post" style="display:inline;">
                        <input type="hidden" name="movimientoId" value="<%= movId %>">
                        <button type="submit" class="btn-confirmar">Confirmar</button>
                    </form>
                    <form action="ImprimirMovimientoServlet" method="get" style="display:inline;" target="_blank">
                        <input type="hidden" name="movimientoId" value="<%= movId %>">
                        <button type="submit" class="btn-imprimir">Imprimir</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="8">No se encontraron movimientos.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a href="Bienvenido.jsp">Volver al panel principal</a>
</div>

</body>
</html>
