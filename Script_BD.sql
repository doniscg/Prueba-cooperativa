-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema clientesapp
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `clientesapp` ;

-- -----------------------------------------------------
-- Schema clientesapp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clientesapp` DEFAULT CHARACTER SET utf8 ;
USE `clientesapp` ;

-- -----------------------------------------------------
-- Table `clientesapp`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clientesapp`.`Usuarios` ;

CREATE TABLE IF NOT EXISTS `clientesapp`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `nombreUsuario` VARCHAR(45) NULL,
  `direccionUsuario` VARCHAR(45) NULL,
  `correoUsuario` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clientesapp`.`Roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clientesapp`.`Roles` ;

CREATE TABLE IF NOT EXISTS `clientesapp`.`Roles` (
  `idRoles` INT NOT NULL AUTO_INCREMENT,
  `nombreRol` VARCHAR(45) NULL,
  `estado` TINYINT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  INDEX `fk_Roles_Usuarios_idx` (`Usuarios_idUsuarios` ASC),
  PRIMARY KEY (`idRoles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clientesapp`.`Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clientesapp`.`Clientes` ;

CREATE TABLE IF NOT EXISTS `clientesapp`.`Clientes` (
  `idCliente` INT NOT NULL,
  `nombreCliente` VARCHAR(45) NULL,
  `correoCliente` VARCHAR(45) NULL,
  `direccionCliente` VARCHAR(45) NULL,
  `numeroCompras` INT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idtable1_UNIQUE` (`idCliente` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clientesapp`.`Factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clientesapp`.`Factura` ;

CREATE TABLE IF NOT EXISTS `clientesapp`.`Factura` (
  `idFactura` INT NOT NULL AUTO_INCREMENT,
  `serieFactura` VARCHAR(45) NULL,
  `numeroFactura` VARCHAR(45) NULL,
  `Clientes_idCliente` INT NOT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `fk_Factura_Clientes1_idx` (`Clientes_idCliente` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clientesapp`.`detalle_factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clientesapp`.`detalle_factura` ;

CREATE TABLE IF NOT EXISTS `clientesapp`.`detalle_factura` (
  `iddetalle_factura` INT NOT NULL AUTO_INCREMENT,
  `cantidadFactura` VARCHAR(45) NULL,
  `Factura_idFactura` INT NOT NULL,
  PRIMARY KEY (`iddetalle_factura`),
  INDEX `fk_detalle_factura_Factura1_idx` (`Factura_idFactura` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clientesapp`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clientesapp`.`Producto` ;

CREATE TABLE IF NOT EXISTS `clientesapp`.`Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `idInterno` VARCHAR(45) NULL,
  `nombreProducto` VARCHAR(45) NULL,
  `descripcionProducto` VARCHAR(55) NULL,
  `stockProducto` INT NULL,
  `detalle_factura_iddetalle_factura` INT NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_Producto_detalle_factura1_idx` (`detalle_factura_iddetalle_factura` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
