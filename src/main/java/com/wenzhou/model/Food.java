package com.wenzhou.model;

/**
 * 美食实体类 (Food Model)
 */
public class Food {
    private int id;
    private String name;
    private String description;
    private String history; // History
    private String taste; // Taste
    private String imagePath; // photo_path
    private String recommendPlace; // recommend_place

    public Food() {
    }

    public Food(int id, String name, String description, String history, String taste, String imagePath,
            String recommendPlace) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.history = history;
        this.taste = taste;
        this.imagePath = imagePath;
        this.recommendPlace = recommendPlace;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    public String getTaste() {
        return taste;
    }

    public void setTaste(String taste) {
        this.taste = taste;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getRecommendPlace() {
        return recommendPlace;
    }

    public void setRecommendPlace(String recommendPlace) {
        this.recommendPlace = recommendPlace;
    }
}
