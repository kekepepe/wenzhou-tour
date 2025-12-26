package com.wenzhou.dao;

import com.wenzhou.model.User;
import com.wenzhou.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户数据访问对象 (User DAO)
 */
public class UserDAO extends BaseDAO<User> {

    @Override
    protected User mapResultSet(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password"));
        user.setEmail(rs.getString("email"));
        user.setPhone(rs.getString("phone"));
        user.setRole(rs.getString("role"));
        user.setImagePath(rs.getString("photo_path")); // Updated column name
        user.setAddress(rs.getString("address")); // New field
        user.setRealName(rs.getString("real_name")); // New field
        return user;
    }

    public User login(String username, String password) {
        String sql = "SELECT * FROM user_info WHERE username = ? AND password = ?";
        return queryOne(sql, username, password);
    }

    /**
     * 用户注册 (User Registration)
     */
    public boolean registerUser(User user) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO user_info (username, password, real_name, email, phone, address, photo_path, role) VALUES (?, ?, ?, ?, ?, ?, ?, 'user')";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getRealName());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getPhone());
            pstmt.setString(6, user.getAddress());
            pstmt.setString(7, user.getImagePath());

            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.err.println("Register Error: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            DBUtil.close(conn, pstmt);
        }
    }

    public List<User> findAll() {
        return queryList("SELECT * FROM user_info");
    }

    public boolean updateUser(User user) {
        String sql = "UPDATE user_info SET email=?, phone=?, address=?, photo_path=?, real_name=? WHERE id=?";
        return update(sql, user.getEmail(), user.getPhone(), user.getAddress(), user.getImagePath(), user.getRealName(),
                user.getId());
    }

    public boolean delete(int id) {
        return update("DELETE FROM user_info WHERE id = ?", id);
    }
}
