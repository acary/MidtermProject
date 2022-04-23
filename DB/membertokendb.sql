-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema membertokendb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `membertokendb` ;

-- -----------------------------------------------------
-- Schema membertokendb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `membertokendb` DEFAULT CHARACTER SET utf8 ;
USE `membertokendb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(175) NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NULL,
  `profile_image_url` VARCHAR(2000) NULL,
  `about_me` TEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `business`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `business` ;

CREATE TABLE IF NOT EXISTS `business` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `logo_url` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  `name` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_business_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_business_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collection`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `collection` ;

CREATE TABLE IF NOT EXISTS `collection` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `business_id` INT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `business_id_idx` (`business_id` ASC),
  CONSTRAINT `fk_business_id`
    FOREIGN KEY (`business_id`)
    REFERENCES `business` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `actual_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `actual_item` ;

CREATE TABLE IF NOT EXISTS `actual_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `member_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `member_token` ;

CREATE TABLE IF NOT EXISTS `member_token` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `token_name` VARCHAR(45) NULL,
  `token_img_url` VARCHAR(1000) NULL,
  `price` DECIMAL(10,2) NULL,
  `total_supply` INT NULL,
  `release_date` DATETIME NULL,
  `collection_id` INT NOT NULL,
  `actual_item_id` INT NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_member_token_collection1_idx` (`collection_id` ASC),
  INDEX `fk_member_token_actual_item1_idx` (`actual_item_id` ASC),
  CONSTRAINT `fk_member_token_collection1`
    FOREIGN KEY (`collection_id`)
    REFERENCES `collection` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_token_actual_item1`
    FOREIGN KEY (`actual_item_id`)
    REFERENCES `actual_item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `content` ;

CREATE TABLE IF NOT EXISTS `content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NULL,
  `description` VARCHAR(500) NULL,
  `text_content` VARCHAR(100) NULL,
  `image_url` VARCHAR(150) NULL,
  `access_code` VARCHAR(45) NULL,
  `member_token_id` INT NOT NULL,
  `status` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_content_member_token1_idx` (`member_token_id` ASC),
  CONSTRAINT `fk_content_member_token1`
    FOREIGN KEY (`member_token_id`)
    REFERENCES `member_token` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `purchase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `purchase` ;

CREATE TABLE IF NOT EXISTS `purchase` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_time_purchased` DATETIME NULL,
  `member_token_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rating` INT NULL,
  `rating_comment` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_purchase_member_token1_idx` (`member_token_id` ASC),
  INDEX `fk_purchase_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_purchase_member_token1`
    FOREIGN KEY (`member_token_id`)
    REFERENCES `member_token` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_token` ;

