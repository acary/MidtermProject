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
  `profile_image_url` VARCHAR(4000) NULL,
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
  `description` TEXT NULL,
  `name` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `logo_image_url` VARCHAR(2000) NULL,
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
  `image_url` VARCHAR(2000) NULL,
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
INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `username`, `password`, `active`, `role`, `profile_image_url`, `about_me`) VALUES (1, 'nikefan@gmail.com', 'James', 'Toney', 'nikefan', 'nikefan', 1, 'user', 'https://upload.wikimedia.org/wikipedia/commons/6/64/James_Toney.jpg', 'Former professional boxer, current coach and sportsware enthusiast.');
INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `username`, `password`, `active`, `role`, `profile_image_url`, `about_me`) VALUES (2, 'tacobellfan@gmail.com', 'Becca', 'Greene', 'tacobellfan', 'tacobellfan', 1, 'user', 'https://pbs.twimg.com/profile_images/1481616049963421699/7aKC7gEO_400x400.jpg', 'I am an enthusiastic, passionate individual. Every project I work on I go in full hearted. I am braniac researcher at heart and love to constantly be learning and improving myself. I spend much of my time researching and exploring the great things to be found in the world.');
INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `username`, `password`, `active`, `role`, `profile_image_url`, `about_me`) VALUES (3, 'adidasfan@gmail.com', 'Tim', 'Stanley', 'adidasfan', 'adidasfan', 1, 'user', 'https://otakukart.com/wp-content/uploads/2022/02/Tim-Stanley.jpg', 'I love juggling, biking, kites, board sports and may be the only person you know who has had his car repaired by Steve Jobs.');
INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `username`, `password`, `active`, `role`, `profile_image_url`, `about_me`) VALUES (4, 'reebokfan@gmail.com', 'John', 'Jacobson', 'reebokfan', 'reebokfan', 1, 'admin', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHQv_th9wq3ivQ1CVk7UZRxhbPq64oQrg5Q&usqp=CAU', 'Running enthusiast always seeking new challenges. ');
INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `username`, `password`, `active`, `role`, `profile_image_url`, `about_me`) VALUES (5, 'iwc@bmw.com', 'Sarah', 'Miller', 'iwcfan', 'iwc', 1, 'user', 'https://www.csueastbay.edu/directory/profiles/files/images/sw/sarah-taylor.jpg', 'Professional web developer with a passion for cars and fashion. ');
INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `username`, `password`, `active`, `role`, `profile_image_url`, `about_me`) VALUES (6, 'omegafan@gmail.com', 'Chris', 'Stevinson', 'omegafan', 'omegafan', 1, 'user', 'https://skateparkoftampa.com/spot/headshots/4253.jpg', 'Favorite 2 things: skiing and attending concerts. Portland native');

COMMIT;


