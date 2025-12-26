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
        user.setRealName(rs.getString("real_name"));
        user.setEmail(rs.getString("email"));
        user.setPhone(rs.getString("phone"));
        user.setAddress(rs.getString("address"));
        user.setImagePath(rs.getString("photo_path"));
        user.setRole(rs.getString("role"));
        return user;
    }

    /**
     * 用户登录 (Login)
     */
    public User login(String username, String password) {
        String sql = "SELECT * FROM user_info WHERE username = ? AND password = ?";
        return queryOne(sql, username, password);
    }

    /**
     * 用户注册 (Register)
     */
    public boolean registerUser(User user) {
        String sql = "INSERT INTO user_info (username, password, real_name, email, phone, address, photo_path, role) VALUES (?, ?, ?, ?, ?, ?, ?, 'user')";
        return update(sql, user.getUsername(), user.getPassword(), user.getRealName(), user.getEmail(), user.getPhone(),
                user.getAddress(), user.getImagePath());
    }

    public List<User> findAll() {
        return queryList("SELECT * FROM user_info");
    }

    public boolean update(User user) {
        String sql = "UPDATE user_info SET real_name=?, email=?, phone=?, address=?, photo_path=? WHERE id=?";
        return update(sql, user.getRealName(), user.getEmail(), user.getPhone(), user.getAddress(), user.getImagePath(),
                user.getId());
    }

    public boolean delete(int id) {
        return update("DELETE FROM user_info WHERE id = ?", id);
    }
}