CREATE TABLE IF NOT EXISTS `favorite_token` (
  `user_id` INT NOT NULL,
  `member_token_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `member_token_id`),
  INDEX `fk_user_has_member_token_member_token1_idx` (`member_token_id` ASC),
  INDEX `fk_user_has_member_token_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_member_token_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_member_token_member_token1`
    FOREIGN KEY (`member_token_id`)
    REFERENCES `member_token` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `content_resource` ;

CREATE TABLE IF NOT EXISTS `content_resource` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content_id` INT NOT NULL,
  `resource_url` VARCHAR(2000) NULL,
  `title` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_content_resource_content1_idx` (`content_id` ASC),
  CONSTRAINT `fk_content_resource_content1`
    FOREIGN KEY (`content_id`)
    REFERENCES `content` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS member@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'member'@'localhost' IDENTIFIED BY 'member';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'member'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `username`, `password`, `active`, `role`, `profile_image_url`, `about_me`) VALUES (1, 'nikefan@gmail.com', 'James', 'Toney', 'nikefan', 'nikefan', 1, 'user', NULL, NULL);
INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `username`, `password`, `active`, `role`, `profile_image_url`, `about_me`) VALUES (2, 'tacobellfan@gmail.com', 'Becca', 'Greene', 'tacobellfan', 'tacobellfan', DEFAULT, 'user', NULL, NULL);
INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `username`, `password`, `active`, `role`, `profile_image_url`, `about_me`) VALUES (3, 'adidasfan@gmail.com', 'Tim', 'Stanley', 'adidasfan', 'adidasfan', DEFAULT, 'user', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `business`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `business` (`id`, `logo_url`, `description`, `name`, `user_id`, `image_url`) VALUES (1, 'nike@nike.com', 'nike', 'Nike', 1, NULL);
INSERT INTO `business` (`id`, `logo_url`, `description`, `name`, `user_id`, `image_url`) VALUES (2, 'tacobell@taco.com', 'taco', 'Taco Bell', 1, NULL);
INSERT INTO `business` (`id`, `logo_url`, `description`, `name`, `user_id`, `image_url`) VALUES (3, 'adidas@adidas.com', 'adidas', 'Adidas', 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `collection`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `collection` (`id`, `name`, `business_id`, `image_url`, `description`) VALUES (1, 'SNKRS', 1, NULL, NULL);
INSERT INTO `collection` (`id`, `name`, `business_id`, `image_url`, `description`) VALUES (2, 'Tacotastic', 2, NULL, NULL);
INSERT INTO `collection` (`id`, `name`, `business_id`, `image_url`, `description`) VALUES (3, 'Stripe Life', 3, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `actual_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `actual_item` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Air Jordan 1 Stash', NULL, NULL);
INSERT INTO `actual_item` (`id`, `name`, `description`, `image_url`) VALUES (2, 'Mexican Pizza', NULL, NULL);
INSERT INTO `actual_item` (`id`, `name`, `description`, `image_url`) VALUES (3, 'Superstar Parley', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `member_token`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `release_date`, `collection_id`, `actual_item_id`, `description`) VALUES (1, 'Air Jordan 1 Stash', 'https://secure-images.nike.com/is/image/DotCom/DN4336_001_A_PREM', 1000, 100, '2022-05-03', 1, 1, NULL);
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `release_date`, `collection_id`, `actual_item_id`, `description`) VALUES (2, 'Mexican Pizza', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.today.com%2Ffood%2Frestaurants%2Fmexican-pizza-taco-bell-returning-rcna24652&psig=AOvVaw3ukNTVite-nuHVxXM0mW7_&ust=1650744860801000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJjWs_y9qPcCFQAAAAAdAAAAABAD', 1000, 100, '2022-05-19', 1, 1, NULL);
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `release_date`, `collection_id`, `actual_item_id`, `description`) VALUES (3, 'Superstar Parley', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/59a9d67b4de1483190cbadf90089b3f8_9366/Superstar_Parley_Shoes_White_GV7615_01_standard.jpg', 1000, 100, '2022-05-20', 1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `content`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `member_token_id`, `status`) VALUES (1, 'Nike Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: Nike', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'nike', 1, 'draft');
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `member_token_id`, `status`) VALUES (2, 'Taco Bell Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: Taco Bell', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'tacobell', 2, 'scheduled');
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `member_token_id`, `status`) VALUES (3, 'Adidas Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: Adidas', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'adidas', 3, 'published');

COMMIT;


-- -----------------------------------------------------
-- Data for table `purchase`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `purchase` (`id`, `date_time_purchased`, `member_token_id`, `user_id`, `rating`, `rating_comment`) VALUES (1, '2022-04-21', 1, 1, NULL, NULL);
INSERT INTO `purchase` (`id`, `date_time_purchased`, `member_token_id`, `user_id`, `rating`, `rating_comment`) VALUES (2, '2022-04-21', 2, 2, NULL, NULL);
INSERT INTO `purchase` (`id`, `date_time_purchased`, `member_token_id`, `user_id`, `rating`, `rating_comment`) VALUES (3, '2022-04-21', 3, 3, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `content_resource`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `content_resource` (`id`, `content_id`, `resource_url`, `title`, `description`) VALUES (1, 1, 'https://www.nike.com/launch/t/air-jordan-1-stash', 'Available 5/3 at 10:00 AM', 'Jordan Brand is bringing a utilitarian attitude to the OG Air Jordan that started it all');

COMMIT;

