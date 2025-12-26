-- Phase 2 Complete Database Schema
CREATE DATABASE IF NOT EXISTS wenzhou_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE wenzhou_db;

-- 1. User Info Table
CREATE TABLE IF NOT EXISTS user_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    real_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255),
    photo_path VARCHAR(255),
    role VARCHAR(20) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Hometown Food Table
CREATE TABLE IF NOT EXISTS hometown_food (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    taste VARCHAR(100),
    history TEXT,
    photo_path VARCHAR(255),
    recommend_price DECIMAL(10, 2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Hometown Scenic Table
CREATE TABLE IF NOT EXISTS hometown_scenic (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    description TEXT,
    ticket_price DECIMAL(10, 2),
    photo_path VARCHAR(255),
    open_time VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Hometown Culture Table
CREATE TABLE IF NOT EXISTS hometown_culture (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    description TEXT,
    history TEXT,
    photo_path VARCHAR(255),
    status VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Initial Admin User
-- Password is 'admin123'
INSERT INTO user_info (username, password, real_name, role) 
VALUES ('admin', 'admin123', '管理员', 'admin')
ON DUPLICATE KEY UPDATE password='admin123';
