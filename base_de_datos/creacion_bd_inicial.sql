CREATE SCHEMA `bdb_arquitecotizacion` DEFAULT CHARACTER SET utf8 ;
USE `bdb_arquitecotizacion` ;

-- Table `bdb_arquitecotizacion`.`cliente`

CREATE TABLE `bdb_arquitecotizacion`.`cliente` (
`cliente_id` INT(11) NOT NULL AUTO_INCREMENT,
`cliente_name` VARCHAR(50) NOT NULL,
`cliente_telf` VARCHAR(12) NOT NULL,
`cliente_activo` TINYINT NOT NULL,
PRIMARY KEY (`cliente_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Table `bdb_arquitecotizacion`.`obra_material`

CREATE TABLE `bdb_arquitecotizacion`.`obra_material` (
`obra_material_id` INT(11) NOT NULL,
`obra_material_arena` DECIMAL(12,2) NOT NULL,
`obra_material_ladrillos` DECIMAL(12,2) NOT NULL,
`obra_material_ceramica` DECIMAL(12,2) NOT NULL,
`obra_material_pintura` DECIMAL(12,2) NOT NULL,
`obra_material_extras` DECIMAL(12,2) NOT NULL,
`obra_material_total` DECIMAL(12,2) NOT NULL,
PRIMARY KEY (`obra_material_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Table `bdb_arquitecotizacion`.`obra`

CREATE TABLE `bdb_arquitecotizacion`.`obra` (
`obra_id` INT(11) NOT NULL,
`obra_arquitecto` VARCHAR(35) NOT NULL,
`obra_area` DECIMAL(7,3) NOT NULL,
`obra_direccion` TEXT NOT NULL,
`obra_imgLink` TEXT NOT NULL,
`obra_material_id` INT(11) NOT NULL,
PRIMARY KEY (`obra_id`),
INDEX `obra_obra_material_idx` (`obra_material_id` ASC) VISIBLE,
CONSTRAINT `fk_obra_obramaterial`
FOREIGN KEY (`obra_material_id`)
REFERENCES `bdb_arquitecotizacion`.`obra_material` (`obra_material_id`)
ON DELETE NO ACTION
ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Table `bdb_arquitecotizacion`.`cotizacion`

CREATE TABLE `bdb_arquitecotizacion`.`cotizacion` (
`cotizacion_id` INT(11) NOT NULL,
`cotizacion_concepto` TEXT NOT NULL,
`cotizacion_encargado` VARCHAR(35) NOT NULL,
`cotizacion_pagoTarjeta` TINYINT(4) NOT NULL,
`cotizacion_total` DECIMAL(12,2) NOT NULL,
`cliente_id` INT(11) NOT NULL,
`obra_id` INT(11) NOT NULL,
PRIMARY KEY (`cotizacion_id`),
CONSTRAINT `fk_cotizacion_cliente`
FOREIGN KEY (`cliente_id`)
REFERENCES `bdb_arquitecotizacion`.`cliente` (`cliente_id`)
ON DELETE NO ACTION
ON UPDATE CASCADE,
CONSTRAINT `fk_cotizacion_obra`
FOREIGN KEY (`obra_id`)
REFERENCES `bdb_arquitecotizacion`.`obra` (`obra_id`)
ON DELETE NO ACTION
ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;