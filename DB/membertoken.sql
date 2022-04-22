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
  `user_email` VARCHAR(175) NULL,
  `user_password` VARCHAR(100) NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `favorites` VARCHAR(45) NULL,
  `purchases` VARCHAR(45) NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `active` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `business`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `business` ;

CREATE TABLE IF NOT EXISTS `business` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `business_email` VARCHAR(75) NOT NULL,
  `business_password` VARCHAR(45) NOT NULL,
  `business_name` VARCHAR(45) NULL,
  `buisiness_collection` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collection`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `collection` ;

CREATE TABLE IF NOT EXISTS `collection` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `collection_name` VARCHAR(45) NOT NULL,
  `collectioncol` VARCHAR(45) NULL,
  `business_id` INT NULL,
  `items` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `business_id_idx` (`business_id` ASC),
  CONSTRAINT `fk_business_id`
    FOREIGN KEY (`business_id`)
    REFERENCES `business` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `membership_token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `membership_token` ;

CREATE TABLE IF NOT EXISTS `membership_token` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `token_name` VARCHAR(45) NOT NULL,
  `token_img_url` VARCHAR(100) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `total_supply` INT NOT NULL,
  `access_code` VARCHAR(45) NOT NULL,
  `token_purchases` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `actual_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `actual_item` ;

CREATE TABLE IF NOT EXISTS `actual_item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `membership_token_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `membership_token_id_idx` (`membership_token_id` ASC),
  CONSTRAINT `fk_membership_token_id`
    FOREIGN KEY (`membership_token_id`)
    REFERENCES `membership_token` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `content` ;

CREATE TABLE IF NOT EXISTS `content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `text_content` VARCHAR(100) NULL,
  `image_url` VARCHAR(150) NULL,
  `access_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `purchase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `purchase` ;

CREATE TABLE IF NOT EXISTS `purchase` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_time_purchased` DATETIME NULL,
  `user_id` INT NULL,
  `item_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `item_id_idx` (`item_id` ASC),
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_id`
    FOREIGN KEY (`item_id`)
    REFERENCES `actual_item` (`id`)
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
INSERT INTO `user` (`id`, `user_email`, `user_password`, `first_name`, `last_name`, `favorites`, `purchases`, `username`, `password`, `active`, `role`) VALUES (1, NULL, NULL, 'Jo', NULL, NULL, NULL, 'admin', 'admin', 1, 'ROLE_ADMIN');

COMMIT;

