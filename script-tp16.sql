-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tp16
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tp16
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tp16` DEFAULT CHARACTER SET utf8 ;
USE `tp16` ;

-- -----------------------------------------------------
-- Table `tp16`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp16`.`Categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tp16`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp16`.`Usuarios` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `categoria_id` INT NOT NULL,
  `Categorias_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Usuarios_Categorias_idx` (`Categorias_id` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Categorias`
    FOREIGN KEY (`Categorias_id`)
    REFERENCES `tp16`.`Categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tp16`.`Unidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp16`.`Unidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(450) NOT NULL,
  `fechaInicio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tp16`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp16`.`Cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(500) NOT NULL,
  `cupos` INT NOT NULL,
  `imagen` VARCHAR(100) NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFinalizacion` DATE NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `visibilidad` TINYINT NOT NULL,
  `Unidades_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Cursos_Unidades1_idx` (`Unidades_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cursos_Unidades1`
    FOREIGN KEY (`Unidades_id`)
    REFERENCES `tp16`.`Unidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tp16`.`usuarios_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp16`.`usuarios_cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarios_id` INT NOT NULL,
  `cursos_id` INT NOT NULL,
  `Usuarios_id` INT NOT NULL,
  `Cursos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuarios_cursos_Usuarios1_idx` (`Usuarios_id` ASC) VISIBLE,
  INDEX `fk_usuarios_cursos_Cursos1_idx` (`Cursos_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_cursos_Usuarios1`
    FOREIGN KEY (`Usuarios_id`)
    REFERENCES `tp16`.`Usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_cursos_Cursos1`
    FOREIGN KEY (`Cursos_id`)
    REFERENCES `tp16`.`Cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tp16`.`Bloque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tp16`.`Bloque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `marcaDeVisibilidad` VARCHAR(45) NOT NULL,
  `tipoDeDato` VARCHAR(45) NOT NULL,
  `contenido` VARCHAR(45) NOT NULL,
  `Cursos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Bloque_Cursos1_idx` (`Cursos_id` ASC) VISIBLE,
  CONSTRAINT `fk_Bloque_Cursos1`
    FOREIGN KEY (`Cursos_id`)
    REFERENCES `tp16`.`Cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
