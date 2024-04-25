-- Create database if not exists
CREATE DATABASE IF NOT EXISTS `mydb`;

-- Use the database
USE `mydb`;

-- Create table
CREATE TABLE IF NOT EXISTS `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Insert initial data
INSERT INTO `students` (`student_name`, `age`, `gender`) VALUES
('John Doe', 20, 'Male'),
('Jane Smith', 22, 'Female');
