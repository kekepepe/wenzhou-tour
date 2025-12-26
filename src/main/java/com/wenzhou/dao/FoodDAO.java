package com.wenzhou.dao;

import com.wenzhou.model.Food;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * 美食模块DAO (Food DAO)
 * 对应表: hometown_food
 */
public class FoodDAO extends BaseDAO<Food> {

    @Override
    protected Food mapResultSet(ResultSet rs) throws SQLException {
        Food food = new Food();
        food.setId(rs.getInt("id"));
        food.setName(rs.getString("name"));
        food.setDescription(rs.getString("description"));
        food.setHistory(rs.getString("history")); // 新增字段
        food.setTaste(rs.getString("taste")); // 新增字段
        food.setImagePath(rs.getString("photo_path")); // 修正字段名
        food.setRecommendPlace(rs.getString("recommend_place")); // 新增字段
        return food;
    }

    public List<Food> findAll() {
        return queryList("SELECT * FROM hometown_food");
    }

    public List<Food> searchByName(String keyword) {
        return queryList("SELECT * FROM hometown_food WHERE name LIKE ?", "%" + keyword + "%");
    }

    public Food findById(int id) {
        return queryOne("SELECT * FROM hometown_food WHERE id = ?", id);
    }

    public boolean add(Food food) {
        String sql = "INSERT INTO hometown_food (name, description, history, taste, photo_path, recommend_place) VALUES (?, ?, ?, ?, ?, ?)";
        return update(sql, food.getName(), food.getDescription(), food.getHistory(), food.getTaste(),
                food.getImagePath(), food.getRecommendPlace());
    }

    public boolean updateFood(Food food) {
        String sql = "UPDATE hometown_food SET name=?, description=?, history=?, taste=?, photo_path=?, recommend_place=? WHERE id=?";
        return update(sql, food.getName(), food.getDescription(), food.getHistory(), food.getTaste(),
                food.getImagePath(), food.getRecommendPlace(), food.getId());
    }

    public boolean delete(int id) {
        return update("DELETE FROM hometown_food WHERE id = ?", id);
    }
}