-- -----------------------------------------------------
-- Data for table `business`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `business` (`id`, `description`, `name`, `user_id`, `logo_image_url`) VALUES (1, 'Our mission is what drives us to do everything possible to expand human potential. We do that by creating groundbreaking sport innovations, by making our products more sustainably, by building a creative and diverse global team and by making a positive impact in communities where we live and work.\n\nBased in Beaverton, Oregon, NIKE, Inc. includes the Nike, Converse, and Jordan brands.', 'Nike', 1, 'https://i.pinimg.com/474x/b7/83/64/b78364613ff5001b81077eadaa11cd2a--nike-hd-nike-wallpaper.jpg');
INSERT INTO `business` (`id`, `description`, `name`, `user_id`, `logo_image_url`) VALUES (2, 'We take pride in making the best Mexican-style fast food, providing fast, friendly, & accurate service. We are the employer of choice offering team members opportunities for g', 'Taco Bell', 2, 'https://cdn.mos.cms.futurecdn.net/hgRu36yguybcDeZLsZybEA-1200-80.jpg');
INSERT INTO `business` (`id`, `description`, `name`, `user_id`, `logo_image_url`) VALUES (3, 'Everything we do is rooted in sport. Sport plays an increasingly important role in more and more people’s lives, on and off the field of play. It is central to every culture and society and is core to our health and happiness.\n\nKey to our success and the execution of our strategy ‘Own the Game’, are our people and our culture. They bring our identity to life, defined by our purpose, mission, and attitude.', 'Adidas', 1, 'https://images.unsplash.com/photo-1555274175-75f4056dfd05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YWRpZGFzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60');
INSERT INTO `business` (`id`, `description`, `name`, `user_id`, `logo_image_url`) VALUES (4, 'Reebok is an American-inspired, global brand that creates and markets sports and lifestyle products built upon a strong heritage and authenticity in sports, fitness and women’s categories. The brand is committed to designing products and marketing programs that reflect creativity and the desire to constantly challenge the status quo.', 'Reebok', 1, 'https://assets.fontsinuse.com/static/use-media-items/16/15511/full-1400x1190/5db1c13c/reebok_logo_1986.png');
INSERT INTO `business` (`id`, `description`, `name`, `user_id`, `logo_image_url`) VALUES (5, 'SONIC®, America’s Drive-In®, is part of the Inspire Brands family of restaurants. Inspire is a multi-brand restaurant company whose portfolio includes more than 8,300 Arby’s, Buffalo Wild Wings, and SONIC locations worldwide.', 'Sonic', 2, 'https://download.logo.wine/logo/Sonic_Drive-In/Sonic_Drive-In-Logo.wine.png');
INSERT INTO `business` (`id`, `description`, `name`, `user_id`, `logo_image_url`) VALUES (6, 'Founded in 1848, OMEGA is a watch brand synonymous with excellence, innovation and precision. The company has constantly been defined by its pioneering spirit, demonstrated by its conquests of the oceans as well as space.', 'Omega', 5, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Omega_Logo.svg/1200px-Omega_Logo.svg.png');
INSERT INTO `business` (`id`, `description`, `name`, `user_id`, `logo_image_url`) VALUES (7, 'An American watchmaking pioneer named Florentine Ariosto Jones founded the International Watch Company in Schaffhausen in 1868. He drew on the help of eminently qualified Swiss watchmakers, modern technology and hydropower sourced from the nearby River Rhine to manufacture watch movements of the highest possible quality', 'IWC', 5, 'https://upload.wikimedia.org/wikipedia/commons/d/dc/IWC_Schaffhausen_Logo.jpg');
INSERT INTO `business` (`id`, `description`, `name`, `user_id`, `logo_image_url`) VALUES (8, 'Pioneering, practical, precise: Hamilton uses a unique combination of Swiss precision and American spirit to create distinctive, versatile watches for aficionados and style conscious individuals alike. Hamilton has a long history and has achieved numerous milestones, all of which have contributed to making Hamilton the strong, internationally renowned watch brand it is today.', 'Hamilton', 5, 'https://vectorlogoseek.com/wp-content/uploads/2020/05/hamilton-watch-vector-logo.png');

COMMIT;


-- -----------------------------------------------------
-- Data for table `collection`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `collection` (`id`, `name`, `business_id`, `image_url`, `description`) VALUES (1, 'SNKRS', 1, 'https://images.unsplash.com/photo-1600269452121-4f2416e55c28?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c25lYWtlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60', NULL);
INSERT INTO `collection` (`id`, `name`, `business_id`, `image_url`, `description`) VALUES (2, 'Tacotastic', 2, 'https://www.tacobell.com/images/2019-Blog-Wallpaper-10.jpg', NULL);
INSERT INTO `collection` (`id`, `name`, `business_id`, `image_url`, `description`) VALUES (3, 'Stripe Life', 3, 'https://images.unsplash.com/photo-1608551279839-84c7ca889b80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YWRpZGFzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60', NULL);
INSERT INTO `collection` (`id`, `name`, `business_id`, `image_url`, `description`) VALUES (4, 'Money Heist', 4, 'https://www.nicekicks.com/files/2022/04/Reebok-Money-Heist-Collection-release-date-lead-2.jpg', NULL);
INSERT INTO `collection` (`id`, `name`, `business_id`, `image_url`, `description`) VALUES (5, 'Pickle Days', 5, 'https://i.pinimg.com/736x/e4/bb/c6/e4bbc6e3724300d7f40ac4d09b95c7f1.jpg', NULL);
INSERT INTO `collection` (`id`, `name`, `business_id`, `image_url`, `description`) VALUES (6, 'PLANET OCEAN ULTRA DEEP', 6, 'https://wristadvisor.com/wp-content/uploads/2022/03/Omega-Planet-Ocean-Ultra-Deep-Collection.jpg.webp', NULL);
INSERT INTO `collection` (`id`, `name`, `business_id`, `image_url`, `description`) VALUES (7, 'Top Gun', 7, 'https://www.gqmiddleeast.com/public/styles/full_img_sml/public/images/2020/03/12/IWC-TopGun-x-GQ-Middle-East-3.jpg', NULL);
INSERT INTO `collection` (`id`, `name`, `business_id`, `image_url`, `description`) VALUES (8, 'Khaki Field', 8, 'https://hodinkee.imgix.net/uploads/images/109dad69-f172-471a-82b0-c5ee3c92189a/herohammie.jpg?ixlib=rails-1.1.0&fm=jpg&q=55&auto=format&usm=12&fit=crop&ch=Width%2CDPR%2CSave-Data&alt=&ar=16%3A9&w=2400', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `actual_item`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `actual_item` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Air Jordan 1 Stash', 'Jordan Brand is bringing a utilitarian attitude to the OG Air Jordan that started it all', 'https://secure-images.nike.com/is/image/DotCom/DN4336_001_A_PREM\n');
INSERT INTO `actual_item` (`id`, `name`, `description`, `image_url`) VALUES (2, 'Mexican Pizza', 'From performances to petitions, Taco Bell taps into fans’ pent up excitement to celebrate the return of the beloved item', 'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1240w,f_auto,q_auto:best/rockcms/2022-04/mexican-pizza-lp-today-main-220416-1ef9e7.jpg');
INSERT INTO `actual_item` (`id`, `name`, `description`, `image_url`) VALUES (3, 'Superstar Parley', 'IN COLLABORATION WITH PARLEY FOR THE OCEANS, THESE ADIDAS SUPERSTAR SHOES ARE MADE IN PART WITH RECYCLED MATERIALS.', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/59a9d67b4de1483190cbadf90089b3f8_9366/Superstar_Parley_Shoes_White_GV7615_01_standard.jpg');
INSERT INTO `actual_item` (`id`, `name`, `description`, `image_url`) VALUES (4, 'Le Casa De Papel Classic', 'LA CASA DE PAPEL CLASSIC LEATHER SHOES  RETRO REEBOK SHOES WITH DRAMATIC \"LA CASA DE PAPEL\" STYLE', 'https://assets.reebok.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/87b6dbb89bab419183eaae550066a68d_9366/La_Casa_De_Papel_Classic_Leather_Shoes_White_GX9443_01_standard.jpg\n');
INSERT INTO `actual_item` (`id`, `name`, `description`, `image_url`) VALUES (5, 'Pickle Fries', 'A Pickle-Lover\'s Dream!', 'https://assets3.thrillist.com/v1/image/3075306/1584x1054/crop;webp=auto;jpeg_quality=60.jpg\n');
INSERT INTO `actual_item` (`id`, `name`, `description`, `image_url`) VALUES (6, 'Planet Ocean 6000M', 'After reaching the deepest place on Earth in 2019, the ground-breaking Ultra Deep watch has been repurposed into a new 45.5 mm collection available to the public. Tested in real ocean conditions, this incredible divers’ range is water-resistant to 6,000 metres (20,000 ft.) and certified to meet the ISO 6425 standard.', 'https://k8q7r7a2.stackpathcdn.com/wp-content/uploads/2022/03/Omega-Seamaster-Planet-Ocean-Ultra-Deep-6000m-O-Megasteel-review-2.jpg');
INSERT INTO `actual_item` (`id`, `name`, `description`, `image_url`) VALUES (7, 'Chronograph 41 Top Gun Ceratanium', 'The TOP GUN watches, which IWC has been producing since 2007, take their name from the Strike Fighter Tactics Instructor Program in the U.S. Navy. This training programme provides the best Navy pilots with flying and tactical training. The TOP GUN watches are therefore specially designed with robust materials, such as ceramic, titanium and for the first time Ceratanium®, an innovative material developed by IWC, to meet the specific requirements of elite jet pilots.', 'https://k8q7r7a2.stackpathcdn.com/wp-content/uploads/2022/03/IWC-Pilots-Watch-Chronograph-41-TOP-GUN-Ceratanium-IW388106-hands-on-watches-and-wonders-2022-1.jpg');
INSERT INTO `actual_item` (`id`, `name`, `description`, `image_url`) VALUES (8, 'Khaki Field Titanium Automatic', 'Are you looking for the ideal military watch? The Khaki Field collection includes classic army style watches that have been tried and tested over time. Rugged, robust and resilient, they’re ready for the outdoors and can compete with the best sport watches out there. Built for life’s adventurers, they’re guaranteed to be equal to your needs out in the field', 'https://hodinkee.imgix.net/uploads/images/16f730fa-b296-4ae3-8711-3dad9dc6f6c2/Hamiltons_SH9_5659_toned.jpg?ixlib=rails-1.1.0&fm=jpg&q=55&auto=format&usm=12&fit=crop&ch=Width%2CDPR%2CSave-Data&alt=&w=1640');

COMMIT;


-- -----------------------------------------------------
-- Data for table `member_token`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `release_date`, `collection_id`, `actual_item_id`, `description`) VALUES (1, 'Air Jordan 1 Stash', 'https://secure-images.nike.com/is/image/DotCom/DN4336_001_A_PREM', 1000, 100, '2022-05-03', 1, 1, NULL);
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `release_date`, `collection_id`, `actual_item_id`, `description`) VALUES (2, 'Mexican Pizza', 'https://images.unsplash.com/photo-1596109212150-dd447ec78b41', 1100, 100, '2022-05-19', 2, 2, NULL);
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `release_date`, `collection_id`, `actual_item_id`, `description`) VALUES (3, 'Superstar Parley', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/59a9d67b4de1483190cbadf90089b3f8_9366/Superstar_Parley_Shoes_White_GV7615_01_standard.jpg', 1000, 100, '2022-05-20', 3, 3, NULL);
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `release_date`, `collection_id`, `actual_item_id`, `description`) VALUES (4, 'Le Casa De Papel Classic', 'https://assets.reebok.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/87b6dbb89bab419183eaae550066a68d_9366/La_Casa_De_Papel_Classic_Leather_Shoes_White_GX9443_01_standard.jpg', 1000, 100, '2022-05-03', 4, 4, NULL);
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `release_date`, `collection_id`, `actual_item_id`, `description`) VALUES (5, 'Pickle Fries', 'https://assets3.thrillist.com/v1/image/3075306/1584x1054/crop;webp=auto;jpeg_quality=60.jpg', 1000, 100, '2022-03-01', 5, 5, NULL);
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `release_date`, `collection_id`, `actual_item_id`, `description`) VALUES (6, 'Planet Ocean 6000M', 'https://k8q7r7a2.stackpathcdn.com/wp-content/uploads/2022/03/Omega-Seamaster-Planet-Ocean-Ultra-Deep-6000m-O-Megasteel-review-2.jpg', 1800, 100, '2022-04-29', 6, 6, NULL);
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `release_date`, `collection_id`, `actual_item_id`, `description`) VALUES (7, 'Chronograph 41 TOP GUN Ceratanium', 'https://k8q7r7a2.stackpathcdn.com/wp-content/uploads/2022/03/IWC-Pilots-Watch-Chronograph-41-TOP-GUN-Ceratanium-IW388106-hands-on-watches-and-wonders-2022-1.jpg', 1200, 100, '2022-05-03', 7, 7, NULL);
INSERT INTO `member_token` (`id`, `token_name`, `token_img_url`, `price`, `total_supply`, `release_date`, `collection_id`, `actual_item_id`, `description`) VALUES (8, 'Khaki Field Titanium Automatic', 'https://hodinkee.imgix.net/uploads/images/16f730fa-b296-4ae3-8711-3dad9dc6f6c2/Hamiltons_SH9_5659_toned.jpg?ixlib=rails-1.1.0&fm=jpg&q=55&auto=format&usm=12&fit=crop&ch=Width%2CDPR%2CSave-Data&alt=&w=1640', 1000, 100, '2022-05-03', 8, 8, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `content`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `member_token_id`, `status`) VALUES (1, 'Nike Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: Nike', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'nike', 1, 'draft');
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `member_token_id`, `status`) VALUES (2, 'Taco Bell Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: Taco Bell', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'tacobell', 2, 'scheduled');
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `member_token_id`, `status`) VALUES (3, 'Adidas Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: Adidas', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'adidas', 3, 'published');
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `member_token_id`, `status`) VALUES (4, 'Reebok Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: Reebok', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'reebok', 4, 'published');
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `member_token_id`, `status`) VALUES (5, 'Sonic Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: Sonic', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'Dill', 5, 'published');
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `member_token_id`, `status`) VALUES (6, 'Omega Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: Omega', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'omega', 6, 'published');
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `member_token_id`, `status`) VALUES (7, 'IWC Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: IWC', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'iwc', 7, 'published');
INSERT INTO `content` (`id`, `title`, `description`, `text_content`, `image_url`, `access_code`, `member_token_id`, `status`) VALUES (8, 'Hamilton Watches Release', 'Be the first to gain access to the upcoming premiere with this exclusive asset.', 'Offered by: Hamilton Watches', 'https://images.unsplash.com/photo-1513151233558-d860c5398176', 'hamilton', 8, 'published');

