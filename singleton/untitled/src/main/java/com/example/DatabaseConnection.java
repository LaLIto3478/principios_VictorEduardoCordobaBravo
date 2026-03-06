package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {
    // Instancia única del Singleton
    private static DatabaseConnection instance;
    // Objeto de Conexión
    private Connection connection;
    // Datos de Conexión
    private static final String URL = "jdbc:mysql://localhost:3306/base";
    private static final String USER = "bruce";
    private static final String PASSWORD = "adsoft";

    // Constructor privado
    private DatabaseConnection() {
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexión exitosa a la base de datos");
        } catch(SQLException e){
            throw new RuntimeException("Error al conectar con la base de datos.", e);
        }
    }

    public static DatabaseConnection getInstance() {
        if(instance == null) {
            instance = new DatabaseConnection();
        }
        return instance;
    }

    public Connection getConnection() {
        return connection;
    }
}
