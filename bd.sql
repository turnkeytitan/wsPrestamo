-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema prestamo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema prestamo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `prestamo` DEFAULT CHARACTER SET utf8 ;
USE `prestamo` ;

-- -----------------------------------------------------
-- Table `prestamo`.`socio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prestamo`.`socio` (
  `id_socio` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `tasa` FLOAT NOT NULL,
  `monto_max` INT(11) NOT NULL,
  PRIMARY KEY (`id_socio`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
