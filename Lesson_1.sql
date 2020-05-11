-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema world
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema world
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `world` DEFAULT CHARACTER SET utf8 ;
USE `world` ;

-- -----------------------------------------------------
-- Table `world`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `world`.`country` (
  `id_country` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_country`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'country - town';


-- -----------------------------------------------------
-- Table `world`.`district`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `world`.`district` (
  `iddistrict` INT(11) NOT NULL,
  `districtname` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`iddistrict`),
  UNIQUE INDEX `districtcol_UNIQUE` (`districtname` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Район';


-- -----------------------------------------------------
-- Table `world`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `world`.`region` (
  `idregion` INT(11) NOT NULL,
  `region_name` VARCHAR(45) NOT NULL COMMENT 'Наименование региона',
  `country` INT(11) NOT NULL,
  PRIMARY KEY (`idregion`),
  UNIQUE INDEX `region_name_UNIQUE` (`region_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Территориально-административные единицы';


-- -----------------------------------------------------
-- Table `world`.`town_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `world`.`town_type` (
  `idtown_type` INT(11) NOT NULL,
  `town_typename` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtown_type`),
  UNIQUE INDEX `town_typename_UNIQUE` (`town_typename` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Тип населенного пункта';


-- -----------------------------------------------------
-- Table `world`.`town`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `world`.`town` (
  `idtown` INT(11) NOT NULL,
  `townname` VARCHAR(45) NOT NULL,
  `towntype` INT(11) NOT NULL,
  `district` INT(11) NULL DEFAULT NULL,
  `region` INT(11) NOT NULL,
  PRIMARY KEY (`idtown`),
  UNIQUE INDEX `townname_UNIQUE` (`townname` ASC) VISIBLE,
  INDEX `towntype_idx` (`towntype` ASC) VISIBLE,
  INDEX `district_idx` (`district` ASC) VISIBLE,
  INDEX `region_idx` (`region` ASC) VISIBLE,
  CONSTRAINT `district`
    FOREIGN KEY (`district`)
    REFERENCES `world`.`district` (`iddistrict`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `region`
    FOREIGN KEY (`region`)
    REFERENCES `world`.`region` (`idregion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `towntype`
    FOREIGN KEY (`towntype`)
    REFERENCES `world`.`town_type` (`idtown_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Города и страны';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
