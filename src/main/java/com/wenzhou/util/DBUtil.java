package com.wenzhou.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 数据库工具类 (Database Utility Class)
 * 用于获取数据库连接和释放资源
 */
public class DBUtil {

    private static final String URL = "jdbc:mysql://localhost:3306/wenzhou_db?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
    private static final String USER = "root"; // 默认用户名，请根据环境修改
    private static final String PASSWORD = "password"; // 默认密码，请根据环境修改

    // 加载驱动
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取数据库连接
     * 
     * @return Connection对象
     */
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

    /**
     * 释放资源
     * 
     * @param conn  连接对象
     * @param pstmt 预编译语句对象
     * @param rs    结果集对象
     */
    public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Connection conn, PreparedStatement pstmt) {
        close(conn, pstmt, null);
    }
}