COMMIT;


-- -----------------------------------------------------
-- Data for table `purchase`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `purchase` (`id`, `date_time_purchased`, `member_token_id`, `user_id`, `rating`, `rating_comment`) VALUES (1, '2022-04-21', 1, 1, NULL, NULL);
INSERT INTO `purchase` (`id`, `date_time_purchased`, `member_token_id`, `user_id`, `rating`, `rating_comment`) VALUES (2, '2022-04-21', 2, 2, NULL, NULL);
INSERT INTO `purchase` (`id`, `date_time_purchased`, `member_token_id`, `user_id`, `rating`, `rating_comment`) VALUES (3, '2022-04-21', 3, 3, NULL, NULL);
INSERT INTO `purchase` (`id`, `date_time_purchased`, `member_token_id`, `user_id`, `rating`, `rating_comment`) VALUES (4, '2022-04-21', 4, 4, NULL, NULL);
INSERT INTO `purchase` (`id`, `date_time_purchased`, `member_token_id`, `user_id`, `rating`, `rating_comment`) VALUES (5, '2022-10-21', 5, 5, NULL, NULL);
INSERT INTO `purchase` (`id`, `date_time_purchased`, `member_token_id`, `user_id`, `rating`, `rating_comment`) VALUES (6, '2022-10-21', 6, 6, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_token`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `favorite_token` (`user_id`, `member_token_id`) VALUES (1, 2);
INSERT INTO `favorite_token` (`user_id`, `member_token_id`) VALUES (2, 1);
INSERT INTO `favorite_token` (`user_id`, `member_token_id`) VALUES (3, 3);
INSERT INTO `favorite_token` (`user_id`, `member_token_id`) VALUES (4, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `content_resource`
-- -----------------------------------------------------
START TRANSACTION;
USE `membertokendb`;
INSERT INTO `content_resource` (`id`, `content_id`, `resource_url`, `title`, `description`) VALUES (1, 1, 'https://www.nike.com/launch/t/air-jordan-1-stash', 'Available 5/3 at 10:00 AM', 'Jordan Brand is bringing a utilitarian attitude to the OG Air Jordan that started it all');
INSERT INTO `content_resource` (`id`, `content_id`, `resource_url`, `title`, `description`) VALUES (2, 2, 'https://www.tacobell.com/news/mexican-pizza-makes-historic-return-to-taco-bell?', 'Available 5/19 at 9:00 AM', 'From performances to petitions, Taco Bell taps into fans’ pent up excitement to celebrate the return of the beloved item');
INSERT INTO `content_resource` (`id`, `content_id`, `resource_url`, `title`, `description`) VALUES (3, 3, 'https://www.adidas.com/us/superstar-parley-shoes/GV7615.html', 'Available 5/3 at 2:00 PM', 'IN COLLABORATION WITH PARLEY FOR THE OCEANS, THESE ADIDAS SUPERSTAR SHOES ARE MADE IN PART WITH RECYCLED MATERIALS.');
INSERT INTO `content_resource` (`id`, `content_id`, `resource_url`, `title`, `description`) VALUES (4, 4, 'https://www.reebok.com/us/la_casa_de_papel_collection-classics-classic_leather', 'Available 5/3 at 10:00 AM', 'LA CASA DE PAPEL CLASSIC LEATHER SHOES\n\nRETRO REEBOK SHOES WITH DRAMATIC \"LA CASA DE PAPEL\" STYLE');
INSERT INTO `content_resource` (`id`, `content_id`, `resource_url`, `title`, `description`) VALUES (5, 5, 'https://www.thrillist.com/news/nation/sonic-big-dill-cheeseburger-pickle-fries', 'Available 6/2 at 7:00 AM', 'A Pickle-Lover\'s Dream!');
INSERT INTO `content_resource` (`id`, `content_id`, `resource_url`, `title`, `description`) VALUES (6, 6, 'https://www.omegawatches.com/en-us/omegadays/seamaster-planet-ocean-ultra-deep', 'Available 5/12 at 5:00 AM', 'After reaching the deepest place on Earth in 2019, the ground-breaking Ultra Deep watch has been repurposed into a new 45.5 mm collection available to the public. Tested in real ocean conditions, this incredible divers’ range is water-resistant to 6,000 metres (20,000 ft.) and certified to meet the ISO 6425 standard.');
INSERT INTO `content_resource` (`id`, `content_id`, `resource_url`, `title`, `description`) VALUES (7, 7, 'https://www.watchtime.com/wristwatch-industry-news/iwc-is-back-in-black-with-the-chronograph-41-top-gun-ceratanium/', 'Available 6/1 at 1:00', 'The TOP GUN watches, which IWC has been producing since 2007, take their name from the Strike Fighter Tactics Instructor Program in the U.S. Navy. This training programme provides the best Navy pilots with flying and tactical training. The TOP GUN watches are therefore specially designed with robust materials, such as ceramic, titanium and for the first time Ceratanium®, an innovative material developed by IWC, to meet the specific requirements of elite jet pilots.');
INSERT INTO `content_resource` (`id`, `content_id`, `resource_url`, `title`, `description`) VALUES (8, 8, 'https://hiconsumption.com/hamilton-khaki-field-titanium-38/', 'Available 5/10 at 6:00 PM', 'Are you looking for the ideal military watch? The Khaki Field collection includes classic army style watches that have been tried and tested over time. Rugged, robust and resilient, they’re ready for the outdoors and can compete with the best sport watches out there. Built for life’s adventurers, they’re guaranteed to be equal to your needs out in the field');
INSERT INTO `content_resource` (`id`, `content_id`, `resource_url`, `title`, `description`) VALUES (9, 1, 'https://www.nike.com/launch/t/air-jordan-1-stash', 'Get ready for the launch!', 'Stay tuned for the upcoming announcement');

COMMIT;

