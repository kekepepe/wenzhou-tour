package com.wenzhou.dao;

import com.wenzhou.model.Attraction;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * 景点模块DAO
 */
public class AttractionDAO extends BaseDAO<Attraction> {

    @Override
    protected Attraction mapResultSet(ResultSet rs) throws SQLException {
        Attraction attr = new Attraction();
        attr.setId(rs.getInt("id"));
        attr.setName(rs.getString("name"));
        attr.setLocation(rs.getString("location"));
        attr.setDescription(rs.getString("description"));
        attr.setTicketPrice(rs.getBigDecimal("ticket_price"));
        attr.setImagePath(rs.getString("photo_path"));
        attr.setOpenTime(rs.getString("open_time"));
        return attr;
    }

    public List<Attraction> findAll() {
        return queryList("SELECT * FROM hometown_scenic");
    }

    public List<Attraction> findByName(String name) {
        return queryList("SELECT * FROM hometown_scenic WHERE name LIKE ?", "%" + name + "%");
    }

    public boolean add(Attraction attr) {
        String sql = "INSERT INTO hometown_scenic (name, location, description, ticket_price, photo_path, open_time) VALUES (?, ?, ?, ?, ?, ?)";
        return update(sql, attr.getName(), attr.getLocation(), attr.getDescription(), attr.getTicketPrice(),
                attr.getImagePath(), attr.getOpenTime());
    }

    public boolean update(Attraction attr) {
        String sql = "UPDATE hometown_scenic SET name=?, location=?, description=?, ticket_price=?, photo_path=?, open_time=? WHERE id=?";
        return update(sql, attr.getName(), attr.getLocation(), attr.getDescription(), attr.getTicketPrice(),
                attr.getImagePath(), attr.getOpenTime(), attr.getId());
    }

    public boolean delete(int id) {
        return update("DELETE FROM hometown_scenic WHERE id=?", id);
    }
}
