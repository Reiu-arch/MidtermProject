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
  `name` VARCHAR(45) NOT NULL,
  `create_date` DATETIME NOT NULL,
  `last_update` DATETIME NOT NULL,
  `notes` TEXT NULL,
  `user_id` INT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  `schedule_date` DATETIME NULL,
  `enabled` TINYINT NOT NULL,
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
  `enabled` TINYINT NOT NULL,
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
  `enabled` TINYINT NOT NULL,
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
  `recipe_id` INT NOT NULL,
  `cuisine_id` INT NOT NULL,
  PRIMARY KEY (`recipe_id`, `cuisine_id`),
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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `create_date`, `last_update`, `profile_image_url`, `biography`) VALUES (1, 'admin', 'test', 1, 'Admin', NULL, '2025-01-10', '2025-01-10', 'https://www.ajc.org/sites/default/files/inline-images/Term%208%20-%20Pepe%20the%20FrogInline-300xflex.jpg', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `create_date`, `last_update`, `profile_image_url`, `biography`) VALUES (2, 'DwightS', 'beets', 1, 'Member', NULL, '2025-01-10', '2025-01-10', 'https://img.nbc.com/files/images/2013/11/12/dwight-500x500.jpg', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `create_date`, `last_update`, `profile_image_url`, `biography`) VALUES (3, 'SithLord', 'r2d2', 1, 'Member', 'killjedi666@sithcorp.com', '2025-01-12', '2025-01-12', 'https://cdn.openart.ai/published/yFPd4qLOC4gLwjBdASN6/UrjsdNhZ_9iRE_1024.webp', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `plan`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `plan` (`id`, `name`, `create_date`, `last_update`, `notes`, `user_id`, `image_url`, `schedule_date`, `enabled`) VALUES (1, 'customName', '2025-01-10', '2025-01-10', 'random note', 1, NULL, NULL, 1);
INSERT INTO `plan` (`id`, `name`, `create_date`, `last_update`, `notes`, `user_id`, `image_url`, `schedule_date`, `enabled`) VALUES (2, 'customName2', '2025-01-12', '2025-01-12', 'random note', 2, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `diet`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `diet` (`id`, `name`, `description`) VALUES (1, 'Vegan', 'No Animal Products');
INSERT INTO `diet` (`id`, `name`, `description`) VALUES (2, 'Diabetic', 'Low Carb');
INSERT INTO `diet` (`id`, `name`, `description`) VALUES (3, 'Keto', 'No Carbs');
INSERT INTO `diet` (`id`, `name`, `description`) VALUES (4, 'Vegetarian', 'No Meat');
INSERT INTO `diet` (`id`, `name`, `description`) VALUES (5, 'Pescatarian', 'Fish Products Only');

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (1, 'Baked Salmon with Amazing Lemon Sauce', 'Delicious baked salmon with crispy potatoes, broccoli, and the most amazing life-changing lemon sauce smothered on top of it all. This is restaurant bistro-style eating!', 10, 40, 'Roast the Potatoes: Preheat the oven to 400 degrees. Line a baking sheet with parchment. Add the potatoes to the pan and toss with a little bit of olive oil, garlic powder, salt, and pepper. Roast for 25 minutes until lightly browned and delicious. Make the Life-Changingly Delicious Sauce: While the potatoes are roasting, make your sauce. Melt the butter over medium low heat (I usually start with 6 tablespoons and add the last two if needed once the sauce is cooked). Add the garlic, shallot, and thyme sprigs; sauté for 3-5 minutes until soft and fragrant. Add broth and cream; bring to a low simmer. Let the sauce hang out over low heat until it starts to thicken enough to coat the back of a spoon. Remove the thyme sprigs. Whisk in the lemon juice, stir in the herbs, and season with salt and pepper. Give it a taste. Yes, you’re in heaven now.  Bake the Salmon and Broccoli: Add the broccoli and the salmon to the potato pan (keeping the potatoes on there). Toss or brush with a little more oil, salt, and pepper. Bake for another 10-15 minutes, until the salmon is fully cooked – I like it to be *just* past the point of translucent where it flakes apart very easily but isn’t dried out. You’re Done: Serve salmon, potatoes, and broccoli with big spoonfuls of sauce, more herbs, and more lemon wedges. This is living.', 4, 'Medium', 1, 'For the Sheet Pan:\n\n1 lb. small gold potatoes, cut into bite-sized pieces\nolive oil + garlic powder, salt, and pepper\n2–3 cups of broccoli florets (I’m using baby broccoli in the photos)\n1–2 lbs. salmon (cut into 2-4 filets)\nLemon Herb Sauce:\n\n6–8 tablespoons butter\n1–2 cloves garlic, minced\n1 shallot, minced\n2–3 sprigs of fresh thyme\n1/2 cup heavy cream\n1/2 cup chicken broth\njuice of 1 lemon\n2 tablespoons chopped fresh parsley or basil\nsalt and pepper to taste', 'https://pinchofyum.com/cdn-cgi/image/width=680,height=99999,fit=scale-down/wp-content/uploads/Salmon-with-Lemon-Sauce-3.jpg', '2025-01-10', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (2, 'Light BBQ Chicken Pizza', 'This light BBQ chicken pizza has just 200 calories per slice thanks to a cauliflower pizza crust. Healthy, colorful, and full of BBQ flavor!', 30, 40, 'Chop the cauliflower into medium pieces. Heat a large skillet over high heat. Add the oil and heat until shiny. Place the cauliflower in the hot oil, stir to cover with oil, and place a lid on the skillet. Check skillet every few minutes to keep cauliflower from burning, but let it get a nice browned roasted outside. Continue to let cauliflower cook, covered, for about 10-15 minutes, or until tender-crisp. Let cool for a few minutes.\nPreheat the oven to 450. In a blender or large food processor, place eggs, cornmeal, and seasoning. Place cauliflower in blender and puree until you have a semi-smooth, thick batter. Cover a pizza pan with parchment paper and pour batter into the center of the paper. Spread until you have about a 1/2 inch thick crust or thinner if desired.\nBake the crust for about 20 minutes, checking occasionally to keep from burning. I liked the crispy edges, so I recommend letting it brown a little bit more than a normal crust.\nWhile crust is cooking, coat chicken with barbecue sauce. When the crust is cooked through and golden brown, remove and top with barbecue chicken, half the cheese, red onion, and the rest of the cheese. Bake for 10-15 minutes or until cheese is melted and golden. Top with cilantro, slice, and serve!', 8, 'Medium', 2, '1 head cauliflower\n2 tablespoons olive oil\nsalt and pepper\n1/2 cup cornmeal\n2 eggs\n2 teaspoons Italian seasoning\n1/2 cup barbecue sauce\n1 cup cooked, shredded chicken\n3/4 cup shredded Mozzarella cheese\nthinly sliced red onions\nfresh cilantro', 'https://pinchofyum.com/wp-content/uploads/bbq-chicken-pizza.jpg', '2025-01-12', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (3, 'Stuffed Peppers', 'Italian Stuffed Peppers', 20, 65, 'Preheat oven to 350°F.\nRinse peppers and mushrooms. Cut large peppers in half lengthwise and remove seeds. Finely chop bell pepper half. Finely chop mushrooms.\nPeel onion and garlic. Finely chop onion and mince garlic.\nGrate cheese. Set aside.\nIn a large skillet over medium heat, cook turkey, finely chopped bell pepper, mushrooms, onion and garlic, crumbling turkey with a wooden spoon or spatula, until the turkey is browned, 10 to 15 minutes.\nIn a colander, drain off liquid and return to the pan. Stir in tomatoes, tomato sauce, rice, parsley or thyme, oregano, salt and pepper. Bring to a simmer, cover and cook, stirring occasionally, until rice is tender, about 15 minutes.\nPut 1/4 cup water in a 9x13-inch baking dish. Place the pepper halves, cut side up, in the baking dish. Divide turkey mixture among the pepper halves. Sprinkle each pepper half with 2 tablespoons cheese.\nSpray a sheet of foil with nonstick cooking spray and cover baking dish with the foil, sprayed side down. Bake until peppers are tender-crisp, about 30 minutes.\n', 6, 'Medium', 1, '3 large bell peppers plus\n1/2 small bell pepper (any color)\n8 ounces mushrooms\n1 small onion\n1 clove garlic\n3 ounces part-skim mozzarella cheese\n12 ounces 93% lean ground turkey\n1 (14-ounce) can diced tomatoes, no salt added\n1 (8-ounce) can tomato sauce, no salt added\n1/2 cup instant brown rice\n1 teaspoon dried parsley leaves or thyme\n1 teaspoon dried oregano leaves\n1/4 teaspoon salt\n1/4 teaspoon ground black pepper\n1/4 teaspoon crushed red pepper\n¼ cup water', 'https://cookingmatters.org/wp-content/uploads/2021/11/Cooking-Matters-Recipe-StffPeppers.png', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (4, 'Vegan Meg-Burritos', 'These Vegan Mega-Burritos are stuffed with a sweet potato, cauliflower, and walnut taco meat filling, plus the usual suspects of avocado, salsa, and a heavy thwap of vegan cashew queso! Versatile, quick to make, and seriously SO GOOD.', 5, 10, 'Filling: Start with your sweet potatoes in a skillet with a swish of oil and salt. Saute until fork-tender. Add prepared cauliflower walnut taco meat and just enough water to get it looking nice and saucy and taco-meaty.\nBlend: Blitz all of the ingredients for the vegan queso in a blender until smooth.\nAssemble: Stuff a flour tortilla with mashed avocado, cauliflower walnut filling, salsa, cilantro, and queso. Roll, wrap, fry in a skillet… whatever suits your fancy. The Mega-Burrito says YOU DO YOU!', 4, 'Medium', 1, 'Burrito Filling  2 sweet potatoes, chopped (see notes) 3 cups cauliflower walnut taco meat 1 cup water Vegan Queso  1 cup cashews 1/2 cup water one 4-ounce can green chiles 1 chipotle pepper canned in adobo (more to taste) 1/2 teaspoon kosher salt (more if your cashews are unsalted) 1–2 tablespoons of chipotle adobo sauce (optional for more oomph) 2–4 tablespoons nutritional yeast (optional for more cheeziness) Toppings  2 mashed avocados 1/2 cup salsa 2 tablespoons cilantro 4 large flour tortillas Vegan queso (see recipe above)', 'https://pinchofyum.com/cdn-cgi/image/width=680,height=99999,fit=scale-down/wp-content/uploads/Mega-Burritos-8.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (5, 'Sesame Noodle Bowls', 'Meal Prep Sesame Noodle Bowls! Fork-twirly noodles, an easy creamy sesame sauce, perfect browned chicken, and all the veg. YUM.', 10, 5, 'Sauce: Whisk all sauce ingredients together until smooth (or you can run it through the food processor, or shake it up in a jar).\nNoodles: Cook noodles a few minutes LESS than package instructions. If your noodles seem very sticky, rinse them in cold water. Toss noodles with about half of the sesame sauce.\nBowls: Divide noodles, edamame, cucumber, and chicken into containers. Drizzle with a little extra sauce and sprinkle with sesame seeds. Voila! Store in the fridge for 3-4 days. Eat hot or cold. Take a shot for the ‘gram cause this is your moment.', 4, 'Easy', 2, 'Sauce: Whisk all sauce ingredients together until smooth (or you can run it through the food processor, or shake it up in a jar).\nNoodles: Cook noodles a few minutes LESS than package instructions. If your noodles seem very sticky, rinse them in cold water. Toss noodles with about half of the sesame sauce.\nBowls: Divide noodles, edamame, cucumber, and chicken into containers. Drizzle with a little extra sauce and sprinkle with sesame seeds. Voila! Store in the fridge for 3-4 days. Eat hot or cold. Take a shot for the ‘gram cause this is your moment.', 'https://pinchofyum.com/cdn-cgi/image/width=680,height=99999,fit=scale-down/wp-content/uploads/Sesame-Noodles-with-Chicken.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (6, 'Black Pepper Stir Fried Udon', 'This Black Pepper Stir Fried Udon is the perfect SOS dinner! Saucy udon noodles, dark soy sauce, stir fry veggies, fresh garlic, and lots of freshly ground black pepper. So easy! ', 5, 15, 'Sauce: Shake up all the sauce ingredients in a jar.  Noodles: Heat a nonstick skillet over medium high heat. Add a swish of oil. Add the noodles and enough sauce to coat. Stir-fry until nice and yummy. (They’ll get kind of caramelized if you leave them undisturbed for a minute or two – so good.) Veggies: Add the veggies and pour a little more sauce over everything (it’s okay if you don’t use all of it -it’ll keep in the fridge for a second batch later). Toss it around for 2-3 minutes until the veggies are fork-tender and everything is looking browned and sticky and pan-fried to perfection.', 3, 'Easy', 3, 'Sauce:\n\n3 tablespoons dark soy sauce (see FAQs if using regular soy sauce)\n2 tablespoons oyster sauce\n1 1/2 tablespoons brown sugar\n1 tablespoon rice vinegar\nUdon Stir Fry:\n\na little bit of neutral oil\n2 cups of stir fry veggies (I use about half of a bag of a frozen stir fry veggie blend)\ntwo 7-ounce packages of udon noodles (the cooked, fat, squishy ones, like this – see post for more noodle options)\nFinishing Touches:\n\n1–2 cloves fresh garlic, minced\na ton of freshly ground black pepper', 'https://pinchofyum.com/cdn-cgi/image/width=680,height=99999,fit=scale-down/wp-content/uploads/Udon-1-3.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (7, 'Schnitzel with Mushroom Gravy', 'This German Schnitzel with Mushroom Gravy is so flavorful and easy to make, even on a busy weeknight. Use veal, pork, or chicken...pound the cutlet out thin...bread, whip up the sauce, quick fry...and you are set! So delicious!', 20, 12, 'MUSHROOM GRAVY\nHeat the olive oil over medium-high heat in a medium skillet\nAdd the butter\nAdd the garlic and saute for about 1 minute.\nAdd the onion and cook for another 4 minutes, or until translucent.\nAdd the mushrooms and cook until they start to release liquid, about 4 minutes.\nAdd the flour and stir to incorporate.\nAdd the wine, stirring to combine. Cook until the wine reduces down, about 4 minutes.\nAdd the stock, and stir frequently . The sauce will start to thicken over the next 5 minutes.\nStir in the mustard, Worcestershire sauce.\nSeason with salt and pepper.\nKeep warm:  SCHNITZEL\nHeat the oil in a large, sturdy skillet over medium-high heat.\nPound the cutlet between wax paper, or in a large freezer bag, by using the side of a meat tenderizer. Pound down to about 1/8\". Trim any jagged sides, and/or excess fat.\nPlace the flour in one medium-sized bowl.\nPlace the eggs in another bowl and gently mix together. Mix in another 2 tablespoons of water.\nIn a third bowl, mix together the bread crumbs, salt, pepper, paprika and caraway seeds.\nDredge each cutlet in the flour, then dip in the egg wash (shake off excess), then dredge in the bread crumb mixture.\nFry each cutlet (don\'t overcrowd the pan) for about 4 minutes per side, or until golden brown.\nServe with gravy poured over top and garnished with lemon wedges and parsley.', 4, 'Medium', 3, 'MUSHROOM GRAVY\n▢2 tbsp olive oil\n▢2 tbsp unsalted butter\n▢1/2 onion, chopped\n▢1 clove garlic, minced\n▢8 oz. cremeni mushrooms sliced\n▢1/4 cup all-purpose flour\n▢1/2 cup white wine\n▢2 1/2 cups beef stock\n▢1 tbsp whole grain mustard\n▢1 tbsp Worcestershire sauce\n▢Salt and pepper to taste (about 1/4 teaspoon each)\nSCHNITZEL\n▢Vegetable oil for pan frying (about 2 cups)\n▢4 boneless pork chops about 16 ounces, total\n▢1 cup all-purpose flour\n▢2 large eggs plus two tablespoons of water\n▢1 cup dried bread crumbs not seasoned\n▢1 tsp Kosher salt\n▢1 tsp freshly ground black pepper\n▢1 tsp smoked paprika\n▢1/2 tsp caraway seeds\n▢Lemon wedges, for garnish\n▢Flat-leaf parsley, chopped, for garnish\nMUSHROOM GRAVY\n▢2 tbsp olive oil\n▢2 tbsp unsalted butter\n▢1/2 onion, chopped\n▢1 clove garlic, minced\n▢8 oz. cremeni mushrooms sliced\n▢1/4 cup all-purpose flour\n▢1/2 cup white wine\n▢2 1/2 cups beef stock\n▢1 tbsp whole grain mustard\n▢1 tbsp Worcestershire sauce\n▢Salt and pepper to taste (about 1/4 teaspoon each)\nSCHNITZEL\n▢Vegetable oil for pan frying (about 2 cups)\n▢4 boneless pork chops about 16 ounces, total\n▢1 cup all-purpose flour\n▢2 large eggs plus two tablespoons of water\n▢1 cup dried bread crumbs not seasoned\n▢1 tsp Kosher salt\n▢1 tsp freshly ground black pepper\n▢1 tsp smoked paprika\n▢1/2 tsp caraway seeds\n▢Lemon wedges, for garnish\n▢Flat-leaf parsley, chopped, for garnish\n', 'https://howtofeedaloon.com/wp-content/uploads/2015/06/Schnitzel-1-2-1270x1904.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (8, 'Greek Salad with Griled Steak', 'This Greek Salad with Grilled Steak brings together two of our favorites things in the world...a Greek salad and beautifully grilled skirt steak. Marinate the steak first for about 4 hours (or overnight), then marinate the feta cheese, then assemble this amazing entree salad. Incredible!', 25, 10, 'Marinate the Steak\nIn a medium bowl, whisk together 3 tablespoons of the oil with the garlic, oregano, vinegar, Worcestershire sauce, salt, and pepper. Place the steak in a large plastic baggie, or in a small baking dish. Pour the marinade over the steak and turn the meat until it is fully coated. Seal and place in the refrigerator for at least 4 hours and up to overnight. Marinate the Cheese and Prepping the Salad\nPlace the cheese into a large bowl. Mix in the cheese marinade ingredients and chill in the fridge until ready to finish assembling the salad.\nIn a separate bowl, mix together the parsley, tomatoes, cucumbers, capers, olives, and red onion. Cover with plastic wrap and set aside. Cook the Steak\nPrepare a medium-high hot grill.\nRemove the steaks from the marinade and grill for approx. 5 minutes per side, or until an internal temperature of 145°F (medium) is reached. Place on a cutting board and loosely tent with a piece of foil for about 10 minutes. Cutting with the grain, slice the steak into two or three pieces about 3 inches in length. Turn the pieces 90° and cut against the grain into bite-sized strips.\nAssemble the Salad\nRemove the large bowl with the marinated cheese from the refrigerator. Mix in the cucumber salad and the chopped romaine.\nTransfer the salad to a large serving platter and use a spatula to place the sliced steak on top. Serve at once.', 6, 'Easy', 2, 'For Marinating the Steak 3 tbsp extra-virgin olive oil 3 cloves garlic roughly chopped 1 tbsp dried oregano 2 tbsp red wine vinegar 1 tbsp Worcestershire sauce ¾ tsp Kosher salt ½ tsp black pepper freshly ground 1 lb skirt steak or flap, or ribeye For Marinating the Cheese 8 oz feta cheese crumbled 3 tbsp extra-virgin olive oil 2 tbsp red wine vinegar 1 tbsp oregano dried ¼ tsp crushed red pepper flakes ½ tsp Kosher salt ¼ tsp black pepper freshly ground For the Salad 2 tbsp fresh flat-leaf parsley chopped 1 medium cucumber halved, seeds removed and roughly chopped 1 cup cherry tomatoes halved 1 2.75 oz capers drained, about ½ cup ½ cup Kalamata olives pitted, halved ½ cup red onion chopped 2 cups Romaine lettuce chopped', 'https://howtofeedaloon.com/wp-content/uploads/2016/07/greek-salad-4.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (9, 'Beef Bulgogi Lettuce Wraps', 'These Korean-style lettuce wraps are unbelievably delicious. The marinade for the bulgogi can be made well in advance, as can the pickled veggies and BBQ sauce. Not only is the dish incredibly flavorful, but it\'s fun to serve it buffet-style and let guests build their own wraps to their own liking!', 30, 15, 'Prepare the Bulgogi\nWrap the meat in plastic wrap and place it in the freezer for 30 minutes to 1 hour. Remove the meat from the freezer, and using a sharp knife, cutting against the grain, slice it into thin pieces. Place in a large bowl.\nPlace the onion, pear, garlic, ginger, green onion, soy sauce, oil, brown sugar, honey, and pepper in a blender. Purée until smooth. Pour the marinade over the meat and use a wooden spatula to stir the meat until fully coated by the marinade. Cover with plastic wrap and refrigerate for 1 to 2 hours, or overnight.\nHeat a large skillet or wok over high heat. Use tongs to lift the meat from the marinade in the bowl, shaking off excess marinade. Add the hot skillet or wok and cook, stirring often, until fully cooked and dark brown in spots, about 15 minutes. Most of the excess liquid should cook off.\nAssemble the Lettuce Wraps\nMound the lettuce leaves on a plate and place all the garnishes in bowls. Place several strips of the bulgogi on top of a lettuce wrap, then top with pickled carrots and cucumbers, sliced peppers (if using), a drizzle of BBQ sauce, and topped with a pinch of sesame seeds. Repeat with remaining lettuce wraps and serve at once. Or, allow guests to build their own wraps. Korean BBQ Sauce\nMix all the ingredients in a small/medium bowl and set aside. If not using immediately, cover with plastic wrap and refrigerate until ready to use. ', 4, 'Easy', 3, 'Ingredients\n2 medium carrots peeled and julienne cut (or shredded) -\n1 cucumber seeded and cut into 1-inch sticks\n¾ cup apple cider vinegar\nFor the Bulgogi\n1 lb beef ribeye or skirt steak works well\n1 medium onion peeled and quartered\n1 Asian pear peeled, cored and roughly chopped (Anjou pear works, too)\n4 cloves garlic minced\n1 tbsp fresh ginger roughly chopped\n1 green onion chopped\n2 tbsp soy sauce\n1 tbsp sesame oil\n1 tbsp brown sugar\n1 tbsp honey\n½ tsp black pepper\nFor the Lettuce Wraps\nLettuce leaves green leaf, or iceberg work well, trimmed\nPeppers sliced, for garnish, optional\n2 sesame seeds for garnish\nFor the Korean BBQ Sauce\n2 tbsp gochujang 1 tbsp for less heat\n1 tbsp sesame oil\n1 tsp sugar\n1 tbsp water\n1 tsp apple cider vinegar\n1 clove garlic minced', 'https://howtofeedaloon.com/wp-content/uploads/2024/05/Beef-Bulgogi-Lettus-Wraps-on-black-plate-770x1157.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (10, 'Cream of Cauliflower Soup', '(Creme du Barry) When the chill of winter sets in, few dishes comfort me like this Cream of Cauliflower Soup. Known in French as “Crème du Barry”, this recipe is steeped in royal origin. This classic French recipe is made with a whole cauliflower head mixed with heavy cream and aromatics. Velvety smooth and deeply flavorful, it’s a lighter, vegetable-forward soup that deserves a place in every French cooking repertoire.', 10, 30, 'Heat the olive oil in a large pot over medium heat. Add the diced shallot and sliced leek, and sauté for 3 minutes until soft and fragrant.\nAdd the cauliflower florets to the pot, pour in the chicken stock and bring to a gentle simmer. Cover and cook until the cauliflower is very tender, about 20-25 minutes.\nUsing an immersion blender, blend until smooth and creamy. If the soup feels too thick, add a bit of water. If using a countertop blender, blend the soup in small batches and return it to the pot afterwards.\nIn a small bowl, whisk together the heavy cream and egg yolks. Slowly add a ladle of hot soup to the mixture, whisking constantly to temper the eggs. Gradually stir the cream-egg mixture back into the soup. Continue heating the soup, stirring constantly, until slightly thickened. Add salt and freshly ground pepper to taste, if required.\nFor serving, ladle the soup into individual serving bowls and garnished with a sprinkle of chervil or parsley leaves.', 6, 'Medium', 1, '1 tbsp (15ml) extra virgin olive oil\n1 leek, white part only (about 100g), cleaned and sliced\n1 shallot, peeled and diced\n1 large cauliflower (about 1kg/2.2lbs), trimmed and cut into florets\n4 cups (1L) chicken stock, low sodium\n1/2 cup (120ml) heavy cream, 35% m.f.\n2 egg yolks, at room temperature\n1 handful chervil or parsley leaves, for garnish', 'https://i0.wp.com/www.pardonyourfrench.com/wp-content/uploads/2024/12/cream-of-cauliflower-soup-8.jpg?fit=1170%2C1753&ssl=1', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (11, 'Chicken Afritada', '(Filipino Stew) Chicken afritada (Filipino stew) is a dish we make back in the Philippines. It\'s really delicious, and you can substitute pork for chicken or mix them both. It\'s great over rice!', 40, 50, 'Heat oil in a large wok over medium heat. Add garlic; cook and stir until fragrant, about 3 minutes. Add onion; cook and stir until translucent, about 5 minutes. Stir in chopped tomatoes; cook, mashing with a fork, until flesh and skin separate, about 5 minutes.\n\nAdd chicken to the wok; cook and stir until lightly browned, about 5 minutes. Pour in water; cover and bring to a boil. Stir in tomato sauce; simmer until flavors combine, about 15 minutes.\n\nAdd potatoes to the wok; simmer until tender, about 10 minutes. Stir in bell pepper and carrot; simmer until softened, about 5 minutes. Season with salt and black pepper.', 6, 'Easy', 2, '1 tablespoon vegetable oil\n\n3 cloves garlic, chopped\n\n1 onion, chopped \n\n1 cup seeded and chopped tomatoes\n\n1 (3 pound) whole chicken, cut into pieces\n\n3 cups water\n\n1 cup tomato sauce (Optional)\n\n3 potatoes, quartered\n\n1 green bell pepper, seeded and cut into matchsticks\n\n1 carrot, chopped \n\nsalt and ground black pepper to taste', 'https://www.allrecipes.com/thmb/6PtH42i9oOLhfd0bAc54hTlvcBs=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/4579268-e59cb5134ebd4910979606b2a68eb532.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (12, 'Lamb Shank Vindaloo', 'I have very little experience cooking Indian food, so that this lamb shank vindaloo came out as deliciously as it did is nothing short of amazing.', 30, 240, 'Whisk cider vinegar, oil, garam masala, tamarind concentrate, and 2 teaspoons salt together in a bowl and pour into a resealable plastic bag. Add lamb shanks, coat with marinade, squeeze out excess air, and seal the bag. Marinate in the refrigerator for 8 hours or overnight.\n\nPreheat the oven to 450 degrees F (230 degrees C). Line a baking sheet with aluminum foil; grease foil.\n\nRemove lamb shanks from marinade; place on the prepared baking sheet and season with salt. Reserve marinade.\n\nRoast in the preheated oven until well-browned, 15 to 20 minutes.\n\nMeanwhile, combine 1 chopped onion, cherry tomatoes, water ginger, and garlic in a blender; blend until smooth. Set aside.\n\nCombine cayenne pepper, paprika, cinnamon, cumin, dried mustard, and 1 teaspoon black pepper in a small bowl.\n\nMelt clarified butter in a large stockpot over medium-high heat. Add remaining 1 chopped onion; cook and stir until softened and well-browned, about 30 minutes. Reduce heat to medium; add cayenne spice mixture. Cook and stir until spices are aromatic, about 2 minutes.\n\nAdd reserved marinade to the stockpot; stir in tomato-onion mixture and brown sugar. Bring to a simmer; add lamb shanks and reduce heat to low. Cover and cook, turning occasionally, until lamb is tender and easily pierced with a fork, 3 to 4 hours.\n\nRemove lamb from the pot; cover with foil. Increase heat; simmer sauce for 3 to 5 minutes, skimming fat from the top. Taste; add salt if needed. Spoon sauce over lamb shanks; garnish with cilantro.', 4, 'Medium', 3, '½ cup apple cider vinegar\n\n¼ cup vegetable oil\n\n1 ½ tablespoons garam masala\n\n1 tablespoon tamarind concentrate\n\n2 teaspoons salt\n\n4 lamb shanks\n\n1 onion, chopped \n\n1 cup cherry tomatoes\n\n½ cup water\n\n⅓ cup sliced fresh ginger\n\n8 cloves garlic, peeled\n\n1 ½ teaspoons cayenne pepper\n\n1 ½ teaspoons paprika\n\n1 teaspoon ground cinnamon \n\n1 teaspoon ground cumin\n\n1 teaspoon ground mustard\n\n1 teaspoon ground black pepper\n\n3 tablespoons ghee (clarified butter)\n\n1 large onion, chopped \n\nsalt and ground black pepper to taste\n\n4 teaspoons brown sugar\n\n½ cup fresh cilantro, for garnish (Optional)', 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1060186.jpg&q=60&c=sc&poi=auto&orient=true&h=512', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (13, 'Black Bean Bowl', 'This black bean breakfast bowl is a quick breakfast if you\'re trying to avoid carbs.', 10, 5, 'Heat olive oil in a small skillet over medium heat. Pour eggs into skillet; cook and stir eggs until set, 3 to 5 minutes.\n\nPlace black beans in a microwave-safe bowl. Microwave at High power until warm, about 1 minute. Divide between two bowls.\n\nDivide scrambled eggs between each bowl; top each with avocado and salsa, then season with salt and black pepper.', 2, 'Easy', 1, '2 tablespoons olive oil\n\n4 eggs, beaten\n\n1 (15 ounce) can black beans, drained and rinsed\n\n1 avocado, peeled and sliced \n\n¼ cup salsa\n\nsalt and ground black pepper to taste', 'https://www.allrecipes.com/thmb/suNrtM9UVwWve2x3T-Xx5pW2EUE=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/5437904-8d54d81d509d489c959e371bd7b6fc99.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (14, 'Strawberry Twinkie', 'This recipe makes a delicious make-ahead dessert using Twinkies, cream cheese, whipped dessert topping, and strawberries.', 15, 30, 'Combine strawberries and glaze in a small bowl.\n\nSlice Twinkies in half lengthwise, and place in a single layer over the bottom of a 9x13-inch dish.\n\nIn a mixing bowl, beat cream cheese and condensed milk until smooth. Fold in whipped topping and spread mixture over Twinkies. Spoon berries over cream cheese mixture. Cover and chill 30 minutes or more. Refrigerate leftovers.', 18, 'Easy', 2, '4 cups sliced fresh strawberries\n\n1 (18 3/4 ounce) can ready-to-use strawberry glaze\n\n8 Twinkies\n\n1 (8 ounce) package cream cheese, softened\n\n1 (14 ounce) can sweetened condensed milk\n\n1 (12 ounce) container frozen whipped topping, thawed', 'https://www.allrecipes.com/thmb/MNA_kzGcFHF9Yi-Cp6Lz3ioM26Q=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/438007-b15a68767ebf4a2e86cf18296bdb98b8.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (15, 'Spicy Avocado', 'This fresh, fast, and easy snack is heart-healthy and delicious. I have tried lemon, lime, orange, grapefruit, Meyer lemon, key limes and Satsuma juices and I like good \'ol fashioned lemon the best, but please experiment to your own tastes!', 10, 0, 'Slice the meat of each avocado half 3 or 4 times in one direction, turn avocado and slice 3 or 4 more slices perpendicular to the first slices creating 8 to 12 small cubes still attached to the peel.\n\nDrizzle lemon juice over each avocado and top with kosher salt. Drizzle hot sauce over each. Eat with a fork or spoon.', 2, 'Easy', 3, '1 cup ripe avocado, halved and pitted \n\n½ lemon, juiced\n\n2 tablespoons hot sauce (such as Valentina®), or to taste\n\n2 pinches kosher salt', 'https://www.allrecipes.com/thmb/KhwrLSvmQFeVRhaKmMD3Cq-1AGo=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/4096750-spicy-avocado-snack-Buckwheat-Queen-4x3-1-ae022336a270404e9bb172181a6bf353.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (16, 'Burger King Foot Lettuce', 'The last thing you\'d want in your Burger King burger is someone\'s foot fungus. But as it turns out, that might be what you get. A 4channer uploaded a photo anonymously to the site showcasing his feet in a plastic bin of lettuce. With the statement: \"This is the lettuce you eat at Burger King.\" Admittedly, he had shoes on.', 2, 0, '1. Step on lettuce 2. Stir lettuce with feet 3. Serve to the rude customer', 1, 'Hard', 1, 'Lettuce, Feet', 'https://external-preview.redd.it/rtoe2W6F9VO8VQePrKcZpb5_lRZpJrr7sGftefhaUwI.jpg?width=1080&crop=smart&auto=webp&s=4c0f670786a4856d39eb1fd75800d76bb1042fc3', '2025-01-15', '2025-01-15', 1);

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
INSERT INTO `meal_type` (`id`, `name`, `description`) VALUES (5, 'Dessert', 'Dessert');

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (1, 1, 'Dinner with Dad', '2025-01-12', '2025-01-14', NULL, 3, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (2, 2, 'Super Bowl Party', '2025-01-12', '2025-01-14', NULL, 2, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (3, 3, 'Fast Dinner', '2025-01-14', '2025-01-14', NULL, 3, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (4, 1, 'Game Night', '2025-01-14', '2025-01-14', NULL, 2, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (5, 2, 'Healthy Lunch', '2025-01-14', '2025-01-14', NULL, 2, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (6, 3, 'Dinner with Neighbors', '2025-01-14', '2025-01-14', NULL, 3, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (7, 1, 'Cheat Meal', '2025-01-14', '2025-01-14', NULL, 3, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (8, 2, 'Bobby\'s Lunch', '2025-01-14', '2025-01-14', NULL, 2, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (9, 3, 'Work Lunch', '2025-01-14', '2025-01-14', NULL, 2, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (10, 1, 'Family Dinner', '2025-01-14', '2025-01-14', NULL, 3, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (11, 2, 'Snowed in Dinner', '2025-01-14', '2025-01-14', NULL, 3, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (12, 3, 'Movie Night', '2025-01-14', '2025-01-14', NULL, 3, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (13, 1, 'Post Workout Breakfast', '2025-01-14', '2025-01-14', NULL, 1, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (14, 2, 'Sarah\'s Birthday Dinner', '2025-01-14', '2025-01-14', NULL, 5, NULL, 1);
INSERT INTO `meal` (`id`, `user_id`, `name`, `create_date`, `last_update`, `notes`, `meal_type_id`, `image_url`, `enabled`) VALUES (15, 3, 'Work Snack', '2025-01-14', '2025-01-14', NULL, 4, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meal_has_recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (1, 1);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (2, 2);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (3, 3);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (4, 4);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (5, 5);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (6, 6);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (7, 7);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (8, 8);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (9, 9);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (10, 10);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (11, 11);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (12, 12);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (13, 13);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (14, 14);
INSERT INTO `meal_has_recipe` (`meal_id`, `recipe_id`) VALUES (15, 15);

COMMIT;


-- -----------------------------------------------------
-- Data for table `plan_meal`
-- -----------------------------------------------------
START TRANSACTION;
USE `noforksdb`;
INSERT INTO `plan_meal` (`id`, `plan_id`, `meal_id`, `meal_type_id`, `day_number`, `notes`) VALUES (1, 1, 1, 1, 1, 'random note');
INSERT INTO `plan_meal` (`id`, `plan_id`, `meal_id`, `meal_type_id`, `day_number`, `notes`) VALUES (2, 2, 1, 1, 2, 'another note');

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
INSERT INTO `cuisine` (`id`, `name`, `description`, `image_url`) VALUES (10, 'Indian', 'Indian', NULL);
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
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (1, 2);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (2, 2);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (3, 3);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (4, 1);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (5, 4);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (6, 5);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (7, 8);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (8, 11);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (9, 6);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (10, 7);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (11, 9);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (12, 10);

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
INSERT INTO `meal_comment` (`id`, `comments`, `create_date`, `user_id`, `in_reply_to_id`, `meal_id`) VALUES (2, 'Takes a little longer than told', '2025-01-12', 2, 1, 2);

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
INSERT INTO `favorite_meal` (`user_id`, `meal_id`) VALUES (1, 9);
INSERT INTO `favorite_meal` (`user_id`, `meal_id`) VALUES (2, 5);
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

