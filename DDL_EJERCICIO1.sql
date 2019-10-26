
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Cl
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cl
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cl` ;
USE `Cl` ;

-- -----------------------------------------------------
-- Table `Cl`.`Colegio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Colegio` (
  `idColegio` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Estado` VARCHAR(45) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Codigo_Postal` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idColegio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Sede` (
  `idSede` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Codigo Postal` VARCHAR(45) NULL,
  `idColegio` INT NULL,
  PRIMARY KEY (`idSede`),
    FOREIGN KEY (`idColegio`)
    REFERENCES `Cl`.`Colegio` (`idColegio`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Estudiante` (
  `idEstudiante` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `DOB` DATE NULL,
  `Direccion` VARCHAR(45) NULL,
  `Estado` VARCHAR(45) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Codigo_Postal` VARCHAR(45) NULL,
  `Grado` VARCHAR(45) NULL,
  `idSede` INT NULL,
  PRIMARY KEY (`idEstudiante`),
    FOREIGN KEY (`idSede`)
    REFERENCES `Cl`.`Sede` (`idSede`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Horario` (
  `idHorario` INT NOT NULL,
  `Fecha` DATE NULL,
  PRIMARY KEY (`idHorario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Subject` (
  `idSubject` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idSubject`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Representante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Representante` (
  `idRepresentante` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `DOB` DATE NULL,
  `Direccion` VARCHAR(45) NULL,
  `Estado` VARCHAR(45) NULL,
  `Representantecol` VARCHAR(45) NULL,
  `Codigo_Postal` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`idRepresentante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Salon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Salon` (
  `idSalon` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Capacidad` VARCHAR(45) NULL,
  PRIMARY KEY (`idSalon`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Utileria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Utileria` (
  `idUtileria` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Tipo` VARCHAR(45) NULL,
  `Stock` VARCHAR(45) NULL,
  `idSalon` INT NULL,
  PRIMARY KEY (`idUtileria`),
    FOREIGN KEY (`idSalon`)
    REFERENCES `Cl`.`Salon` (`idSalon`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Profesor` (
  `idProfesor` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `DOB` DATE NULL,
  `Direccion` VARCHAR(45) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Codigo_Postal` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`idProfesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Profesor_Subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Profesor_Subject` (
  `idProfesor_Subject` INT NOT NULL,
  `idProfesor` INT NULL,
  `idSubject` INT NULL,
  PRIMARY KEY (`idProfesor_Subject`),
    FOREIGN KEY (`idProfesor`)
    REFERENCES `Cl`.`Profesor` (`idProfesor`),
    FOREIGN KEY (`idSubject`)
    REFERENCES `Cl`.`Subject` (`idSubject`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Estudiante_Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Estudiante_Horario` (
  `idEstudiante_Horario` INT NOT NULL,
  `idEstudiante` INT NULL,
  `idHorario` INT NULL,
  PRIMARY KEY (`idEstudiante_Horario`),
    FOREIGN KEY (`idEstudiante`)
    REFERENCES `Cl`.`Estudiante` (`idEstudiante`),
    FOREIGN KEY (`idHorario`)
    REFERENCES `Cl`.`Horario` (`idHorario`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Profesor_Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Profesor_Horario` (
  `idProfesor_Horario` INT NOT NULL,
  `idProfesor` INT NULL,
  `idHorario` INT NULL,
  PRIMARY KEY (`idProfesor_Horario`),
    FOREIGN KEY (`idProfesor`)
    REFERENCES `Cl`.`Profesor` (`idProfesor`),
    FOREIGN KEY (`idHorario`)
    REFERENCES `Cl`.`Horario` (`idHorario`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Estudiante_Subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Estudiante_Subject` (
  `idEstudiante_Subject` INT NOT NULL,
  `idEstudiante` INT NULL,
  `idSubject` INT NULL,
  PRIMARY KEY (`idEstudiante_Subject`),
    FOREIGN KEY (`idEstudiante`)
    REFERENCES `Cl`.`Estudiante` (`idEstudiante`),
    FOREIGN KEY (`idSubject`)
    REFERENCES `Cl`.`Subject` (`idSubject`)
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Representante_Estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Representante_Estudiante` (
  `idRepresentante_Estudiante` INT NOT NULL,
  `idRepresentante` INT NULL,
  `idEstudiante` INT NULL,
  PRIMARY KEY (`idRepresentante_Estudiante`),
    FOREIGN KEY (`idRepresentante`)
    REFERENCES `Cl`.`Representante` (`idRepresentante`),
    FOREIGN KEY (`idEstudiante`)
    REFERENCES `Cl`.`Estudiante` (`idEstudiante`)
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cl`.`Horario_Salon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cl`.`Horario_Salon` (
  `idHorario_Salon` INT NOT NULL,
  `idHorario` INT NULL,
  `idSalon` INT NULL,
  PRIMARY KEY (`idHorario_Salon`),
    FOREIGN KEY (`idHorario`)
    REFERENCES `Cl`.`Horario` (`idHorario`),
    FOREIGN KEY (`idSalon`)
    REFERENCES `Cl`.`Salon` (`idSalon`)
    )
ENGINE = InnoDB;


