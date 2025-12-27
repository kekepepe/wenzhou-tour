-- ==========================================
-- Wenzhou Tour - Complete Database Script
-- ==========================================

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS wenzhou_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE wenzhou_db;

-- 2. Drop Tables if exists (Clean Slate)
DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS hometown_food;
DROP TABLE IF EXISTS hometown_scenic;
DROP TABLE IF EXISTS hometown_culture;

-- 3. Create Tables

-- Table: User Info
CREATE TABLE user_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
    password VARCHAR(255) NOT NULL COMMENT '密码',
    real_name VARCHAR(100) COMMENT '真实姓名',
    email VARCHAR(100) COMMENT '邮箱',
    phone VARCHAR(20) COMMENT '电话',
    address VARCHAR(255) COMMENT '地址',
    photo_path VARCHAR(255) COMMENT '头像路径',
    role VARCHAR(20) DEFAULT 'user' COMMENT '角色: user/admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- Table: Hometown Food (美食)
CREATE TABLE hometown_food (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT '美食名称',
    description TEXT COMMENT '描述',
    taste VARCHAR(100) COMMENT '口味',
    history TEXT COMMENT '历史典故',
    photo_path VARCHAR(255) COMMENT '图片路径',
    recommend_price DECIMAL(10, 2) COMMENT '推荐价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='温州美食表';

-- Table: Hometown Scenic (景点)
CREATE TABLE hometown_scenic (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT '景点名称',
    location VARCHAR(255) COMMENT '地理位置',
    description TEXT COMMENT '景点描述',
    ticket_price DECIMAL(10, 2) COMMENT '门票价格',
    photo_path VARCHAR(255) COMMENT '图片路径',
    open_time VARCHAR(100) COMMENT '开放时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='温州景点表';

-- Table: Hometown Culture (文化)
CREATE TABLE hometown_culture (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT '文化名称',
    type VARCHAR(50) COMMENT '类型(如非遗, 民俗)',
    description TEXT COMMENT '描述',
    history TEXT COMMENT '历史渊源',
    photo_path VARCHAR(255) COMMENT '图片路径',
    status VARCHAR(50) COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='温州文化表';

-- 4. Initial Data

-- Admin User (Password: admin123)
INSERT INTO user_info (username, password, real_name, role) 
VALUES ('admin', 'admin123', '管理员', 'admin');

-- Sample Food Data
INSERT INTO hometown_food (name, description, taste, history, photo_path, recommend_price)
VALUES ('温州鱼丸 (Wenzhou Fish Ball)', '以新鲜鮸鱼肉为主料', '鲜嫩顺滑', '源于....', 'images/food_fishball.jpg', 15.00);

-- Sample Scenic Data
INSERT INTO hometown_scenic (name, location, description, ticket_price, photo_path, open_time)
VALUES ('雁荡山 (Yandang Mountain)', '温州市乐清市', '中国十大名山之一', 160.00, 'images/scenic_yandang.jpg', '08:00-17:00');

-- Sample Culture Data
INSERT INTO hometown_culture (name, type, description, history, photo_path, status)
VALUES ('永嘉昆剧 (Yongjia Kunqu)', '非物质文化遗产', '中国戏曲活化石', '历史悠久...', 'images/culture_kunqu.jpg', 'Active');
