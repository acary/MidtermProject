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
  `email` VARCHAR(175) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `favorites` VARCHAR(45) NULL,
  `purchases` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
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
  `email` VARCHAR(75) NULL,
  `password` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collection`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `collection` ;

CREATE TABLE IF NOT EXISTS `collection` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `business_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `business_id_idx` (`business_id` ASC),
  CONSTRAINT `fk_business_id`
    FOREIGN KEY (`business_id`)
    REFERENCES `business` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `token_purchases` VARCHAR(45) NULL,
  `release_date` DATETIME NULL,
  `collection_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_member_token_collection1_idx` (`collection_id` ASC),
  CONSTRAINT `fk_member_token_collection1`
    FOREIGN KEY (`collection_id`)
    REFERENCES `collection` (`id`)
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
  `membership_token_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `membership_token_id_idx` (`membership_token_id` ASC),
  CONSTRAINT `fk_membership_token_id`
    FOREIGN KEY (`membership_token_id`)
    REFERENCES `member_token` (`id`)
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
  `business_id` INT NULL,
  `member_token_id` INT NULL,
  `status` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `business_id_idx` (`business_id` ASC),
  INDEX `fk_content_member_token1_idx` (`member_token_id` ASC),
  CONSTRAINT `business_id`
    FOREIGN KEY (`business_id`)
    REFERENCES `business` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
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
  `member_token_id` INT NULL,
  `user_id` INT NULL,
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
INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `favorites`, `purchases`, `username`, `password`, `active`, `role`) VALUES (1, 'nikefan@gmail.com', 'James', 'Toney', '0', '1', 'nikefan', 'nikefan', 1, 'user');
INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `favorites`, `purchases`, `username`, `password`, `active`, `role`) VALUES (2, 'tacobellfan@gmail.com', 'Becca', 'Greene', '1', '1', 'tacobellfan', 'tacobellfan', NULL, 'user');
INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `favorites`, `purchases`, `username`, `password`, `active`, `role`) VALUES (3, 'adidasfan@gmail.com', 'Tim', 'Stanley', '0', '1', 'adidasfan', 'adidasfan', NULL, 'user');

COMMIT;


-- -----------------------------------------------------
-- Data for table `business`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `business` (`id`, `email`, `password`, `name`) VALUES (1, 'nike@nike.com', 'nike', 'Nike');
INSERT INTO `business` (`id`, `email`, `password`, `name`) VALUES (2, 'tacobell@taco.com', 'taco', 'Taco Bell');
INSERT INTO `business` (`id`, `email`, `password`, `name`) VALUES (3, 'adidas@adidas.com', 'adidas', 'Adidas');

COMMIT;


-- -----------------------------------------------------
-- Data for table `collection`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `collection` (`id`, `name`, `business_id`) VALUES (1, 'SNKRS', 1);
INSERT INTO `collection` (`id`, `name`, `business_id`) VALUES (2, 'Tacotastic', 2);
INSERT INTO `collection` (`id`, `name`, `business_id`) VALUES (3, 'Stripe Life', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `member_token`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `token_purchases`, `release_date`, `collection_id`) VALUES (1, 'Air Jordan 1 Stash', 'https://secure-images.nike.com/is/image/DotCom/DN4336_001_A_PREM', 1000, 100, '0', '2022-05-03', NULL);
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `token_purchases`, `release_date`, `collection_id`) VALUES (2, 'Mexican Pizza', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.today.com%2Ffood%2Frestaurants%2Fmexican-pizza-taco-bell-returning-rcna24652&psig=AOvVaw3ukNTVite-nuHVxXM0mW7_&ust=1650744860801000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJjWs_y9qPcCFQAAAAAdAAAAABAD', 1000, 100, '1', '2022-05-19', NULL);
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `token_purchases`, `release_date`, `collection_id`) VALUES (3, 'Superstar Parley', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/59a9d67b4de1483190cbadf90089b3f8_9366/Superstar_Parley_Shoes_White_GV7615_01_standard.jpg', 1000, 100, '0', '2022-05-20', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `actual_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `actual_item` (`id`, `name`, `membership_token_id`) VALUES (1, 'Air Jordan 1 Stash', 1);
INSERT INTO `actual_item` (`id`, `name`, `membership_token_id`) VALUES (2, 'Mexican Pizza', 2);
INSERT INTO `actual_item` (`id`, `name`, `membership_token_id`) VALUES (3, 'Superstar Parley', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `content`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `business_id`, `member_token_id`, `status`) VALUES (1, 'Nike Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: Nike', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'nike', 1, 1, 'draft');
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `business_id`, `member_token_id`, `status`) VALUES (2, 'Taco Bell Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: Taco Bell', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'tacobell', 2, 2, 'scheduled');
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `business_id`, `member_token_id`, `status`) VALUES (3, 'Adidas Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: Adidas', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'adidas', 3, 3, 'published');
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `business_id`, `member_token_id`, `status`) VALUES (DEFAULT, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `purchase`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `purchase` (`id`, `date_time_purchased`, `member_token_id`, `user_id`) VALUES (1, '2022-04-21', 1, 1);
INSERT INTO `purchase` (`id`, `date_time_purchased`, `member_token_id`, `user_id`) VALUES (2, '2022-04-21', 2, 2);
INSERT INTO `purchase` (`id`, `date_time_purchased`, `member_token_id`, `user_id`) VALUES (3, '2022-04-21', 3, 3);

COMMIT;

