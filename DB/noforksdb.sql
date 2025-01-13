-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema noforksdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `noforksdb` ;

-- -----------------------------------------------------
-- Schema noforksdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `noforksdb` DEFAULT CHARACTER SET utf8 ;
USE `noforksdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `create_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  `profile_image_url` VARCHAR(2000) NULL,
  `biography` TEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plan` ;

CREATE TABLE IF NOT EXISTS `plan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `create_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  `notes` TEXT NULL,
  `user_id` INT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_planner_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_planner_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `diet` ;

CREATE TABLE IF NOT EXISTS `diet` (
  `id` INT NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe` ;

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(60) NOT NULL,
  `description` LONGTEXT NULL,
  `prep_time_minutes` INT NULL,
  `cook_time_minutes` INT NULL,
  `instructions` TEXT NOT NULL,
  `servings` INT NULL,
  `difficulty` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `ingredients` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  `create_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal_type` ;

CREATE TABLE IF NOT EXISTS `meal_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal` ;

CREATE TABLE IF NOT EXISTS `meal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `notes` TEXT NULL,
  `meal_type_id` INT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_meal_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_meal_meal_type1_idx` (`meal_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_meal_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meal_meal_type1`
    FOREIGN KEY (`meal_type_id`)
    REFERENCES `meal_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal_has_recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal_has_recipe` ;

CREATE TABLE IF NOT EXISTS `meal_has_recipe` (
  `meal_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`meal_id`, `recipe_id`),
  INDEX `fk_meal_has_recipe_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  INDEX `fk_meal_has_recipe_meal1_idx` (`meal_id` ASC) VISIBLE,
  CONSTRAINT `fk_meal_has_recipe_meal1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `meal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meal_has_recipe_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plan_meal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plan_meal` ;

CREATE TABLE IF NOT EXISTS `plan_meal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `plan_id` INT NOT NULL,
  `meal_id` INT NOT NULL,
  `meal_type_id` INT NOT NULL,
  `day_number` INT NULL,
  `notes` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_plan_meal_plan1_idx` (`plan_id` ASC) VISIBLE,
  INDEX `fk_plan_meal_meal1_idx` (`meal_id` ASC) VISIBLE,
  INDEX `fk_plan_meal_meal_type1_idx` (`meal_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_plan_meal_plan1`
    FOREIGN KEY (`plan_id`)
    REFERENCES `plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plan_meal_meal1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `meal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plan_meal_meal_type1`
    FOREIGN KEY (`meal_type_id`)
    REFERENCES `meal_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cuisine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cuisine` ;

CREATE TABLE IF NOT EXISTS `cuisine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `diet_has_recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `diet_has_recipe` ;

CREATE TABLE IF NOT EXISTS `diet_has_recipe` (
  `diet_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`diet_id`, `recipe_id`),
  INDEX `fk_diet_has_recipe_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  INDEX `fk_diet_has_recipe_diet1_idx` (`diet_id` ASC) VISIBLE,
  CONSTRAINT `fk_diet_has_recipe_diet1`
    FOREIGN KEY (`diet_id`)
    REFERENCES `diet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diet_has_recipe_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cuisine_has_recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cuisine_has_recipe` ;

CREATE TABLE IF NOT EXISTS `cuisine_has_recipe` (
  `cuisine_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`cuisine_id`, `recipe_id`),
  INDEX `fk_cuisine_has_recipe_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  INDEX `fk_cuisine_has_recipe_cuisine1_idx` (`cuisine_id` ASC) VISIBLE,
  CONSTRAINT `fk_cuisine_has_recipe_cuisine1`
    FOREIGN KEY (`cuisine_id`)
    REFERENCES `cuisine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cuisine_has_recipe_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_review` ;

CREATE TABLE IF NOT EXISTS `recipe_review` (
  `user_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  `rating` INT NULL,
  `remarks` TEXT NULL,
  `create_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `recipe_id`),
  INDEX `fk_user_has_recipe_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  INDEX `fk_user_has_recipe_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_recipe_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_recipe_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal_review` ;

CREATE TABLE IF NOT EXISTS `meal_review` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `meal_id` INT NOT NULL,
  `rating` INT NULL,
  `remarks` TEXT NULL,
  `create_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `meal_id`),
  INDEX `fk_user_has_recipe_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_recipe_review_copy1_meal1_idx` (`meal_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_recipe_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_review_copy1_meal1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `meal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_comment` ;

CREATE TABLE IF NOT EXISTS `recipe_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comments` TEXT NOT NULL,
  `create_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  `in_reply_to_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_recipe_comment_recipe1_idx` (`recipe_id` ASC) VISIBLE,
  INDEX `fk_recipe_comment_recipe_comment1_idx` (`in_reply_to_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_comment_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_comment_recipe_comment1`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `recipe_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meal_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meal_comment` ;

CREATE TABLE IF NOT EXISTS `meal_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comments` TEXT NOT NULL,
  `create_date` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `in_reply_to_id` INT NULL,
  `meal_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_recipe_comment_recipe_comment1_idx` (`in_reply_to_id` ASC) VISIBLE,
  INDEX `fk_meal_comment_meal1_idx` (`meal_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_comment_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_comment_recipe_comment10`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `meal_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meal_comment_meal1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `meal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plan_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plan_comment` ;

CREATE TABLE IF NOT EXISTS `plan_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comments` TEXT NOT NULL,
  `create_date` DATETIME NULL,
  `user_id` INT NOT NULL,
  `in_reply_to_id` INT NULL,
  `plan_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_recipe_comment_recipe_comment1_idx` (`in_reply_to_id` ASC) VISIBLE,
  INDEX `fk_plan_comment_plan1_idx` (`plan_id` ASC) VISIBLE,
  CONSTRAINT `fk_recipe_comment_user11`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_comment_recipe_comment11`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `plan_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plan_comment_plan1`
    FOREIGN KEY (`plan_id`)
    REFERENCES `plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_meal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_meal` ;

CREATE TABLE IF NOT EXISTS `favorite_meal` (
  `user_id` INT NOT NULL,
  `meal_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `meal_id`),
  INDEX `fk_user_has_meal_meal1_idx` (`meal_id` ASC) VISIBLE,
  INDEX `fk_user_has_meal_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_meal_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_meal_meal1`
    FOREIGN KEY (`meal_id`)
    REFERENCES `meal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `followed_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `followed_user` ;

CREATE TABLE IF NOT EXISTS `followed_user` (
  `user_id` INT NOT NULL,
  `followed_user_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `followed_user_id`),
  INDEX `fk_user_has_user_user2_idx` (`followed_user_id` ASC) VISIBLE,
  INDEX `fk_user_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user_user2`
    FOREIGN KEY (`followed_user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS noforks@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'noforks'@'localhost' IDENTIFIED BY 'noforks';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'noforks'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `create_date`, `last_update`, `profile_image_url`, `biography`) VALUES (1, 'admin', 'test', 1, NULL, NULL, '2025-01-10', '2025-01-10', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `create_date`, `last_update`, `profile_image_url`, `biography`) VALUES (2, 'DwightS', 'beets', 1, NULL, NULL, '2025-01-10', '2025-01-10', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `create_date`, `last_update`, `profile_image_url`, `biography`) VALUES (3, 'SithLord', 'r2d2', 1, NULL, 'killjedi666@sithcorp.com', '2025-01-12', '2025-01-12', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `plan`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `plan` (`id`, `create_date`, `last_update`, `notes`, `user_id`, `image_url`) VALUES (1, '2025-01-10', '2025-01-10', 'random note', 1, NULL);
INSERT INTO `plan` (`id`, `create_date`, `last_update`, `notes`, `user_id`, `image_url`) VALUES (2, '2025-01-12', '2025-01-12', 'random note', 2, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `diet`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `diet` (`id`, `name`, `description`) VALUES (1, 'Vegan', 'No Animal Products');
INSERT INTO `diet` (`id`, `name`, `description`) VALUES (2, 'Diabetic', 'Low Carb');
INSERT INTO `diet` (`id`, `name`, `description`) VALUES (3, 'Keto', 'No Carbs');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`) VALUES (1, 'Chicken Alfredo', 'Pasta, Chicken, Sauce', 5, 40, 'Boil water', 4, 'medium', 1, 'chicken', NULL, '2025-01-10', '2025-01-12');
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`) VALUES (2, 'Pizza', 'Pepperoni and Cheese', 20, 20, 'Knead dough', 2, 'medium', 2, 'flour', NULL, '2025-01-12', '2025-01-12');

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `meal_type` (`id`, `name`, `description`) VALUES (1, 'Breakfast', 'Morning');
INSERT INTO `meal_type` (`id`, `name`, `description`) VALUES (2, 'Lunch', 'Mid-day');
INSERT INTO `meal_type` (`id`, `name`, `description`) VALUES (3, 'Dinner', 'Evening');
INSERT INTO `meal_type` (`id`, `name`, `description`) VALUES (4, 'Snack', 'Anytime');

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`) VALUES (1, 1, 'Tacos de Lengua', '2025-01-12', '2025-01-12', 'Cow Tongue', 3, NULL);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`) VALUES (2, 3, 'Bibimbap', '2025-01-12', '2025-01-12', 'Best in a stone bowl', 3, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal_has_recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (1, 1);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `plan_meal`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `plan_meal` (`id`, `plan_id`, `meal_id`, `meal_type_id`, `day_number`, `notes`) VALUES (1, 1, 1, 1, NULL, 'random note');
INSERT INTO `plan_meal` (`id`, `plan_id`, `meal_id`, `meal_type_id`, `day_number`, `notes`) VALUES (2, 2, 1, 1, NULL, 'another note');

COMMIT;


-- -----------------------------------------------------
-- Data for table `cuisine`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `cuisine` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Mexican', 'Spanish', NULL);
INSERT INTO `cuisine` (`id`, `name`, `description`, `image_url`) VALUES (2, 'American', 'American', NULL);
INSERT INTO `cuisine` (`id`, `name`, `description`, `image_url`) VALUES (3, 'Italian', 'Italian', NULL);
INSERT INTO `cuisine` (`id`, `name`, `description`, `image_url`) VALUES (4, 'Chinese', 'Asian', NULL);
INSERT INTO `cuisine` (`id`, `name`, `description`, `image_url`) VALUES (5, 'Japanese', 'Asian', NULL);
INSERT INTO `cuisine` (`id`, `name`, `description`, `image_url`) VALUES (6, 'Korean', 'Asian', NULL);
INSERT INTO `cuisine` (`id`, `name`, `description`, `image_url`) VALUES (7, 'French', 'European', NULL);
INSERT INTO `cuisine` (`id`, `name`, `description`, `image_url`) VALUES (8, 'German', 'European', NULL);
INSERT INTO `cuisine` (`id`, `name`, `description`, `image_url`) VALUES (9, 'Filipino', 'Islander', NULL);
INSERT INTO `cuisine` (`id`, `name`, `description`, `image_url`) VALUES (10, 'Indian', NULL, NULL);
INSERT INTO `cuisine` (`id`, `name`, `description`, `image_url`) VALUES (11, 'Greek', 'Mediterranean', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `diet_has_recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `diet_has_recipe` (`diet_id`, `recipe_id`) VALUES (1, 1);
INSERT INTO `diet_has_recipe` (`diet_id`, `recipe_id`) VALUES (2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `cuisine_has_recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `cuisine_has_recipe` (`cuisine_id`, `recipe_id`) VALUES (1, 1);
INSERT INTO `cuisine_has_recipe` (`cuisine_id`, `recipe_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `recipe_review` (`user_id`, `recipe_id`, `rating`, `remarks`, `create_date`, `last_update`) VALUES (1, 1, 4, NULL, '2025-01-10', '2025-01-10');
INSERT INTO `recipe_review` (`user_id`, `recipe_id`, `rating`, `remarks`, `create_date`, `last_update`) VALUES (3, 2, 3, 'wasnt great', '2025-01-12', '2025-01-12');

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `meal_review` (`user_id`, `meal_id`, `rating`, `remarks`, `create_date`, `last_update`) VALUES (1, 1, 4, 'will make again', '2025-01-10', '2025-01-10');
INSERT INTO `meal_review` (`user_id`, `meal_id`, `rating`, `remarks`, `create_date`, `last_update`) VALUES (3, 2, 5, 'very good', '2025-01-12', '2025-01-12');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `recipe_comment` (`id`, `comments`, `create_date`, `last_update`, `user_id`, `recipe_id`, `in_reply_to_id`) VALUES (1, 'V cant cook', '2025-01-10', '2025-01-10', 1, 1, NULL);
INSERT INTO `recipe_comment` (`id`, `comments`, `create_date`, `last_update`, `user_id`, `recipe_id`, `in_reply_to_id`) VALUES (2, 'very simple', '2025-01-12', '2025-01-12', 2, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `meal_comment` (`id`, `comments`, `create_date`, `user_id`, `in_reply_to_id`, `meal_id`) VALUES (1, 'V cant cook', '2025-01-10', 1, NULL, 1);
INSERT INTO `meal_comment` (`id`, `comments`, `create_date`, `user_id`, `in_reply_to_id`, `meal_id`) VALUES (2, 'Takes a little longer than told', '2025-01-12', 2, NULL, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `plan_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `plan_comment` (`id`, `comments`, `create_date`, `user_id`, `in_reply_to_id`, `plan_id`) VALUES (1, 'V cant cook', '2025-01-12', 1, NULL, 1);
INSERT INTO `plan_comment` (`id`, `comments`, `create_date`, `user_id`, `in_reply_to_id`, `plan_id`) VALUES (2, 'great for high carbs', '2025-01-12', 3, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_meal`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `favorite_meal` (`user_id`, `meal_id`) VALUES (1, 1);
INSERT INTO `favorite_meal` (`user_id`, `meal_id`) VALUES (2, 2);
INSERT INTO `favorite_meal` (`user_id`, `meal_id`) VALUES (3, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `followed_user`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `followed_user` (`user_id`, `followed_user_id`) VALUES (1, 2);
INSERT INTO `followed_user` (`user_id`, `followed_user_id`) VALUES (2, 1);
INSERT INTO `followed_user` (`user_id`, `followed_user_id`) VALUES (3, 1);

COMMIT;

