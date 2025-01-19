-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doctor` (
  `DoctorID` INT NOT NULL,
  `Name` VARCHAR(20) NULL,
  `Date_of_birth` DATE NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` INT NULL,
  `Salary` DOUBLE NULL,
  `Specialist_specialist_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DoctorID`, `Specialist_specialist_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medical` (
  `Overtime` INT NULL,
  `MedicalID` INT NOT NULL,
  `Doctor_DoctorID` INT NOT NULL,
  `Doctor_Specialist_specialist_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MedicalID`, `Doctor_DoctorID`, `Doctor_Specialist_specialist_id`),
  INDEX `fk_Medical_Doctor1_idx` (`Doctor_DoctorID` ASC, `Doctor_Specialist_specialist_id` ASC) VISIBLE,
  CONSTRAINT `fk_Medical_Doctor1`
    FOREIGN KEY (`Doctor_DoctorID` , `Doctor_Specialist_specialist_id`)
    REFERENCES `mydb`.`Doctor` (`DoctorID` , `Specialist_specialist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Specialist` (
  `Field_Area` INT NULL,
  `specialist_id` INT NOT NULL,
  `Doctor_DoctorID` INT NOT NULL,
  `Doctor_Specialist_specialist_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`specialist_id`, `Doctor_DoctorID`, `Doctor_Specialist_specialist_id`),
  INDEX `fk_Specialist_Doctor1_idx` (`Doctor_DoctorID` ASC, `Doctor_Specialist_specialist_id` ASC) VISIBLE,
  CONSTRAINT `fk_Specialist_Doctor1`
    FOREIGN KEY (`Doctor_DoctorID` , `Doctor_Specialist_specialist_id`)
    REFERENCES `mydb`.`Doctor` (`DoctorID` , `Specialist_specialist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `Patient_ID` INT NOT NULL,
  `Name` INT NOT NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` INT NOT NULL,
  `Date_of_birth` DATE NOT NULL,
  PRIMARY KEY (`Patient_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Appointment` (
  `ApptDate` INT NOT NULL,
  `AppTime` INT NOT NULL,
  PRIMARY KEY (`ApptDate`, `AppTime`),
  INDEX `fk_Doctor_has_Patient_Patient1_idx` (`AppTime` ASC) VISIBLE,
  INDEX `fk_Doctor_has_Patient_Doctor_idx` (`ApptDate` ASC) VISIBLE,
  CONSTRAINT `fk_Doctor_has_Patient_Doctor`
    FOREIGN KEY (`ApptDate`)
    REFERENCES `mydb`.`Doctor` (`DoctorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_has_Patient_Patient1`
    FOREIGN KEY (`AppTime`)
    REFERENCES `mydb`.`Patient` (`Patient_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `Details` VARCHAR(45) NOT NULL,
  `Method` VARCHAR(45) NOT NULL,
  `id_payment` VARCHAR(45) NOT NULL,
  `Patient_Patient_ID` INT NOT NULL,
  PRIMARY KEY (`id_payment`, `Patient_Patient_ID`),
  INDEX `fk_Payment_Patient1_idx` (`Patient_Patient_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Payment_Patient1`
    FOREIGN KEY (`Patient_Patient_ID`)
    REFERENCES `mydb`.`Patient` (`Patient_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill` (
  `Total` INT NOT NULL,
  `Bill_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Bill_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bill_has_Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill_has_Payment` (
  `Bill_Bill_id` VARCHAR(45) NOT NULL,
  `Payment_id_payment` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Bill_Bill_id`, `Payment_id_payment`),
  INDEX `fk_Bill_has_Payment_Payment1_idx` (`Payment_id_payment` ASC) VISIBLE,
  INDEX `fk_Bill_has_Payment_Bill1_idx` (`Bill_Bill_id` ASC) VISIBLE,
  CONSTRAINT `fk_Bill_has_Payment_Bill1`
    FOREIGN KEY (`Bill_Bill_id`)
    REFERENCES `mydb`.`Bill` (`Bill_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bill_has_Payment_Payment1`
    FOREIGN KEY (`Payment_id_payment`)
    REFERENCES `mydb`.`Payment` (`id_payment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
