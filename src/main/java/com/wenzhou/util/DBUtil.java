package com.wenzhou.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/wenzhou_db?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
    private static final String USER = "root";
    private static final String PASSWORD = "563170po"; // Real password

    static {
        try {
            System.out.println("[DBUtil] Loading MySQL Driver...");
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("[DBUtil] Driver loaded successfully.");
        } catch (ClassNotFoundException e) {
            System.err.println("[DBUtil] Error loading driver: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        System.out.println("[DBUtil] Attempting to connect to database...");
        try {
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            if (conn == null) {
                System.err.println("[DBUtil] Error: DriverManager returned null connection.");
            } else {
                System.out.println("[DBUtil] Connection successful: " + conn);
            }
            return conn;
        } catch (SQLException e) {
            System.err.println("[DBUtil] Connection failed: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
            System.out.println("[DBUtil] Resources closed.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Connection conn, PreparedStatement pstmt) {
        close(conn, pstmt, null);
    }

    public static void main(String[] args) {
        System.out.println("--- Starting Verify Connection ---");
        Connection conn = getConnection();
        if (conn != null) {
            System.out.println("Test: Database connected!");
            close(conn, null);
        } else {
            System.err.println("Test: Database connection failed.");
        }
        System.out.println("--- End Verify Connection ---");
    }
}
