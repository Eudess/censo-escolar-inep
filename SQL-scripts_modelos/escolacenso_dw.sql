-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema dw_escolacenso
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dw_escolacenso
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dw_escolacenso` DEFAULT CHARACTER SET utf8 ;
USE `dw_escolacenso` ;

-- -----------------------------------------------------
-- Table `dw_escolacenso`.`DIM_ESCOLA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_escolacenso`.`DIM_ESCOLA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_ORIGEM` BIGINT NOT NULL,
  `NO_ENTIDADE` VARCHAR(100) NOT NULL,
  `TP_DEPENDENCIA` VARCHAR(45) NOT NULL,
  `ZONA` VARCHAR(45) NOT NULL,
  `VERSION` INT NULL,
  `DATE_FROM` DATETIME NULL,
  `DATE_TO` DATETIME NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_escolacenso`.`DIM_LOCALIZACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_escolacenso`.`DIM_LOCALIZACAO` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `REGIAO` VARCHAR(45) NOT NULL,
  `ESTADO` VARCHAR(45) NOT NULL,
  `VERSION` INT NULL,
  `DATE_FROM` DATETIME NULL,
  `DATE_TO` DATETIME NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_escolacenso`.`DIM_RACA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_escolacenso`.`DIM_RACA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_ORIGEM` INT NOT NULL,
  `TP_RACA` VARCHAR(45) NOT NULL,
  `VERSION` INT NULL,
  `DATE_FROM` DATETIME NULL,
  `DATE_TO` DATETIME NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_escolacenso`.`DIM_SEXO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_escolacenso`.`DIM_SEXO` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_ORIGEM` INT NOT NULL,
  `TP_SEXO` VARCHAR(45) NOT NULL,
  `VERSION` INT NULL,
  `DATE_FROM` DATETIME NULL,
  `DATE_TO` DATETIME NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_escolacenso`.`DIM_NECESSIDADE_ESPECIAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_escolacenso`.`DIM_NECESSIDADE_ESPECIAL` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_ORIGEM` INT NOT NULL,
  `TP_NECESSIDADE` VARCHAR(100) NOT NULL,
  `VERSION` INT NULL,
  `DATE_FROM` DATETIME NULL,
  `DATE_TO` DATETIME NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_escolacenso`.`FATO_ALUNO_NE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_escolacenso`.`FATO_ALUNO_NE` (
  `DIM_LOCALIZACAO_ID` INT NOT NULL,
  `DIM_RACA_ID` INT NOT NULL,
  `DIM_SEXO_ID` INT NOT NULL,
  `DIM_NE_ID` INT NOT NULL,
  `DIM_ESCOLA_ID` INT NOT NULL,
  `QTD_ALUNOS_NE` BIGINT NOT NULL,
  `PORCENTAGEM_ALUNOS_NE` DOUBLE NOT NULL,
  INDEX `fk_FATO_ALUNO_NE_DIM_RACA1_idx` (`DIM_RACA_ID` ASC),
  INDEX `fk_FATO_ALUNO_NE_DIM_SEXO1_idx` (`DIM_SEXO_ID` ASC),
  INDEX `fk_FATO_ALUNO_NE_DIM_DEFICIENCIA1_idx` (`DIM_NE_ID` ASC),
  PRIMARY KEY (`DIM_LOCALIZACAO_ID`, `DIM_RACA_ID`, `DIM_SEXO_ID`, `DIM_NE_ID`, `DIM_ESCOLA_ID`),
  INDEX `fk_FATO_ALUNO_NE_DIM_LOCALIZACAO2_idx` (`DIM_LOCALIZACAO_ID` ASC),
  INDEX `fk_FATO_ALUNO_NE_DIM_ESCOLA1_idx` (`DIM_ESCOLA_ID` ASC),
  CONSTRAINT `fk_FATO_ALUNO_NE_DIM_RACA1`
    FOREIGN KEY (`DIM_RACA_ID`)
    REFERENCES `dw_escolacenso`.`DIM_RACA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_ALUNO_NE_DIM_SEXO1`
    FOREIGN KEY (`DIM_SEXO_ID`)
    REFERENCES `dw_escolacenso`.`DIM_SEXO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_ALUNO_NE_DIM_DEFICIENCIA1`
    FOREIGN KEY (`DIM_NE_ID`)
    REFERENCES `dw_escolacenso`.`DIM_NECESSIDADE_ESPECIAL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_ALUNO_NE_DIM_LOCALIZACAO2`
    FOREIGN KEY (`DIM_LOCALIZACAO_ID`)
    REFERENCES `dw_escolacenso`.`DIM_LOCALIZACAO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_ALUNO_NE_DIM_ESCOLA1`
    FOREIGN KEY (`DIM_ESCOLA_ID`)
    REFERENCES `dw_escolacenso`.`DIM_ESCOLA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_escolacenso`.`DIM_AGUA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_escolacenso`.`DIM_AGUA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TP_AGUA` VARCHAR(45) NOT NULL,
  `VERSION` INT NULL,
  `DATE_FROM` DATETIME NULL,
  `DATE_TO` DATETIME NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_escolacenso`.`DIM_ESGOTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_escolacenso`.`DIM_ESGOTO` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TP_ESGOTO` VARCHAR(45) NOT NULL,
  `VERSION` INT NULL,
  `DATE_FROM` DATETIME NULL,
  `DATE_TO` DATETIME NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_escolacenso`.`DIM_ENERGIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_escolacenso`.`DIM_ENERGIA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TP_ENERGIA` VARCHAR(45) NOT NULL,
  `VERSION` INT NULL,
  `DATE_FROM` DATETIME NULL,
  `DATE_TO` DATETIME NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_escolacenso`.`DIM_ACESSIBILIDADE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_escolacenso`.`DIM_ACESSIBILIDADE` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TP_RECURSO_PNE` VARCHAR(45) NOT NULL,
  `VERSION` INT NULL,
  `DATE_FROM` DATETIME NULL,
  `DATE_TO` DATETIME NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_escolacenso`.`DIM_INTERNET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_escolacenso`.`DIM_INTERNET` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ACESSO` VARCHAR(45) NOT NULL,
  `VERSION` INT NULL,
  `DATE_FROM` DATETIME NULL,
  `DATE_TO` DATETIME NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_escolacenso`.`DIM_DEPENDENCIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_escolacenso`.`DIM_DEPENDENCIA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TP_DEPENDENCIA` VARCHAR(45) NOT NULL,
  `VERSION` INT NULL,
  `DATE_FROM` DATETIME NULL,
  `DATE_TO` DATETIME NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dw_escolacenso`.`FATO_INFRAESTRUTURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dw_escolacenso`.`FATO_INFRAESTRUTURA` (
  `DIM_AGUA_ID` INT NOT NULL,
  `DIM_ESGOTO_ID` INT NOT NULL,
  `DIM_DEPENDENCIA_ID` INT NOT NULL,
  `DIM_LOCALIZACAO_ID` INT NOT NULL,
  `DIM_ENERGIA_ID` INT NOT NULL,
  `DIM_ACESSIBILIDADE_ID` INT NOT NULL,
  `DIM_INTERNET_ID` INT NOT NULL,
  `QTD_ESCOLAS` INT NOT NULL,
  `PORCENTAGEM_ESCOLAS` DOUBLE NOT NULL,
  INDEX `fk_FATO_INFRAESTRUTURA_DIM_AGUA1_idx` (`DIM_AGUA_ID` ASC),
  INDEX `fk_FATO_INFRAESTRUTURA_DIM_ESGOTO1_idx` (`DIM_ESGOTO_ID` ASC),
  INDEX `fk_FATO_INFRAESTRUTURA_DIM_LOCALIZACAO1_idx` (`DIM_LOCALIZACAO_ID` ASC),
  INDEX `fk_FATO_INFRAESTRUTURA_DIM_ENERGIA1_idx` (`DIM_ENERGIA_ID` ASC),
  INDEX `fk_FATO_INFRAESTRUTURA_ACESSIBILIDADE1_idx` (`DIM_ACESSIBILIDADE_ID` ASC),
  INDEX `fk_FATO_INFRAESTRUTURA_DIM_INTERNET1_idx` (`DIM_INTERNET_ID` ASC),
  PRIMARY KEY (`DIM_AGUA_ID`, `DIM_ESGOTO_ID`, `DIM_DEPENDENCIA_ID`, `DIM_LOCALIZACAO_ID`, `DIM_ENERGIA_ID`, `DIM_ACESSIBILIDADE_ID`, `DIM_INTERNET_ID`),
  INDEX `fk_FATO_INFRAESTRUTURA_DIM_DEPENDENCIA1_idx` (`DIM_DEPENDENCIA_ID` ASC),
  CONSTRAINT `fk_FATO_INFRAESTRUTURA_DIM_AGUA1`
    FOREIGN KEY (`DIM_AGUA_ID`)
    REFERENCES `dw_escolacenso`.`DIM_AGUA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_INFRAESTRUTURA_DIM_ESGOTO1`
    FOREIGN KEY (`DIM_ESGOTO_ID`)
    REFERENCES `dw_escolacenso`.`DIM_ESGOTO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_INFRAESTRUTURA_DIM_LOCALIZACAO1`
    FOREIGN KEY (`DIM_LOCALIZACAO_ID`)
    REFERENCES `dw_escolacenso`.`DIM_LOCALIZACAO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_INFRAESTRUTURA_DIM_ENERGIA1`
    FOREIGN KEY (`DIM_ENERGIA_ID`)
    REFERENCES `dw_escolacenso`.`DIM_ENERGIA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_INFRAESTRUTURA_ACESSIBILIDADE1`
    FOREIGN KEY (`DIM_ACESSIBILIDADE_ID`)
    REFERENCES `dw_escolacenso`.`DIM_ACESSIBILIDADE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_INFRAESTRUTURA_DIM_INTERNET1`
    FOREIGN KEY (`DIM_INTERNET_ID`)
    REFERENCES `dw_escolacenso`.`DIM_INTERNET` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FATO_INFRAESTRUTURA_DIM_DEPENDENCIA1`
    FOREIGN KEY (`DIM_DEPENDENCIA_ID`)
    REFERENCES `dw_escolacenso`.`DIM_DEPENDENCIA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
