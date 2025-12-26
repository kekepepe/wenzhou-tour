package com.wenzhou.model;

/**
 * 文化实体类 (Culture Model)
 */
public class Culture {
    private int id;
    private String name;
    private String type;
    private String description;
    private String history;
    private String imagePath;
    private String status;

    public Culture() {
    }

    public Culture(int id, String name, String type, String description, String history, String imagePath,
            String status) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.description = description;
        this.history = history;
        this.imagePath = imagePath;
        this.status = status;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
