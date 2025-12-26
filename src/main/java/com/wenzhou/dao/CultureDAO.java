package com.wenzhou.dao;

import com.wenzhou.model.Culture;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * 文化模块DAO (Culture DAO)
 * 对应表: hometown_culture
 */
public class CultureDAO extends BaseDAO<Culture> {

    @Override
    protected Culture mapResultSet(ResultSet rs) throws SQLException {
        Culture culture = new Culture();
        culture.setId(rs.getInt("id"));
        culture.setName(rs.getString("name")); // Model update needed: title -> name
        culture.setType(rs.getString("type")); // Model update needed
        culture.setDescription(rs.getString("description"));
        culture.setHistory(rs.getString("history")); // Model update needed
        culture.setImagePath(rs.getString("photo_path"));
        culture.setStatus(rs.getString("status")); // Model update needed
        return culture;
    }

    public List<Culture> findAll() {
        return queryList("SELECT * FROM hometown_culture");
    }

    public List<Culture> searchByName(String keyword) {
        return queryList("SELECT * FROM hometown_culture WHERE name LIKE ?", "%" + keyword + "%");
    }

    public Culture findById(int id) {
        return queryOne("SELECT * FROM hometown_culture WHERE id = ?", id);
    }

    public boolean add(Culture culture) {
        String sql = "INSERT INTO hometown_culture (name, type, description, history, photo_path, status) VALUES (?, ?, ?, ?, ?, ?)";
        return update(sql, culture.getName(), culture.getType(), culture.getDescription(), culture.getHistory(),
                culture.getImagePath(), culture.getStatus());
    }

    public boolean updateCulture(Culture culture) {
        String sql = "UPDATE hometown_culture SET name=?, type=?, description=?, history=?, photo_path=?, status=? WHERE id=?";
        return update(sql, culture.getName(), culture.getType(), culture.getDescription(), culture.getHistory(),
                culture.getImagePath(), culture.getStatus(), culture.getId());
    }

    public boolean delete(int id) {
        return update("DELETE FROM hometown_culture WHERE id = ?", id);
    }
}
