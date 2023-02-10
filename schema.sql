DROP DATABASE IF EXISTS `fellowmark_schema`;
CREATE DATABASE `fellowmark_schema`;
USE `fellowmark_schema`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;


CREATE TABLE `user` (
	`id` int UNSIGNED AUTO_INCREMENT,
    `created_at` DATE,
    `updated_at` DATE,
    `email` varchar(100) UNIQUE NOT NULL,
    `name` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    `avatar` varchar(2083),
    `type` tinyint(4) DEFAULT 0,
    `salt` varchar(255),
    PRIMARY KEY (`id`)
);


CREATE TABLE `module` (
	`id` int UNSIGNED AUTO_INCREMENT,
    `created_at` DATE,
    `updated_at` DATE,
    `code` varchar(8) UNIQUE NOT NULL,
    `semester` varchar(40) NOT NULL,
    `name` varchar(255) UNIQUE NOT NULL,
    PRIMARY KEY (`id`)
);


CREATE TABLE `enrollment` (
	`id` int UNSIGNED AUTO_INCREMENT,
    `created_at` DATE,
    `updated_at` DATE,
    `module_id` int UNSIGNED NOT NULL,
    `student_id` int UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`module_id`, `student_id`),
    FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`student_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `supervision` (
	`id` int UNSIGNED AUTO_INCREMENT,
    `created_at` DATE,
    `updated_at` DATE,
    `module_id` int UNSIGNED NOT NULL,
    `staff_id` int UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`module_id`, `staff_id`),
    FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`staff_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `assignment` (
	`id` int UNSIGNED AUTO_INCREMENT,
    `created_at` DATE,
    `updated_at` DATE,
    `name` varchar(255) NOT NULL,
    `module_id` int UNSIGNED NOT NULL,
    `groupsize` int NOT NULL,
    `deadline` int NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`name`, `module_id`),
    FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `question` (
	`id` int UNSIGNED AUTO_INCREMENT,
    `created_at` DATE,
    `updated_at` DATE,
    `question_number` int UNSIGNED NOT NULL,
    `question_text` varchar(1000) NOT NULL,
    `assignment_id` int UNSIGNED NOT NULL,
    `start_date` date,
    `end_date` date,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`question_number`, `assignment_id`),
    FOREIGN KEY (`assignment_id`) REFERENCES `assignment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `rubric` (
	`id` int UNSIGNED AUTO_INCREMENT,
    `created_at` DATE,
    `updated_at` DATE,
    `question_id` int UNSIGNED NOT NULL,
    `criteria` varchar(1000) NOT NULL,
    `description` varchar(5000) NOT NULL,
    `min_mark` int DEFAULT 0,
    `max_mark` int DEFAULT 10,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `pairing` (
	`id` int UNSIGNED AUTO_INCREMENT,
    `created_at` DATE,
    `updated_at` DATE,
    `assignment_id` int UNSIGNED NOT NULL,
    `student_id` int UNSIGNED NOT NULL,
    `marker_id` int UNSIGNED NOT NULL,
    `active` BOOLEAN NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`assignment_id`, `student_id`, `marker_id`),
    FOREIGN KEY (`assignment_id`) REFERENCES `assignment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`student_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`marker_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `submission` (
	`id` int UNSIGNED AUTO_INCREMENT,
    `created_at` DATE,
    `updated_at` DATE,
    `submitted_by_student_id` int UNSIGNED NOT NULL,
	`question_id` int UNSIGNED NOT NULL,
    `content_file_loc` varchar(1000),
    `content` varchar(5000),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`submitted_by_student_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `grade` (
	`id` int UNSIGNED AUTO_INCREMENT,
    `created_at` DATE,
    `updated_at` DATE,
    `pairing_id`int UNSIGNED NOT NULL,
    `rubric_id` int UNSIGNED NOT NULL,
    `grade` int NOT NULL,
    `comment` varchar(1000),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`pairing_id`, `rubric_id`),
    FOREIGN KEY (`pairing_id`) REFERENCES `pairing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`rubric_id`) REFERENCES `rubric` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

