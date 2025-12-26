package com.wenzhou.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/wenzhou_db?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
    private static final String USER = "root";
    private static final String PASSWORD = "563170po"; // Updated password

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        try {
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            if (conn == null) {
                System.out.println("Error: Failed to create database connection.");
            }
            return conn;
        } catch (SQLException e) {
            System.err.println("DB Connection Error: " + e.getMessage());
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Connection conn, PreparedStatement pstmt) {
        close(conn, pstmt, null);
    }

    /**
     * Test Connection
     */
    public static void main(String[] args) {
        Connection conn = getConnection();
        if (conn != null) {
            System.out.println("数据库连接成功！(Database Connection Successful!)");
            close(conn, null);
        } else {
            System.out.println("数据库连接失败，请检查配置。(Database Connection Failed, please check config.)");
        }
    }
}
