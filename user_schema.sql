CREATE DATABASE Deku;

USE Deku;

CREATE TABLE `Users` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` varchar(50) NOT NULL,
	`password` varchar(100) NOT NULL,
	`scoped_key` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Followers` (
	`user_id` int NOT NULL,
	`follewer_id` int NOT NULL
);

CREATE TABLE `Messages` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`message` TEXT NOT NULL,
	`timestamp` TIME NOT NULL,
	`user_id` INT NOT NULL,
	`thread_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Threads` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`thread` varchar(80) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Notifications` (
	`user_id` INT NOT NULL,
	`follower_id` INT NOT NULL
);

CREATE TABLE `Profiles` (
	`user_id` INT NOT NULL,
	`interests` TEXT,
	`profile_photo` blob,
	`location` varchar(20)
);

CREATE TABLE `Statuses` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`status` varchar(250) NOT NULL,
	`timestamp` TIME NOT NULL DEFAULT 'Date.now',
	PRIMARY KEY (`id`)
);

CREATE TABLE `message_votes` (
	`message_id` INT NOT NULL,
	`user_id` INT NOT NULL,
	`vote` INT NOT NULL
);

CREATE TABLE `status_votes` (
	`user_id` INT NOT NULL,
	`status_id` INT NOT NULL,
	`vote` INT NOT NULL
);

ALTER TABLE `Followers` ADD CONSTRAINT `Followers_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`);

ALTER TABLE `Followers` ADD CONSTRAINT `Followers_fk1` FOREIGN KEY (`follewer_id`) REFERENCES `Users`(`id`);

ALTER TABLE `Messages` ADD CONSTRAINT `Messages_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`);

ALTER TABLE `Messages` ADD CONSTRAINT `Messages_fk1` FOREIGN KEY (`thread_id`) REFERENCES `Threads`(`id`);

ALTER TABLE `Notifications` ADD CONSTRAINT `Notifications_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`);

ALTER TABLE `Notifications` ADD CONSTRAINT `Notifications_fk1` FOREIGN KEY (`follower_id`) REFERENCES `Users`(`id`);

ALTER TABLE `Profiles` ADD CONSTRAINT `Profiles_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`);

ALTER TABLE `Statuses` ADD CONSTRAINT `Statuses_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`);

ALTER TABLE `message_votes` ADD CONSTRAINT `message_votes_fk0` FOREIGN KEY (`message_id`) REFERENCES `Messages`(`id`);

ALTER TABLE `message_votes` ADD CONSTRAINT `message_votes_fk1` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`);

ALTER TABLE `status_votes` ADD CONSTRAINT `status_votes_fk0` FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`);

ALTER TABLE `status_votes` ADD CONSTRAINT `status_votes_fk1` FOREIGN KEY (`status_id`) REFERENCES `Statuses`(`id`);

