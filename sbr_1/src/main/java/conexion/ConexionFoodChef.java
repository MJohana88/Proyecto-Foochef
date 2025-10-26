/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionFoodChef {

    private static final String URL = "jdbc:mysql://localhost:3306/sys";
    private static final String USER = "root"; // Cambia si tu usuario es diferente
    private static final String PASSWORD = "1051588863"; // Cambia si tu MySQL tiene contraseña

     static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("✅ Driver MySQL cargado correctamente.");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ Error al cargar el driver MySQL: " + e.getMessage());
        }
    }

        public static Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("🔗 Conexión establecida con la base de datos FoodChef.");
        } catch (SQLException e) {
            System.err.println("⚠️ Error al conectar con la base de datos: " + e.getMessage());
        }
        return connection;
    }

        public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("🔒 Conexión cerrada correctamente.");
            } catch (SQLException e) {
                System.err.println("⚠️ Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }
}
