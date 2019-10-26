

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema clase2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clase2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clase2` ;
USE `clase2` ;

-- -----------------------------------------------------
-- Table `clase2`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clase2`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Nombre_De_Compania` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Estado` VARCHAR(45) NULL,
  `Codigo_Postal` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clase2`.`Compania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clase2`.`Compania` (
  `idCompania` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Estado` VARCHAR(45) NULL,
  `Codigo_Postal` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`idCompania`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clase2`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clase2`.`Factura` (
  `idFactura` INT NOT NULL,
  `Fecha` DATE NULL,
  `Terminos` VARCHAR(45) NULL,
  `Cantidad` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Compania_idCompania` INT NOT NULL,
  PRIMARY KEY (`idFactura`),
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `clase2`.`Cliente` (`idCliente`),
    FOREIGN KEY (`Compania_idCompania`)
    REFERENCES `clase2`.`Compania` (`idCompania`)
   )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clase2`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clase2`.`Producto` (
  `idProducto` INT NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  `Precio_Unitario` VARCHAR(45) NULL,
  `Monto` VARCHAR(45) NULL,
  `Stock` VARCHAR(45) NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `clase2`.`Producto_Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clase2`.`Producto_Factura` (
  `idProducto_Factura` INT NOT NULL,
  `idProducto` INT NULL,
  `idFactura` INT NULL,
  PRIMARY KEY (`idProducto_Factura`),
    FOREIGN KEY (`idProducto`)
    REFERENCES `clase2`.`Producto` (`idProducto`),
    FOREIGN KEY (`idFactura`)
    REFERENCES `clase2`.`Factura` (`idFactura`)
    )
ENGINE = InnoDB;



