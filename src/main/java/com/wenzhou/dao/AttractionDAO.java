package com.wenzhou.dao;

import com.wenzhou.model.Attraction;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * 景点模块DAO (Attraction DAO)
 * 对应表: hometown_scenic
 */
public class AttractionDAO extends BaseDAO<Attraction> {

    @Override
    protected Attraction mapResultSet(ResultSet rs) throws SQLException {
        Attraction attraction = new Attraction();
        attraction.setId(rs.getInt("id"));
        attraction.setName(rs.getString("name"));
        attraction.setLocation(rs.getString("location"));
        attraction.setDescription(rs.getString("description"));
        attraction.setTicketPrice(rs.getBigDecimal("price"));
        attraction.setImagePath(rs.getString("photo_path"));
        attraction.setOpenTime(rs.getString("open_time")); // Assumes added to Model
        return attraction;
    }

    public List<Attraction> findAll() {
        return queryList("SELECT * FROM hometown_scenic");
    }

    public List<Attraction> searchByName(String keyword) {
        return queryList("SELECT * FROM hometown_scenic WHERE name LIKE ?", "%" + keyword + "%");
    }

    public Attraction findById(int id) {
        return queryOne("SELECT * FROM hometown_scenic WHERE id = ?", id);
    }

    public boolean add(Attraction attraction) {
        String sql = "INSERT INTO hometown_scenic (name, location, description, price, photo_path, open_time) VALUES (?, ?, ?, ?, ?, ?)";
        return update(sql, attraction.getName(), attraction.getLocation(), attraction.getDescription(),
                attraction.getTicketPrice(), attraction.getImagePath(), attraction.getOpenTime());
    }

    public boolean updateAttraction(Attraction attraction) {
        String sql = "UPDATE hometown_scenic SET name=?, location=?, description=?, price=?, photo_path=?, open_time=? WHERE id=?";
        return update(sql, attraction.getName(), attraction.getLocation(), attraction.getDescription(),
                attraction.getTicketPrice(), attraction.getImagePath(), attraction.getOpenTime(), attraction.getId());
    }

    public boolean delete(int id) {
        return update("DELETE FROM hometown_scenic WHERE id = ?", id);
    }
}
