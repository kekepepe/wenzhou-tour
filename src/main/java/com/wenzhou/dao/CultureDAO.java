package com.wenzhou.dao;

import com.wenzhou.model.Culture;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * 文化模块DAO
 */
public class CultureDAO extends BaseDAO<Culture> {

    @Override
    protected Culture mapResultSet(ResultSet rs) throws SQLException {
        Culture c = new Culture();
        c.setId(rs.getInt("id"));
        c.setName(rs.getString("name"));
        c.setType(rs.getString("type"));
        c.setDescription(rs.getString("description"));
        c.setHistory(rs.getString("history"));
        c.setImagePath(rs.getString("photo_path"));
        c.setStatus(rs.getString("status"));
        return c;
    }

    public List<Culture> findAll() {
        return queryList("SELECT * FROM hometown_culture");
    }

    public List<Culture> findByName(String name) {
        return queryList("SELECT * FROM hometown_culture WHERE name LIKE ?", "%" + name + "%");
    }

    public boolean add(Culture c) {
        String sql = "INSERT INTO hometown_culture (name, type, description, history, photo_path, status) VALUES (?, ?, ?, ?, ?, ?)";
        return update(sql, c.getName(), c.getType(), c.getDescription(), c.getHistory(), c.getImagePath(),
                c.getStatus());
    }

    public boolean update(Culture c) {
        String sql = "UPDATE hometown_culture SET name=?, type=?, description=?, history=?, photo_path=?, status=? WHERE id=?";
        return update(sql, c.getName(), c.getType(), c.getDescription(), c.getHistory(), c.getImagePath(),
                c.getStatus(), c.getId());
    }

    public boolean delete(int id) {
        return update("DELETE FROM hometown_culture WHERE id=?", id);
    }
}
