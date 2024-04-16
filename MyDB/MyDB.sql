-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Группы_услуг`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Группы_услуг` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Группы_услуг` (
  `id` INT NOT NULL,
  `Название` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Услуги`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Услуги` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Услуги` (
  `id` INT NOT NULL,
  `Название` VARCHAR(45) NULL,
  `Себестоимость` DOUBLE NULL,
  `Описание` VARCHAR(45) NULL,
  `Группы_услуг_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Услуги_Группы_услуг1_idx` (`Группы_услуг_id` ASC) VISIBLE,
  CONSTRAINT `fk_Услуги_Группы_услуг1`
    FOREIGN KEY (`Группы_услуг_id`)
    REFERENCES `mydb`.`Группы_услуг` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Должности`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Должности` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Должности` (
  `id` INT NOT NULL,
  `Название` VARCHAR(45) NULL,
  `Оклад` DOUBLE NULL,
  `Группы_услуг_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Должности_Группы_услуг1_idx` (`Группы_услуг_id` ASC) VISIBLE,
  CONSTRAINT `fk_Должности_Группы_услуг1`
    FOREIGN KEY (`Группы_услуг_id`)
    REFERENCES `mydb`.`Группы_услуг` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Сотрудники`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Сотрудники` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Сотрудники` (
  `id` INT NOT NULL,
  `ФИО` VARCHAR(45) NULL,
  `Адрес` VARCHAR(45) NULL,
  `Телефон` VARCHAR(45) NULL,
  `Должности_id` INT NULL,
  `Дата_рождения` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Сотрудники_Должности1_idx` (`Должности_id` ASC) VISIBLE,
  CONSTRAINT `fk_Сотрудники_Должности1`
    FOREIGN KEY (`Должности_id`)
    REFERENCES `mydb`.`Должности` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Контакты`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Контакты` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Контакты` (
  `id` INT NOT NULL,
  `Мессенджер` VARCHAR(45) NULL,
  `E-mail` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Клиенты`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Клиенты` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Клиенты` (
  `id` INT NOT NULL,
  `ФИО` VARCHAR(45) NULL,
  `Телефон` VARCHAR(45) NULL,
  `Адрес` VARCHAR(45) NULL,
  `Контакты_id` INT NULL,
  `Дата_рождения` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Клиенты_Контакты1_idx` (`Контакты_id` ASC) VISIBLE,
  CONSTRAINT `fk_Клиенты_Контакты1`
    FOREIGN KEY (`Контакты_id`)
    REFERENCES `mydb`.`Контакты` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Посещения`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Посещения` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Посещения` (
  `id` INT NOT NULL,
  `Дата` DATE NULL,
  `Статус` VARCHAR(45) NULL,
  `Услуги_id` INT NULL,
  `Сотрудники_id` INT NULL,
  `Клиенты_id` INT NULL,
  INDEX `fk_Посещения_Услуги_idx` (`Услуги_id` ASC) VISIBLE,
  INDEX `fk_Посещения_Сотрудники1_idx` (`Сотрудники_id` ASC) VISIBLE,
  INDEX `fk_Посещения_Клиенты1_idx` (`Клиенты_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Посещения_Услуги`
    FOREIGN KEY (`Услуги_id`)
    REFERENCES `mydb`.`Услуги` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Посещения_Сотрудники1`
    FOREIGN KEY (`Сотрудники_id`)
    REFERENCES `mydb`.`Сотрудники` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Посещения_Клиенты1`
    FOREIGN KEY (`Клиенты_id`)
    REFERENCES `mydb`.`Клиенты` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
