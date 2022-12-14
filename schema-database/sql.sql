-- MySQL Script generated by MySQL Workbench
-- Mon Nov 28 20:13:30 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ets_mademoisellebio_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ets_mademoisellebio_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ets_mademoisellebio_db` DEFAULT CHARACTER SET utf8 ;
USE `ets_mademoisellebio_db` ;

-- -----------------------------------------------------
-- Table `ets_mademoisellebio_db`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ets_mademoisellebio_db`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ets_mademoisellebio_db`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ets_mademoisellebio_db`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  ` cp` INT NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `street` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ets_mademoisellebio_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ets_mademoisellebio_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NOT NULL,
  `firstname` VARCHAR(255) NOT NULL,
  `lastname` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(255) NOT NULL,
  `birthday` DATE NULL,
  PRIMARY KEY (`id`, `address_id`),
  INDEX `fk_users_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `ets_mademoisellebio_db`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ets_mademoisellebio_db`.`facilities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ets_mademoisellebio_db`.`facilities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `code` VARCHAR(255) NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`, `address_id`),
  INDEX `fk_facilities_address_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_facilities_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `ets_mademoisellebio_db`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ets_mademoisellebio_db`.`certificates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ets_mademoisellebio_db`.`certificates` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  `faclities_name` VARCHAR(255) NOT NULL,
  `place` VARCHAR(255) NOT NULL,
  `date_obtained` DATE NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_certificates_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_certificates_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `ets_mademoisellebio_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ets_mademoisellebio_db`.`accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ets_mademoisellebio_db`.`accounts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `create_at` DATETIME NOT NULL,
  `users_id` INT NOT NULL,
  `is_admin` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_accounts_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_accounts_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `ets_mademoisellebio_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ets_mademoisellebio_db`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ets_mademoisellebio_db`.`class` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `code` VARCHAR(255) NOT NULL,
  `facilities_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_class_facilities1_idx` (`facilities_id` ASC) VISIBLE,
  CONSTRAINT `fk_class_facilities1`
    FOREIGN KEY (`facilities_id`)
    REFERENCES `ets_mademoisellebio_db`.`facilities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ets_mademoisellebio_db`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ets_mademoisellebio_db`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `created_ad` DATE NOT NULL,
  `code` VARCHAR(255) NOT NULL,
  `users_id` INT NOT NULL,
  `class_id` INT NOT NULL,
  PRIMARY KEY (`id`, `users_id`, `class_id`),
  INDEX `fk_students_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_students_class1_idx` (`class_id` ASC) VISIBLE,
  CONSTRAINT `fk_students_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `ets_mademoisellebio_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_class1`
    FOREIGN KEY (`class_id`)
    REFERENCES `ets_mademoisellebio_db`.`class` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ets_mademoisellebio_db`.`programs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ets_mademoisellebio_db`.`programs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `code` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ets_mademoisellebio_db`.`staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ets_mademoisellebio_db`.`staffs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `created_ad` DATE NOT NULL,
  `users_id` INT NOT NULL,
  `roles_id` INT NOT NULL,
  `programs_id` INT NOT NULL,
  PRIMARY KEY (`id`, `users_id`, `programs_id`),
  INDEX `fk_staffs_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_staffs_roles1_idx` (`roles_id` ASC) VISIBLE,
  INDEX `fk_staffs_programs1_idx` (`programs_id` ASC) VISIBLE,
  CONSTRAINT `fk_staffs_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `ets_mademoisellebio_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staffs_roles1`
    FOREIGN KEY (`roles_id`)
    REFERENCES `ets_mademoisellebio_db`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staffs_programs1`
    FOREIGN KEY (`programs_id`)
    REFERENCES `ets_mademoisellebio_db`.`programs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ets_mademoisellebio_db`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ets_mademoisellebio_db`.`courses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `begin_at` DATETIME NOT NULL COMMENT 'date de debut',
  `end_at` DATETIME NOT NULL COMMENT 'date de fin du cours',
  `class_id` INT NOT NULL,
  `staffs_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_courses_class1_idx` (`class_id` ASC) VISIBLE,
  INDEX `fk_courses_staffs1_idx` (`staffs_id` ASC) VISIBLE,
  CONSTRAINT `fk_courses_class1`
    FOREIGN KEY (`class_id`)
    REFERENCES `ets_mademoisellebio_db`.`class` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_staffs1`
    FOREIGN KEY (`staffs_id`)
    REFERENCES `ets_mademoisellebio_db`.`staffs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
