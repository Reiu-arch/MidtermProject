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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `email`, `create_date`, `last_update`, `profile_image_url`, `biography`) VALUES (2, 'DwightS', 'beets', 1, 'Member', NULL, '2025-01-10', '2025-01-10', 'https://img.nbc.com/files/images/2013/11/12/dwight-500x500.jpg', 'My name is Dwight Schrute, and I live in Scranton, Pennsylvania. I work as the Assistant Regional Manager at Dunder Mifflin, a paper supply company where I’m known for my strong work ethic and no-nonsense approach. I’ve earned my reputation through hard work, dedication, and a fierce commitment to being the best in everything I do. I’m competitive by nature, and I don’t shy away from taking bold steps to ensure success.\n\nWhen I’m not working at Dunder Mifflin, I run Schrute Farms, a bed-and-breakfast I inherited from my family. The farm is not only a business for me but a deeply personal project. I grow beets, and I take great pride in the quality of my crops. It’s a simple, honest life, and I manage the farm with my cousin Mose, who shares my commitment to maintaining tradition.\n\nIn addition to farming, I’m an expert in various fields like security, survival tactics, and business management. I have a broad range of skills, and I enjoy putting them to use in both my personal and professional life. I may come off as serious or even intense at times, but I’m also known for my dry humor and my strong sense of loyalty to those I care about—especially when it comes to my colleagues and friends. I might not show it often, but I value relationships deeply.\n\nPeople may find me eccentric, but that’s just part of who I am. My life is about efficiency, discipline, and following my own path, and I wouldn’t have it any other way.');
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
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (7, 'Schnitzel with Mushroom Gravy', 'This German Schnitzel with Mushroom Gravy is so flavorful and easy to make, even on a busy weeknight. Use veal, pork, or chicken...pound the cutlet out thin...bread, whip up the sauce, quick fry...and you are set! So delicious!', 20, 12, 'MUSHROOM GRAVY\nHeat the olive oil over medium-high heat in a medium skillet\nAdd the butter\nAdd the garlic and saute for about 1 minute.\nAdd the onion and cook for another 4 minutes, or until translucent.\nAdd the mushrooms and cook until they start to release liquid, about 4 minutes.\nAdd the flour and stir to incorporate.\nAdd the wine, stirring to combine. Cook until the wine reduces down, about 4 minutes.\nAdd the stock, and stir frequently . The sauce will start to thicken over the next 5 minutes.\nStir in the mustard, Worcestershire sauce.\nSeason with salt and pepper.\nKeep warm:  SCHNITZEL\nHeat the oil in a large, sturdy skillet over medium-high heat.\nPound the cutlet between wax paper, or in a large freezer bag, by using the side of a meat tenderizer. Pound down to about 1/8\". Trim any jagged sides, and/or excess fat.\nPlace the flour in one medium-sized bowl.\nPlace the eggs in another bowl and gently mix together. Mix in another 2 tablespoons of water.\nIn a third bowl, mix together the bread crumbs, salt, pepper, paprika and caraway seeds.\nDredge each cutlet in the flour, then dip in the egg wash (shake off excess), then dredge in the bread crumb mixture.\nFry each cutlet (don\'t overcrowd the pan) for about 4 minutes per side, or until golden brown.\nServe with gravy poured over top and garnished with lemon wedges and parsley.', 4, 'Medium', 3, 'MUSHROOM GRAVY 2 tbsp olive oil ▢2 tbsp unsalted butter ▢1/2 onion, chopped ▢1 clove garlic, minced ▢8 oz. cremeni mushrooms sliced ▢1/4 cup all-purpose flour ▢1/2 cup white wine ▢2 1/2 cups beef stock ▢1 tbsp whole grain mustard ▢1 tbsp Worcestershire sauce ▢Salt and pepper to taste (about 1/4 teaspoon each) SCHNITZEL ▢Vegetable oil for pan frying (about 2 cups) ▢4 boneless pork chops about 16 ounces, total ▢1 cup all-purpose flour ▢2 large eggs plus two tablespoons of water ▢1 cup dried bread crumbs not seasoned ▢1 tsp Kosher salt ▢1 tsp freshly ground black pepper ▢1 tsp smoked paprika ▢1/2 tsp caraway seeds ▢Lemon wedges, for garnish ▢Flat-leaf parsley, chopped, for garnish MUSHROOM GRAVY ▢2 tbsp olive oil ▢2 tbsp unsalted butter ▢1/2 onion, chopped ▢1 clove garlic, minced ▢8 oz. cremeni mushrooms sliced ▢1/4 cup all-purpose flour ▢1/2 cup white wine ▢2 1/2 cups beef stock ▢1 tbsp whole grain mustard ▢1 tbsp Worcestershire sauce ▢Salt and pepper to taste (about 1/4 teaspoon each) SCHNITZEL ▢Vegetable oil for pan frying (about 2 cups) ▢4 boneless pork chops about 16 ounces, total ▢1 cup all-purpose flour ▢2 large eggs plus two tablespoons of water ▢1 cup dried bread crumbs not seasoned ▢1 tsp Kosher salt ▢1 tsp freshly ground black pepper ▢1 tsp smoked paprika ▢1/2 tsp caraway seeds ▢Lemon wedges, for garnish ▢Flat-leaf parsley, chopped, for garnish ', 'https://howtofeedaloon.com/wp-content/uploads/2015/06/Schnitzel-1-2-1270x1904.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (8, 'Greek Salad with Griled Steak', 'This Greek Salad with Grilled Steak brings together two of our favorites things in the world...a Greek salad and beautifully grilled skirt steak. Marinate the steak first for about 4 hours (or overnight), then marinate the feta cheese, then assemble this amazing entree salad. Incredible!', 25, 10, 'Marinate the Steak\nIn a medium bowl, whisk together 3 tablespoons of the oil with the garlic, oregano, vinegar, Worcestershire sauce, salt, and pepper. Place the steak in a large plastic baggie, or in a small baking dish. Pour the marinade over the steak and turn the meat until it is fully coated. Seal and place in the refrigerator for at least 4 hours and up to overnight. Marinate the Cheese and Prepping the Salad\nPlace the cheese into a large bowl. Mix in the cheese marinade ingredients and chill in the fridge until ready to finish assembling the salad.\nIn a separate bowl, mix together the parsley, tomatoes, cucumbers, capers, olives, and red onion. Cover with plastic wrap and set aside. Cook the Steak\nPrepare a medium-high hot grill.\nRemove the steaks from the marinade and grill for approx. 5 minutes per side, or until an internal temperature of 145°F (medium) is reached. Place on a cutting board and loosely tent with a piece of foil for about 10 minutes. Cutting with the grain, slice the steak into two or three pieces about 3 inches in length. Turn the pieces 90° and cut against the grain into bite-sized strips.\nAssemble the Salad\nRemove the large bowl with the marinated cheese from the refrigerator. Mix in the cucumber salad and the chopped romaine.\nTransfer the salad to a large serving platter and use a spatula to place the sliced steak on top. Serve at once.', 6, 'Easy', 2, 'For Marinating the Steak 3 tbsp extra-virgin olive oil 3 cloves garlic roughly chopped 1 tbsp dried oregano 2 tbsp red wine vinegar 1 tbsp Worcestershire sauce ¾ tsp Kosher salt ½ tsp black pepper freshly ground 1 lb skirt steak or flap, or ribeye For Marinating the Cheese 8 oz feta cheese crumbled 3 tbsp extra-virgin olive oil 2 tbsp red wine vinegar 1 tbsp oregano dried ¼ tsp crushed red pepper flakes ½ tsp Kosher salt ¼ tsp black pepper freshly ground For the Salad 2 tbsp fresh flat-leaf parsley chopped 1 medium cucumber halved, seeds removed and roughly chopped 1 cup cherry tomatoes halved 1 2.75 oz capers drained, about ½ cup ½ cup Kalamata olives pitted, halved ½ cup red onion chopped 2 cups Romaine lettuce chopped', 'https://howtofeedaloon.com/wp-content/uploads/2016/07/greek-salad-4.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (9, 'Beef Bulgogi Lettuce Wraps', 'These Korean-style lettuce wraps are unbelievably delicious. The marinade for the bulgogi can be made well in advance, as can the pickled veggies and BBQ sauce. Not only is the dish incredibly flavorful, but it\'s fun to serve it buffet-style and let guests build their own wraps to their own liking!', 30, 15, 'Prepare the Bulgogi\nWrap the meat in plastic wrap and place it in the freezer for 30 minutes to 1 hour. Remove the meat from the freezer, and using a sharp knife, cutting against the grain, slice it into thin pieces. Place in a large bowl.\nPlace the onion, pear, garlic, ginger, green onion, soy sauce, oil, brown sugar, honey, and pepper in a blender. Purée until smooth. Pour the marinade over the meat and use a wooden spatula to stir the meat until fully coated by the marinade. Cover with plastic wrap and refrigerate for 1 to 2 hours, or overnight.\nHeat a large skillet or wok over high heat. Use tongs to lift the meat from the marinade in the bowl, shaking off excess marinade. Add the hot skillet or wok and cook, stirring often, until fully cooked and dark brown in spots, about 15 minutes. Most of the excess liquid should cook off.\nAssemble the Lettuce Wraps\nMound the lettuce leaves on a plate and place all the garnishes in bowls. Place several strips of the bulgogi on top of a lettuce wrap, then top with pickled carrots and cucumbers, sliced peppers (if using), a drizzle of BBQ sauce, and topped with a pinch of sesame seeds. Repeat with remaining lettuce wraps and serve at once. Or, allow guests to build their own wraps. Korean BBQ Sauce\nMix all the ingredients in a small/medium bowl and set aside. If not using immediately, cover with plastic wrap and refrigerate until ready to use. ', 4, 'Easy', 3, 'Ingredients\n2 medium carrots peeled and julienne cut (or shredded) -\n1 cucumber seeded and cut into 1-inch sticks\n¾ cup apple cider vinegar\nFor the Bulgogi\n1 lb beef ribeye or skirt steak works well\n1 medium onion peeled and quartered\n1 Asian pear peeled, cored and roughly chopped (Anjou pear works, too)\n4 cloves garlic minced\n1 tbsp fresh ginger roughly chopped\n1 green onion chopped\n2 tbsp soy sauce\n1 tbsp sesame oil\n1 tbsp brown sugar\n1 tbsp honey\n½ tsp black pepper\nFor the Lettuce Wraps\nLettuce leaves green leaf, or iceberg work well, trimmed\nPeppers sliced, for garnish, optional\n2 sesame seeds for garnish\nFor the Korean BBQ Sauce\n2 tbsp gochujang 1 tbsp for less heat\n1 tbsp sesame oil\n1 tsp sugar\n1 tbsp water\n1 tsp apple cider vinegar\n1 clove garlic minced', 'https://howtofeedaloon.com/wp-content/uploads/2024/05/Beef-Bulgogi-Lettus-Wraps-on-black-plate-770x1157.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (10, 'Cream of Cauliflower Soup', '(Creme du Barry) When the chill of winter sets in, few dishes comfort me like this Cream of Cauliflower Soup. Known in French as “Crème du Barry”, this recipe is steeped in royal origin. This classic French recipe is made with a whole cauliflower head mixed with heavy cream and aromatics. Velvety smooth and deeply flavorful, it’s a lighter, vegetable-forward soup that deserves a place in every French cooking repertoire.', 10, 30, 'Heat the olive oil in a large pot over medium heat. Add the diced shallot and sliced leek, and sauté for 3 minutes until soft and fragrant.\nAdd the cauliflower florets to the pot, pour in the chicken stock and bring to a gentle simmer. Cover and cook until the cauliflower is very tender, about 20-25 minutes.\nUsing an immersion blender, blend until smooth and creamy. If the soup feels too thick, add a bit of water. If using a countertop blender, blend the soup in small batches and return it to the pot afterwards.\nIn a small bowl, whisk together the heavy cream and egg yolks. Slowly add a ladle of hot soup to the mixture, whisking constantly to temper the eggs. Gradually stir the cream-egg mixture back into the soup. Continue heating the soup, stirring constantly, until slightly thickened. Add salt and freshly ground pepper to taste, if required.\nFor serving, ladle the soup into individual serving bowls and garnished with a sprinkle of chervil or parsley leaves.', 6, 'Medium', 1, '1 tbsp (15ml) extra virgin olive oil\n1 leek, white part only (about 100g), cleaned and sliced\n1 shallot, peeled and diced\n1 large cauliflower (about 1kg/2.2lbs), trimmed and cut into florets\n4 cups (1L) chicken stock, low sodium\n1/2 cup (120ml) heavy cream, 35% m.f.\n2 egg yolks, at room temperature\n1 handful chervil or parsley leaves, for garnish', 'https://i0.wp.com/www.pardonyourfrench.com/wp-content/uploads/2024/12/cream-of-cauliflower-soup-8.jpg?fit=1170%2C1753&ssl=1', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (11, 'Chicken Afritada', '(Filipino Stew) Chicken afritada (Filipino stew) is a dish we make back in the Philippines. It\'s really delicious, and you can substitute pork for chicken or mix them both. It\'s great over rice!', 40, 50, 'Heat oil in a large wok over medium heat. Add garlic; cook and stir until fragrant, about 3 minutes. Add onion; cook and stir until translucent, about 5 minutes. Stir in chopped tomatoes; cook, mashing with a fork, until flesh and skin separate, about 5 minutes.\n\nAdd chicken to the wok; cook and stir until lightly browned, about 5 minutes. Pour in water; cover and bring to a boil. Stir in tomato sauce; simmer until flavors combine, about 15 minutes.\n\nAdd potatoes to the wok; simmer until tender, about 10 minutes. Stir in bell pepper and carrot; simmer until softened, about 5 minutes. Season with salt and black pepper.', 6, 'Easy', 2, '1 tablespoon vegetable oil\n\n3 cloves garlic, chopped\n\n1 onion, chopped \n\n1 cup seeded and chopped tomatoes\n\n1 (3 pound) whole chicken, cut into pieces\n\n3 cups water\n\n1 cup tomato sauce (Optional)\n\n3 potatoes, quartered\n\n1 green bell pepper, seeded and cut into matchsticks\n\n1 carrot, chopped \n\nsalt and ground black pepper to taste', 'https://www.allrecipes.com/thmb/6PtH42i9oOLhfd0bAc54hTlvcBs=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/4579268-e59cb5134ebd4910979606b2a68eb532.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (12, 'Lamb Shank Vindaloo', 'I have very little experience cooking Indian food, so that this lamb shank vindaloo came out as deliciously as it did is nothing short of amazing.', 30, 240, 'Whisk cider vinegar, oil, garam masala, tamarind concentrate, and 2 teaspoons salt together in a bowl and pour into a resealable plastic bag. Add lamb shanks, coat with marinade, squeeze out excess air, and seal the bag. Marinate in the refrigerator for 8 hours or overnight.\n\nPreheat the oven to 450 degrees F (230 degrees C). Line a baking sheet with aluminum foil; grease foil.\n\nRemove lamb shanks from marinade; place on the prepared baking sheet and season with salt. Reserve marinade.\n\nRoast in the preheated oven until well-browned, 15 to 20 minutes.\n\nMeanwhile, combine 1 chopped onion, cherry tomatoes, water ginger, and garlic in a blender; blend until smooth. Set aside.\n\nCombine cayenne pepper, paprika, cinnamon, cumin, dried mustard, and 1 teaspoon black pepper in a small bowl.\n\nMelt clarified butter in a large stockpot over medium-high heat. Add remaining 1 chopped onion; cook and stir until softened and well-browned, about 30 minutes. Reduce heat to medium; add cayenne spice mixture. Cook and stir until spices are aromatic, about 2 minutes.\n\nAdd reserved marinade to the stockpot; stir in tomato-onion mixture and brown sugar. Bring to a simmer; add lamb shanks and reduce heat to low. Cover and cook, turning occasionally, until lamb is tender and easily pierced with a fork, 3 to 4 hours.\n\nRemove lamb from the pot; cover with foil. Increase heat; simmer sauce for 3 to 5 minutes, skimming fat from the top. Taste; add salt if needed. Spoon sauce over lamb shanks; garnish with cilantro.', 4, 'Medium', 3, '½ cup apple cider vinegar\n\n¼ cup vegetable oil\n\n1 ½ tablespoons garam masala\n\n1 tablespoon tamarind concentrate\n\n2 teaspoons salt\n\n4 lamb shanks\n\n1 onion, chopped \n\n1 cup cherry tomatoes\n\n½ cup water\n\n⅓ cup sliced fresh ginger\n\n8 cloves garlic, peeled\n\n1 ½ teaspoons cayenne pepper\n\n1 ½ teaspoons paprika\n\n1 teaspoon ground cinnamon \n\n1 teaspoon ground cumin\n\n1 teaspoon ground mustard\n\n1 teaspoon ground black pepper\n\n3 tablespoons ghee (clarified butter)\n\n1 large onion, chopped \n\nsalt and ground black pepper to taste\n\n4 teaspoons brown sugar\n\n½ cup fresh cilantro, for garnish (Optional)', 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F1060186.jpg&q=60&c=sc&poi=auto&orient=true&h=512', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (13, 'Black Bean Bowl', 'This black bean breakfast bowl is a quick breakfast if you\'re trying to avoid carbs.', 10, 5, 'Heat olive oil in a small skillet over medium heat. Pour eggs into skillet; cook and stir eggs until set, 3 to 5 minutes.\n\nPlace black beans in a microwave-safe bowl. Microwave at High power until warm, about 1 minute. Divide between two bowls.\n\nDivide scrambled eggs between each bowl; top each with avocado and salsa, then season with salt and black pepper.', 2, 'Easy', 1, '2 tablespoons olive oil\n\n4 eggs, beaten\n\n1 (15 ounce) can black beans, drained and rinsed\n\n1 avocado, peeled and sliced \n\n¼ cup salsa\n\nsalt and ground black pepper to taste', 'https://www.allrecipes.com/thmb/suNrtM9UVwWve2x3T-Xx5pW2EUE=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/5437904-8d54d81d509d489c959e371bd7b6fc99.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (14, 'Strawberry Twinkie', 'This recipe makes a delicious make-ahead dessert using Twinkies, cream cheese, whipped dessert topping, and strawberries.', 15, 30, 'Combine strawberries and glaze in a small bowl.\n\nSlice Twinkies in half lengthwise, and place in a single layer over the bottom of a 9x13-inch dish.\n\nIn a mixing bowl, beat cream cheese and condensed milk until smooth. Fold in whipped topping and spread mixture over Twinkies. Spoon berries over cream cheese mixture. Cover and chill 30 minutes or more. Refrigerate leftovers.', 18, 'Easy', 2, '4 cups sliced fresh strawberries\n\n1 (18 3/4 ounce) can ready-to-use strawberry glaze\n\n8 Twinkies\n\n1 (8 ounce) package cream cheese, softened\n\n1 (14 ounce) can sweetened condensed milk\n\n1 (12 ounce) container frozen whipped topping, thawed', 'https://www.allrecipes.com/thmb/MNA_kzGcFHF9Yi-Cp6Lz3ioM26Q=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/438007-b15a68767ebf4a2e86cf18296bdb98b8.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (15, 'Spicy Avocado', 'This fresh, fast, and easy snack is heart-healthy and delicious. I have tried lemon, lime, orange, grapefruit, Meyer lemon, key limes and Satsuma juices and I like good \'ol fashioned lemon the best, but please experiment to your own tastes!', 10, 0, 'Slice the meat of each avocado half 3 or 4 times in one direction, turn avocado and slice 3 or 4 more slices perpendicular to the first slices creating 8 to 12 small cubes still attached to the peel.\n\nDrizzle lemon juice over each avocado and top with kosher salt. Drizzle hot sauce over each. Eat with a fork or spoon.', 2, 'Easy', 3, '1 cup ripe avocado, halved and pitted \n\n½ lemon, juiced\n\n2 tablespoons hot sauce (such as Valentina®), or to taste\n\n2 pinches kosher salt', 'https://www.allrecipes.com/thmb/KhwrLSvmQFeVRhaKmMD3Cq-1AGo=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/4096750-spicy-avocado-snack-Buckwheat-Queen-4x3-1-ae022336a270404e9bb172181a6bf353.jpg', '2025-01-14', '2025-01-14', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (16, 'Burger King Foot Lettuce', 'The last thing you\'d want in your Burger King burger is someone\'s foot fungus. But as it turns out, that might be what you get. A 4channer uploaded a photo anonymously to the site showcasing his feet in a plastic bin of lettuce. With the statement: \"This is the lettuce you eat at Burger King.\" Admittedly, he had shoes on.', 2, 0, '1. Step on lettuce 2. Stir lettuce with feet 3. Serve to the rude customer', 1, 'Hard', 1, 'Lettuce, Feet', 'https://external-preview.redd.it/rtoe2W6F9VO8VQePrKcZpb5_lRZpJrr7sGftefhaUwI.jpg?width=1080&crop=smart&auto=webp&s=4c0f670786a4856d39eb1fd75800d76bb1042fc3', '2025-01-15', '2025-01-15', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (17, 'Sausage Rolls', 'Buttery, flaky pastries filled with a juicy, flavorful sausage center.', 10, 40, 'Preheat the oven to 400°F. Line a large rimmed baking sheet with parchment paper and set aside.\n\nIn a medium skillet, cook the onion and butter over medium heat until softened, about 4 minutes. Add the garlic and cook 1 minute more. Cool completely.\nIn a medium bowl, add the raw sausage, the cooled onion mixture, bread crumbs, parsley, salt, and one large egg. Mix well.\nRoll each sheet of puff pastry into a 10 x 12-inch rectangle on a lightly floured surface. Cut each in half so you have four 5 x 12-inch rectangles.\nSpoon ¼ of the pork mixture down the length of each sheet of puff pastry.\nBeat the remaining egg in a small bowl.\nRoll the pastry around the sausage to form a log, brushing the edge with egg to seal. Pinch the seam closed.\nCut each log into 4 pieces, 3 inches long and place seam-side down on the prepared baking sheet.\nBrush each with the remaining egg mixture.\nBake the sausage rolls for 20 to 22 minutes or until the pastry is golden brown and the filling reaches 165°F.\nCool 5 minutes before serving.', 16, 'Medium', 2, '17.3 ounces puff pastry 1 box\n½ medium onion diced\n1 tablespoon salted butter\n1 clove garlic minced\n1 pound ground pork sausage\n2 tablespoons chopped fresh parsley\n⅛ teaspoon salt\n⅓ cup seasoned bread crumbs\n 2 large eggs divided', 'https://andreabuckett.com/wp-content/uploads/2024/09/Easy-Sausage-Rolls-Andrea-Buckett.webp', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (18, 'Boursin Omelet', 'This Boursin omelet is a quick, luxurious breakfast that brings creamy texture and rich flavor to the classic omelet. Finish with a sprinkle of chives for a fresh pop of color.', 10, 5, 'Whisk eggs, water, salt, and pepper together in a bowl until yolks and whites are completely combined and eggs are light and frothy, about 30 seconds.\n\nMelt butter in an 8-inch nonstick skillet over medium heat. Pour eggs into skillet and stir rapidly for 20 to 30 seconds until eggs are just starting to set. Spread top of eggs in an even layer and let cook until just slightly underdone and shiny. If necessary, move extra raw egg around to the edges of the skillet. Lower heat to medium-low to prevent browning, if necessary.\n\nSprinkle cheese down the middle of the omelet, along with 2 teaspoons chives. Fold one side over the cheese in the middle, followed by the other side, so the omelet is folded in thirds. Remove to a plate and sprinkle with remaining chives.\n', 1, 'Easy', 3, '3 large eggs\n\n1 teaspoon water\n\nsalt and freshly ground black pepper to taste\n\n1 tablespoon butter\n\n1 tablespoon minced fresh chives\n\n1 ounce soft French cheese, such as Boursin® cheese (any flavor), crumbled', 'https://www.allrecipes.com/thmb/pd0WEg9iGWOHui2haXGXucP31IQ=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8750293_Boursin-Omelet_France-Cevallos_4x3-e54c0f9b169a4518a77539c9a12011b8.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (19, 'Breakfast Chilaquiles', 'These chilaquiles are a stunning Mexican breakfast of crisp tortilla chips in a traditional salsa roja, topped with a fried egg, crema, and avocado.', 20, 20, 'For salsa roja, pour boiling water over peppers and let sit until softened, 15 to 30 minutes.\n\nMeanwhile, add 2 tablespoons olive oil to a skillet over high heat, and sear tomatoes, onions, and garlic until charred for about 2 minutes.\n\nPlace softened peppers, charred vegetables, and 1 cup of the chile soaking water in a blender. Reserve remaining 3 cups chile water.  Blend until smooth. Strain the sauce; pour back into the pan.\n\nCook sauce over medium heat, scraping any charred bits from the bottom of the pan; add 2 cups of remaining chile water. Simmer until sauce is reduced by 1/3. Stir in bouillon cube and last 1 cup chile water, culantro leaves, lime juice; stir until bouillon cube dissolves. Season with salt and pepper.\n\nFor chilaquiles, heat oil to 350 degrees F ( 175 degrees C) in a large saucepan over medium heat. Add tortillas and fry until crisp and golden. 2 minutes per batch.\n\nFor each serving, heat 1 tablespoon oil in a small nonstick pan over medium heat. Crack an egg into the skillet, and cook until outer edges become opaque, about 1 minute. Turn egg over and cook until whites are completely opaque, 1 to 2 minutes more.\n\nAdd a handful of chips to the salsa roja, and turn to coat completely. Remove to a serving plate with a slotted spoon.\n\nDrizzle with crema, top with an egg, cotija cheese, avocado, cilantro, squeeze of lime juice, and drizzle with more salsa roja. Sprinkle with oregano. Repeat with remaining ingredients.', 4, 'Medium', 1, 'Salsa Roja\n\n3 guajillo chile peppers, seeds removed\n\n1 ancho chile pepper, seeds removed\n\n4 cups boiling water\n\n4 Roma tomatoes, quartered\n\n1 white onion, quartered\n\n3 garlic cloves, peeled\n\n2 tablespoons olive oil\n\n1 beef bouillon cube\n\n2 culantro leaves\n\n1 lime, juiced\n\nsalt and freshly ground black pepper to taste\n\nChilaquiles\n\n2 1/4 cups oil, divided\n\n12 soft corn tortillas, cut into 8 wedges each\n\n4 large eggs\n\n1/4 cup Mexican crema, or as needed\n\n1/2 cup crumbled cotija cheese\n\n1 avocado, sliced, or to taste\n\n1/4 cup cilantro leaves, or to taste\n\n1 lime, quartered\n\n1/4 teaspoon Mexican oregano, or to taste\n\nLocal Offers\ndenver, CO 80203 \nChange\n\nInstacart logo\nWalmart logo\nKing Soopers logo\nTarget logo\nWhole Foods Market logo\nInstacart logo\nWalmart logo\n\n\nBuy all 17 ingredients from this recipe for $35.72\n\nAdd to\n', 'https://www.allrecipes.com/thmb/bGPoJ9dFwJNCUBiCpb7Fy12yCHI=/0x512/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8739658_Roscoes-Chilaquiles_Dotdash-Meredith-Food-Studios_4x3.1-8dfcb19b9a7c4660b3e516e0caaf9357.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (20, 'Granola Cups', 'These granola cups are a great grab-and-go breakfast option. You can tailor them to suit your own tastes—flavor them with the spices you prefer, swap out almonds for another nut, and use any kind of yogurt or fruit that you enjoy. For best results, wait until just before serving to fill them with yogurt.', 25, 30, 'Place butter and maple syrup in a large bowl and place into the microwave. Heat in 30 second intervals, stirring after every 30 seconds, until butter is melted, about 1 to 1 1/2 minutes. Remove bowl from microwave and add in vanilla, cinnamon, salt, and nutmeg. Stir until thoroughly combined. Add in oats, almonds, coconut, and flax meal. Stir until mixture is thoroughly combined.\n\nGenerously grease a standard muffin tin with nonstick baking spray with flour.\n\nDivide oat mixture evenly between the muffin cups, about 2 heaped tablespoons per cup. With wet hands, press mixture into the bottom and up the sides of each cup. Place the pan into the fridge to chill for 15 minutes.\n\nPreheat the oven to 350 degrees F (175 degrees C).\n\nBake chilled granola cups in the preheated oven until the outside edges of cups turn golden brown,  25 to 30 minutes. Remove cups from the oven; cool to room temperature in the pan, about 30 minutes.\n\nUse an offset spatula or butter knife to pop them out of the pan. To serve, fill each granola cup with yogurt and top with berries. Serve immediately.', 12, 'Easy', 2, '1/4 cup unsalted butter\n\n1/2 cup pure maple syrup\n\n1 teaspoon vanilla extract\n\n1/2 teaspoon ground cinnamon\n\n1/4 teaspoon salt, or to taste\n\n1/4 teaspoon ground nutmeg\n\n2 cups old fashioned oats\n\n1/2 cup sliced almonds\n\n1/2 cup sweetened flaked coconut\n\n2 tablespoons flax meal\n\nnonstick baking spray with flour (such as Baker\'s Joy®)\n\n1 cup plain whole milk Greek yogurt, or as needed\n\n1 cup fresh berries, or as needed', 'https://www.allrecipes.com/thmb/SCKYF5l12KoETALgkPV9tx22fFE=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8669258_Granola-Cups_Kim-Shupe_4x3-6f6e657c112b416b9e610c89a2999fde.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (21, 'Goat Cheese Stuffed Dates', 'These irresistible goat cheese stuffed dates combine the sweet chewiness of Medjool dates with the creamy tang of garlic and herb goat cheese, all wrapped in smoky bacon and crisped to perfection. Do not use thick-cut bacon as it will not cook properly.', 20, 20, 'Preheat the oven to 400 degrees F (200 degrees C). Line a baking sheet with parchment paper.\n\nUsing a paring knife, cut each date lengthwise through to the middle and remove pit. Stuff each date with goat cheese, then press 4 to 5 pine nuts into the cheese. Wrap each date with a piece of bacon and secure with a toothpick. Bacon should wrap around each date about 1 1/2 times. Place on the prepared baking sheet.\n\nBake in the preheated oven until bacon is nearly done, 15 to 17 minutes.\n\nTurn on the broiler and place a rack 6 inches from heat. Broil dates until bacon is browned and slightly crispy, 1 to 2 minutes. Remove from oven and place on a serving platter; drizzle dates with balsamic glaze.', 14, 'Easy', 3, '14 Medjool dates\n\n4 ounces garlic and herb goat cheese, softened\n\n1 tablespoon pine nuts, or as needed\n\n7 slices bacon, cut in half crosswise\n\n14 toothpicks\n\n1/4 cup balsamic glaze', 'https://www.allrecipes.com/thmb/Q9OIolZTpE0S6RYYciH-qNDUZIA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8759685_Goat-Cheese-Stuffed-Dates_France-Cevallos_4x3-51fb769abf81492bac00517bafae1db0.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (22, 'Beef and Bean Tiny Tacos', 'These beef and bean tiny tacos are made with round corn chips, filled and folded around taco-seasoned beef and refried beans, a super fun party snack.', 20, 5, 'Preheat the oven to 350 degrees F (175 degrees C).\n\nHeat a large skillet over medium-high heat. Add beef and cook while crumbling with a spatula and stirring occasionally until browned, about 5 minutes. Add taco seasoning and water and stir, using a wooden spoon to scrape up any browned bits from the bottom. Cook, stirring occasionally, until meat is well coated in seasoning. Remove from heat and set aside.\n\nArrange whole chips on the bottom of 2 rimmed baking sheets. Spread each chip evenly with a thin layer of refried beans. Top evenly with taco meat and cheese. \n\nBake in the preheated oven until cheese is melted, 5 to 7 minutes.  \n\nAs soon as chips are baked, carefully fold each chip in half to form a taco shape. Place tacos on a serving platter with taco sauce for dipping.', 12, 'Medium', 1, '1 pound ground beef\n\n1 packet taco seasoning\n\n1/2 cup water\n\n48 round corn tortilla chips, from 1 (11 ounce) bag\n\n1 (14 ounce) can refried beans\n\n8 ounces shredded Mexican blend cheese\n\n1/4 cup finely chopped cilantro\n\n1/4 cup taco sauce for dipping, or as needed', 'https://www.allrecipes.com/thmb/USlmLou236zf7dZn4cJXPS1dT-4=/0x512/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8727881_Beef-and-Bean-Tiny-Tacos_Dotdash-Meredith-Food-Studios_4x3-a73903e734a44be8bfe80d7bccfd97f1.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (23, 'Grate Apple Crisp', 'With a luxurious texture and a flavor that approaches apple butter, Chef John\'s apple crisp is truly delicious. It also skips the tedious peeling, coring, and slicing step. You\'ll definitely want a small scoop of vanilla ice cream on top.', 15, 60, 'Preheat the oven to 375 degrees F (190 degrees C). Generously grease a shallow 2-quart baking dish with 2 tablespoons butter, and set aside.\n\nGrate apples into a bowl, and add lemon juice, cinnamon, cornstarch, white sugar, and brown sugar. Mix thoroughly, and transfer into the prepared baking dish.\n\nAdd oats, Grape Nuts, flour, white sugar, brown sugar, and melted butter into the bowl used for the apples, and stir thoroughly until everything is evenly coated with melted butter; spread mixture evenly over the apples. \n\nBake in the preheated oven until the apple layer has thickened,  is bubbling around the sides, and topping is golden brown, about 1 hour.\n\nRemove and let cool to warm before serving, or chill before serving if you prefer.', 8, 'Medium', 2, 'Apples\n\n2 tablespoons unsalted butter, softened\n\n6 apples\n\n1 lemon, juiced\n\n1/4 teaspoon ground cinnamon\n\n1/2 teaspoon cornstarch\n\n1/3 cup white sugar\n\n1/3 cup packed brown sugar\n\nTopping\n\n1/2 cup rolled oats\n\n1/2 cup Grape Nuts® cereal\n\n1/2 cup all-purpose flour\n\n1/4 cup white sugar\n\n1/4 cup brown sugar\n\n1/2 cup melted butter', 'https://www.allrecipes.com/thmb/RlQD7a2vD5uHVAA7t61ZtC0L1iQ=/0x512/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8727014_Grate-Apple-Crisp_John-Mitzewich_4x3-696dc975443f40e699ecd784d94fb5d7.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (24, 'Cottage Cheese Blueberry Cake', 'This cottage cheese blueberry breakfast cake is a lemony loaf cake studded with a full pint of fresh blueberries. It\'s a perfect not-too-sweet breakfast or snack cake.', 15, 60, 'Gather all ingredients. Preheat the oven to 350 degrees F (180 degrees C). Grease a 9x5-inch loaf pan. Line pan with parchment paper, leaving a 2-inch overhang.   Whisk together 1 1/4 cup all-purpose flour, whole wheat flour, baking powder, and salt in a large bowl. Combine cottage cheese, honey, oil, lemon zest and juice, and vanilla in a blender container. Cover and blend until smooth.   Stir eggs into cottage cheese mixture. Add cottage cheese mixture to flour mixture; stir to combine. Toss blueberries with remaining 1 tablespoon of flour in a bowl. Fold blueberries into batter. Pour batter into the prepared pan.  Bake until a toothpick inserted in the center comes out clean, about 1 hour. Let cool in pan on a wire rack 10 minutes.   ', 10, 'Medium', 3, '3/4 cup plus 1 tablespoon all-purpose flour\n\n3/4 cup whole wheat flour\n\n2 teaspoons baking powder\n\n1/2 teaspoon salt\n\n3/4 cup cottage cheese\n\n3/4 cup honey\n\n6 tablespoons coconut oil, melted, or neutral oil of choice\n\n1 tablespoon lemon zest\n\n3 tablespoons lemon juice\n\n1 tablespoon vanilla extract\n\n2 large eggs, lightly beaten\n\n2 cups fresh blueberries', 'https://www.allrecipes.com/thmb/HL_qD1DG1sfPmhqfw5Wo5m24Iek=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8767179-Cottage-Cheese-Blueberry-Breakfast-Cake-ddmfs-beauty-10861-06948f43ed7b473ca9dd0cbf46668fd3.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (25, 'Reverse Dalgona Iced Coffee', 'I call this reverse dalgona iced coffee because the whipped coffee is made in the same glass it is served in. Talk about easy clean-up!', 5, 0, 'Place coffee, sugar, and water, in that order, in a tall glass. Using a hand-held milk frother, froth mixture until light and fluffy, 1 to 3 minutes.\n\nAdd ice cubes to the glass, then pour milk over top.', 1, 'Easy', 1, '1 tablespoon instant coffee granules\n\n1 tablespoon white sugar\n\n2 tablespoons water\n\n1/2 cup ice\n\n1/2 cup milk', 'https://www.allrecipes.com/thmb/Boai478faGWLPw3Dx4LtPQlTEFY=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8753865_Reverse-Dalgona-Iced-Coffee_Yolanda-Gutierrez_4x3-ab29580a08e04dcbb1c7af0046750304.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (26, 'Sausage Orzo Soup', 'Delicious and filling. I love how creamy it is.', 15, 45, 'Gather all ingredients.  Heat oil from sun-dried tomatoes in a large pot over medium-high until shimmering. Add sausage; cook, stirring occasionally, until sausage crumbles and is almost fully cooked through, about 5 minutes. Add onions and garlic; cook, stirring occasionally, until softened, about 5 minutes.   Add tomato paste and sun-dried tomatoes; cook, stirring constantly, until tomato paste is slightly deeper red in color and fragrant, about 2 minutes.  Stir in broth, cream, basil, salt, Italian seasoning, and paprika; bring to a boil over medium, stirring occasionally, until bubbling and frothy on top, about 12 minutes. Add pasta and reduce heat to medium-low; cook, uncovered, stirring occasionally, until orzo is al dente, about 8 minutes.   Reduce heat to low, and add spinach, cream cheese, and Parmesan; cook, stirring often, until cream cheese and spinach is wilted, about 5 minutes.  Marry Me Sausage Orzo Soup cooking in a pot  Dotdash Meredith Food Studios Garnish with additional Parmesan cheese and basil before serving.  Gather all ingredients.  Marry Me Sausage Orzo Soup ingredients on a marble counter  Dotdash Meredith Food Studios Heat oil from sun-dried tomatoes in a large pot over medium-high until shimmering. Add sausage; cook, stirring occasionally, until sausage crumbles and is almost fully cooked through, about 5 minutes. Add onions and garlic; cook, stirring occasionally, until softened, about 5 minutes.  Sausage and onions in a pot with a spatula  Dotdash Meredith Food Studios Add tomato paste and sun-dried tomatoes; cook, stirring constantly, until tomato paste is slightly deeper red in color and fragrant, about 2 minutes.  Sausage and tomato mixture in a pot with a spatula  Dotdash Meredith Food Studios Stir in broth, cream, basil, salt, Italian seasoning, and paprika; bring to a boil over medium, stirring occasionally, until bubbling and frothy on top, about 12 minutes. Add pasta and reduce heat to medium-low; cook, uncovered, stirring occasionally, until orzo is al dente, about 8 minutes.  Broth, cream, basil and pasta combined with the sausage mixture in a pot with a spatula  Dotdash Meredith Food Studios Reduce heat to low, and add spinach, cream cheese, and Parmesan; cook, stirring often, until cream cheese and spinach is wilted, about 5 minutes.  Marry Me Sausage Orzo Soup cooking in a pot  Dotdash Meredith Food Studios Garnish with additional Parmesan cheese and basil before serving. Gather all ingredients.  Marry Me Sausage Orzo Soup ingredients on a marble counter  Dotdash Meredith Food Studios Heat oil from sun-dried tomatoes in a large pot over medium-high until shimmering. Add sausage; cook, stirring occasionally, until sausage crumbles and is almost fully cooked through, about 5 minutes. Add onions and garlic; cook, stirring occasionally, until softened, about 5 minutes.  Sausage and onions in a pot with a spatula  Dotdash Meredith Food Studios Add tomato paste and sun-dried tomatoes; cook, stirring constantly, until tomato paste is slightly deeper red in color and fragrant, about 2 minutes.  Sausage and tomato mixture in a pot with a spatula  Dotdash Meredith Food Studios Stir in broth, cream, basil, salt, Italian seasoning, and paprika; bring to a boil over medium, stirring occasionally, until bubbling and frothy on top, about 12 minutes. Add pasta and reduce heat to medium-low; cook, uncovered, stirring occasionally, until orzo is al dente, about 8 minutes.  Broth, cream, basil and pasta combined with the sausage mixture in a pot with a spatula  Dotdash Meredith Food Studios Reduce heat to low, and add spinach, cream cheese, and Parmesan; cook, stirring often, until cream cheese and spinach is wilted, about 5 minutes.  Garnish with additional Parmesan cheese and basil before serving.   ', 6, 'Medium', 2, '3/4 cup drained julienne-cut sun-dried tomatoes packed in oil with herbs, coarsely chopped\n\n1 tablespoon oil from sun-dried tomato jar\n\n1 pound mild italian pork sausage\n\n1 large yellow onion, finely chopped\n\n2 large garlic cloves, minced\n\n3 tablespoons tomato paste\n\n8 cups chicken broth\n\n1 cup heavy whipping cream\n\n1 tablespoon chopped fresh basil, plus more for garnish\n\n2 teaspoons kosher salt\n\n1 teaspoon dried Italian seasoning\n\n1/2 teaspoon paprika\n\n8 ounces uncooked orzo\n\n3 cups packed fresh baby spinach, coarsely chopped\n\n1 (8-ounce) package cream cheese, cubed, at room temperature\n\n1/3 cup freshly grated Parmesan cheese', 'https://www.allrecipes.com/thmb/bFdpHhevObtkJYCf5OB3wS7soPs=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8743943-Marry-Me-Sausage-Orzo-soup-ddmfs-4x3-066-ad5d83d9c7454eb593cb945e73740a61.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (27, 'Spargel in Schinken (White Asparagus Wrapped in Ham)', 'A very simple yet delicious way to wrap freshly cooked white asparagus in ham slices. You need as many ham slices as asparagus spears. This dish is traditionally served with new potatoes.', 15, 20, 'Peel asparagus spears from top to bottom with a vegetable peeler, starting below the tips. Cut off woody ends with a knife.\n\nPlace asparagus spears in a large, wide saucepan and pour in enough lightly salted water to just cover. Bring water to a boil; add 1 tablespoon butter and sugar. Reduce heat; simmer until spears are tender and easily pierced with a knife, 15 to 25 minutes. Drain well.\n\nMelt remaining 3 tablespoons butter in a small pot over low heat.\n\nWrap each asparagus spear with a slice of ham. Arrange on a serving plate; drizzle melted butter on top.', 4, 'Easy', 3, '2 ¼ pounds white asparagus\n\nsalt to taste\n\n¼ cup butter, divided\n\n1 pinch white sugar\n\n7 ounces sliced ham', 'https://www.allrecipes.com/thmb/nX5flZXM7GXDBB9lhb-yJs_f2bw=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/4520116-cb6a7e8eef764284aa875712f23efb1a.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (28, 'Sweet and Sour Chicken', 'This baked sweet and sour chicken is savory sweet and the chicken gets wonderfully crispy. Serve over rice just like in your favorite Chinese restaurant.', 20, 30, 'Gather all ingredients. Preheat oven to 475 degrees F (245 degrees C) with racks in upper and lower third positions. Grease each of 2 baking sheets with 1 tablespoon of the oil along 1 of the short sides; set aside.   Sprinkle chicken evenly with pepper and 1 1/2 teaspoons of the salt, and place in a bowl. Add eggs, and stir to coat. Place flour in a shallow bowl or baking dish. Working in batches, dredge chicken in flour, and shake off excess. Divide chicken between the prepared baking sheets, spreading in an even layer along short edges.  Divide bell peppers among baking sheets, spreading evenly along other short edges. Drizzle bell peppers evenly with remaining 2 tablespoons oil, and toss gently to coat.  Bake in the preheated oven, rotating baking sheets halfway through, until chicken is browned in spots, about 15 minutes. Remove chicken and bell peppers from the oven; use a spatula to carefully flip chicken only . Return to the oven, and continue baking at 475 degrees F (245 degrees C) until chicken is crispy and a thermometer inserted into thickest portion of chicken registers 165 degrees F (73 degrees C), about 5 minutes.  While chicken is baking, whisk together ketchup, pineapple juice, honey, soy sauce, rice vinegar, and remaining 1/4 teaspoon salt in a small saucepan. Bring to a boil over medium, whisking occasionally. Reduce to a simmer over medium-low, and cook, stirring often, until mixture is reduced to 3/4 cup and coats back of spoon, about 5 minutes. Remove from heat. Pour 1/4 cup of the prepared sauce over chicken on the baking sheets; toss to coat evenly. Divide rice, chicken, and bell peppers evenly among bowls. Drizzle evenly with remaining 1/2 cup sauce. Serve immediately.', 4, 'Easy', 1, '1/4 cup olive oil, divided\n\n4 (6-ounce) boneless skinless chicken thighs, cut into 1 inch cubes\n\n1/4 teaspoon freshly ground black pepper\n\n1 3/4 teaspoons kosher salt\n\n2 large eggs\n\n1 cup all purpose flour\n\n2 large multicolored bell peppers, sliced\n\n1/2 cup ketchup\n\n1/4 cup pineapple juice\n\n1/4 cup honey\n\n3 tablespoons soy sauce\n\n1 tablespoon rice vinegar\n\n3 cups cooked white rice', 'https://www.allrecipes.com/thmb/mcoAfRzTsoNcyC8Dxpes7K3DaTc=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8654805-baked-sweet-sour-chicken-ddmfs-4x3-a84d85597d344406b09cc6b562c6ec92.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (29, 'Bougatsa', 'Bougatsa, a Greek pastry that\'s delicious for breakfast or anytime, has a creamy but sturdy lemon-vanilla custard baked between layers of crisp and flaky phyllo dough.', 35, 45, 'Gather the ingredients.\nPreheat the oven to 350 degrees F (175 degrees C).\nBeat eggs with a stand mixer fitted with a whisk attachment on medium speed until foamy, about 1 minute. Add white sugar; beat on medium speed until thick and foamy, 4 to 5 minutes. \nMeanwhile, heat milk in a large saucepan over medium-low, stirring occasionally, until milk begins to simmer. With mixer on low speed, slowly pour hot milk into egg mixture, beating until fully combined, about 30 seconds.\nReturn milk mixture to saucepan. Place saucepan over medium-low heat, and cook, whisking constantly, until mixture begins to simmer and thickens slightly, 3 to 4 minutes. Gradually whisk in semolina flour; cook, stirring constantly, until thickened to a porridge consistency, 1 to 2 minutes.\nRemove saucepan from heat. Gradually whisk cold butter, 1 tablespoon at a time, into mixture in saucepan until emulsified, about 2 minutes. Whisk in lemon zest, lemon juice, and vanilla. Let custard stand at room temperature while preparing baking pan, stirring occasionally.  \nBrush bottom and sides of a nonstick 13- x 9-inch baking pan with about 1 tablespoon of the melted butter. Gently unfold and place phyllo sheets on a clean work surface; cover using a damp clean kitchen towel to keep phyllo moist while you work. Layer 8 phyllo sheets in the prepared baking pan, lightly brushing each sheet with melted butter.\nSpread custard over phyllo in an even layer. Top with 2 phyllo sheets, lightly brushing each sheet with melted butter and stretching sheets to cover sides of baking pan.\nWorking with remaining 8 phyllo sheets, 1 sheet at a time, place phyllo sheet on work surface; lightly brush with melted butter. Starting from 1 short end, fold phyllo sheet accordion-style to create a long strip with 2-inch-wide pleats. Place folded phyllo strip crosswise in baking pan with pleats facing up. Repeat brushing and folding process with remaining 7 phyllo sheets and melted butter, placing strips side by side to completely cover baking pan.\nBake in the preheated oven until pastry is golden brown and crispy, 40 to 45 minutes. Remove from oven, and let bougatsa cool slightly at room temperature for 30 minutes. Dust evenly with confectioner\'s sugar and cinnamon. Slice into squares, and serve warm or at room temperature.', 12, 'Medium', 2, '4 large eggs, at room temperature\n\n2/3 cup white sugar\n\n3 cups whole milk\n\n1/2 cup semolina flour\n\n1 cup cold unsalted butter, cubed \n\n2 tablespoons packed grated lemon zest\n\n2 tablespoons freshly squeezed lemon juice\n\n1 1/2 teaspoons vanilla extract\n\n3/4 cup unsalted butter, divided\n\n18 (14x9-inch) frozen phyllo pastry sheets, thawed\n\n2 teaspoons confectioner\'s sugar\n\n1/8 teaspoon ground cinnamon', 'https://www.allrecipes.com/thmb/jnQNIfKkxEhoQ4XMbs_gXCpfeHA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8654345-bougatsa-ddmfs-5380-hero-3x4-17b0e320c1ae482782d0722a5d26d302.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (30, 'Filipino Avocado Milkshake', 'This avocado milkshake is rich, creamy, and refreshing. It\'s a traditional Filipino treat!', 5, 5, 'Combine avocado, milk, ice cream, ice, sugar, and lemon juice in a blender. Purée until smooth.', 2, 'Easy', 3, '1 medium avocado - peeled, pitted, and cubed\n\n1 ⅓ cups milk\n\n1 scoop vanilla ice cream\n\n5 cubes ice\n\n3 tablespoons white sugar\n\n1 teaspoon fresh lemon or lime juice', 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F43%2F2022%2F07%2F19%2F3515697-filipino-avocado-milkshake-Josephine-Yuen-4x3-1.jpg&q=60&c=sc&poi=auto&orient=true&h=512', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (31, 'Mochi Muffins', 'These yummy mochi muffins made with rice flour and coconut milk make a great breakfast, snack, or casual dessert.', 10, 40, 'Gather all ingredients.\nPreheat the oven to 350 degrees F (175 degrees C). Line twelve 2 1/2-inch muffin cups with paper bake cups or grease cups generously.\nWhisk together rice flour, sugars, baking powder, and salt in a bowl.\nWhisk together coconut milk, eggs, butter, vanilla, and maple syrup in a large bowl. Add flour mixture to coconut milk mixture and stir just until combined.\nDivide batter between prepared muffin cups, filling nearly full. Sprinkle with sesame seeds.\nBake in preheated oven until a toothpick inserted in the center comes out clean, 40 to 45 minutes. Cool in pan on a wire rack 10 minutes. Remove from pan and serve warm or cool completely. ', 12, 'Medium', 1, '2 cups glutinous sweet rice flour (such as Mochiko)\n\n3/4 cup packed brown sugar\n\n1/4 cup white sugar\n\n2 teaspoons baking powder\n\n1 teaspoon salt\n\n1 (14-ounce) can unsweetened coconut milk\n\n2 large eggs\n\n1/4 cup butter, melted\n\n2 teaspoons vanilla extract\n\n2 teaspoons pure maple syrup\n\n1 teaspoon sesame seeds\n\n1 teaspoon black sesame seeds', 'https://www.allrecipes.com/thmb/GcVOFhxFXJGmcXVjNihWrTveL1M=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/7565482-mochi-muffins-mfs-4x3-dacfcae02ceb4538a14ef9cb9d950b31.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (32, 'Blackberry Margarita', 'For this blackberry margarita, fresh blackberries are muddled to release their vibrant juices, then combined with smooth tequila, orange liqueur, simple syrup and a splash of lime juice, making this margarita both bold and refreshing.', 5, 5, 'Sprinkle salt onto a plate. Moisten the rim of a glass with lime wedge. Press the moistened rim into the salt. Fill the glass with ice.\n\nFill a cocktail shaker with 10 blackberries, reserving 2 blackberries for garnish. Use a muddler to crush berries to release their juices. Add tequila, triple sec, simple syrup and lime juice to the shaker and add 1 cup of ice. Seal and shake vigorously until outside is frosted, 10 to 15 seconds.\n\nStrain margarita into the glass and garnish with remaining blackberries.', 1, 'Easy', 2, '1 teaspoon coarse salt\n\n1 lime wedge\n\n2 cups ice, or as needed\n\n12 blackberries\n\n2 fluid ounces silver tequila\n\n1 fluid ounce triple sec\n\n1 fluid ounce simple syrup\n\n3/4 fluid ounces lime juice', 'https://www.allrecipes.com/thmb/vHVV28qIYHKM6Aq2-qvSxOhQt9o=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8717118_Blackberry-Margarita_France-Cevallos_4x3-ff68c2cee7854a2792f9d225ab6e4dc1.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (33, 'Pistachio Torte', 'This nostalgic pistachio torte has a nutty shortbread crust layered with cream cheese filling, fluffy pistachio topping, and whipped topping. Sweet, crunchy, and creamy, it is reminiscent of the happy desserts of childhood.', 15, 20, 'Gather all ingredients.\nPreheat the oven to 350 degrees F (175 degrees C). Grease a 9x13-inch baking dish with cooking spray.\nBeat butter with an electric mixer in a bowl until fluffy. Beat in flour, pecans, and 1/4 cup powdered sugar. Spread in an even layer in the prepared dish.\nBake in the preheated oven until light golden brown, about 18 minutes. Cool completely on a wire rack, about 45 minutes.\nBeat cream cheese with an electric mixer in a bowl until fluffy. Beat in remaining 1 cup powdered sugar and vanilla until combined. Fold in half of the whipped topping.\nSpread cream cheese filling evenly over the crust. Chill in the refrigerator for 15 minutes.\nWhisk together milk and pudding mix in a bowl for 2 minutes.\nPour pistachio pudding evenly over the cream cheese filling. Chill in the refrigerator until set, about 15 minutes.\nSpread remaining whipped topping over the pudding layer. Top with pistachios, or top with pistachios just before serving.\nCover and chill in the refrigerator 3 hours or up to 4 days.', 12, 'Medium', 3, 'cooking spray\n\n1/2 cup salted butter, softened\n\n1 cup all-purpose flour\n\n1/2 cup finely chopped pecans or pistachios\n\n1 1/4 cups powdered sugar, divided\n\n1 (8 ounce) package cream cheese, softened\n\n1 teaspoon vanilla extract\n\n1 (8 ounce) carton frozen whipped topping, thawed, divided\n\n2 1/2 cups milk\n\n2 (3.4-ounce) packages pistachio instant pudding mix\n\n1/2 cup chopped pistachios', 'https://www.allrecipes.com/thmb/-ooYKkxDiY5fdITk480T3RSLJjA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8759774-Pistachio-Torte-ddmfs-7601-4x3-beauty-1489eb54eb16473fa72ab135d263310a.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (34, 'Beef Wellington', 'This beef Wellington recipe makes an impressive beef tenderloin wrapped in puff pastry and includes how to make a rich red wine sauce to serve with it. It\'s easier than you think to make and perfect for holiday entertaining! The beef tenderloin is best served medium-rare.', 30, 40, 'Preheat the oven to 425 degrees F (220 degrees C).\nPlace beef tenderloin in a baking dish. Spread 2 tablespoons softened butter over beef.\nBake in the preheated oven until browned, 10 to 15 minutes. Remove beef from the pan and reserve pan juices; allow beef to cool completely.\nIncrease oven temperature to 450 degrees F (230 degrees C).\nMelt 2 tablespoons butter in a skillet over medium heat. Sauté onion and mushrooms in butter for 5 minutes. Remove from heat and let cool.\nMix paté and remaining 2 tablespoons softened butter together in a bowl; season with salt and pepper. Spread paté mixture over beef. Top with onion and mushroom mixture.\nRoll out puff pastry dough to about 1/4-inch thickness and place beef in the center.\nFold up and seal all the edges, making sure the seams are not too thick. Place beef in a 9x13-inch baking dish, cut a few slits in the top of dough, and brush with egg yolk.\nBake in the preheated oven for 10 minutes. Reduce heat to 425 degrees F (220 degrees C) and continue baking until pastry is a rich, golden brown, 10 to 15 minutes. An instant-read thermometer inserted into the center should read between 122 to 130 degrees F (50 to 54 degrees C) for medium rare. Set aside to rest.\nMeanwhile, place reserved pan juices in a small saucepan over high heat. Stir in beef broth and red wine; boil until slightly reduced, about 5 minutes. Strain and serve with beef.\nServe hot and enjoy!\n', 8, 'Hard', 1, '2 ½ pounds beef tenderloin\n\n4 tablespoons butter, softened, divided\n\n2 tablespoons butter\n\n1 onion, chopped\n\n½ cup sliced fresh mushrooms\n\n2 ounces liver paté\n\nsalt and pepper to taste\n\n1 (17.5 ounce) package frozen puff pastry, thawed\n\n1 large egg yolk, beaten\n\n1 (10.5 ounce) can beef broth\n\n2 tablespoons red wine', 'https://www.allrecipes.com/thmb/3xW1g-TshPTPCzKqCPPgt2unCUw=/0x512/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/16899-beef-wellington-DDMFS-4x3-84b7691972174478bfb16b465cdaf0d2.jpg', '2025-01-16', '2025-01-16', 1);
INSERT INTO `recipe` (`id`, `name`, `description`, `prep_time_minutes`, `cook_time_minutes`, `instructions`, `servings`, `difficulty`, `user_id`, `ingredients`, `image_url`, `create_date`, `last_update`, `enabled`) VALUES (35, 'Beet Pickled Deviled Eggs', 'These beet pickled deviled eggs take on a striking pink color when plunged into a pickled beet brine. They’re a beautiful appetizer, sure to turn heads.', 15, 5, 'For brine, drain beet juice into a small saucepan; set beet slices aside. Add the 1/2 cup vinegar, sugar, salt, and peppercorns, and bring to a low boil over medium heat, stirring until sugar dissolves, 3 to 5 minutes. Let cool completely, about 20 minutes.\n\nPlace eggs in a jar or glass bowl just large enough that brine will completely cover eggs; pour in brine. Top up with vinegar as needed to cover eggs completely. Refrigerate, covered, for at least 12 and up to 24 hours. The longer eggs are in brine, the deeper pink they will be.\n\nSlice eggs in half lengthwise from top to bottom with a sharp knife. Remove yolks and place in a bowl. Mash yolks with a fork until smooth, and stir in mayonnaise, Dijon, the 1 teaspoon vinegar, and hot sauce; season with salt and pepper. As an option, if you have a small food processor, place all filling ingredients in it, and blend until smooth.\n\nSpoon filling evenly into egg whites or add mixture to a piping bag or resealable plastic bag with one corner clipped. Pipe mixture into egg white halves, garnish as desired, and serve.', 12, 'Easy', 2, 'Beet Brine\n\n1 (15 ounce) can sliced beets\n\n1/2 cup apple cider vinegar, or as needed\n\n2 tablespoons white sugar\n\n1 teaspoon salt\n\n1 teaspoon peppercorns\n\n6 large hard boiled eggs\n\nFilling\n\n3 tablespoons mayonnaise\n\n2 teaspoons Dijon mustard\n\n1 teaspoon apple cider vinegar\n\n1 dash hot sauce (optional)\n\nsalt and freshly ground black pepper to taste\n\ngarnishes, such as radish slices, dill fronds, black olive slices, chopped chives, Everything Bagel seasoning (optional)\n\nLocal Offers\ndenver, CO 80203 \nChange\n\nInstacart logo\nWalmart logo\nKing Soopers logo\nTarget logo\nWhole Foods Market logo\nInstacart logo\nWalmart logo\n\n\nBuy all 10 ingredients from this recipe for $28.82\n\nAdd to\n', 'https://www.allrecipes.com/thmb/N0w23rG3nMndtbksflVd15JhuZg=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8743663_Beet-Pickled-Deviled-Eggs_Pat-Bernitt_4x3-f24eaaa420544ab9b4fd3e58eef3e9a5.jpg', '2025-01-16', '2025-01-16', 1);

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
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (13, 1);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (14, 2);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (15, 1);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (16, 2);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (17, 3);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (18, 7);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (19, 1);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (20, 11);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (21, 11);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (22, 1);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (23, 2);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (24, 2);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (25, 6);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (26, 3);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (27, 8);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (28, 4);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (29, 11);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (30, 9);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (31, 5);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (32, 1);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (33, 11);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (34, 7);
INSERT INTO `cuisine_has_recipe` (`recipe_id`, `cuisine_id`) VALUES (35, 2);

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

