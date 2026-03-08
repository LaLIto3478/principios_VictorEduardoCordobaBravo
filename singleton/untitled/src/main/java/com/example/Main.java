package com.example;

import java.sql.Connection;

public class Main {
    public static void main(String[] args) {
        // Obtener la conexión desde diferentes puntos
        Connection connection1 = DatabaseConnection.getInstance().getConnection();
        Connection connection2 = DatabaseConnection.getInstance().getConnection();

        // Ambas intancias apuntan a la misma dirección
        System.out.println(connection1 == connection2);
    }
}
