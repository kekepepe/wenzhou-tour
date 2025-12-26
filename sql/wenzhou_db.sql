CREATE DATABASE IF NOT EXISTS wenzhou_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE wenzhou_db;

-- Users Table (Refined: user_info)
CREATE TABLE IF NOT EXISTS user_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255),
    photo_path VARCHAR(255),
    real_name VARCHAR(100),
    role VARCHAR(20) DEFAULT 'user' -- Added role for permission control
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Food Table (Refined: hometown_food)
CREATE TABLE IF NOT EXISTS hometown_food (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    history TEXT,
    taste VARCHAR(100),
    photo_path VARCHAR(255),
    recommend_place VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Scenic/Attractions Table (Refined: hometown_scenic)
CREATE TABLE IF NOT EXISTS hometown_scenic (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    photo_path VARCHAR(255),
    open_time VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Culture Table (Refined: hometown_culture)
CREATE TABLE IF NOT EXISTS hometown_culture (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    description TEXT,
    history TEXT,
    photo_path VARCHAR(255),
    status VARCHAR(50) -- e.g., 'Active', 'Legacy'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Init Admin User
INSERT INTO user_info (username, password, email, phone, role, real_name) 
VALUES ('admin', 'admin123', 'admin@wenzhou.com', '1234567890', 'admin', 'Administrator')
ON DUPLICATE KEY UPDATE password='admin123';
