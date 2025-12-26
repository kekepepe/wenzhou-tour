package com.wenzhou.model;

import java.math.BigDecimal;

/**
 * 景点实体类 (Attraction Model)
 */
public class Attraction {
    private int id;
    private String name;
    private String description;
    private BigDecimal ticketPrice;
    private String location;
    private String imagePath;

    public Attraction() {
    }

    public Attraction(int id, String name, String description, BigDecimal ticketPrice, String location,
            String imagePath) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.ticketPrice = ticketPrice;
        this.location = location;
        this.imagePath = imagePath;
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

    public BigDecimal getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(BigDecimal ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}
