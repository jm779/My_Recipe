CREATE TABLE `recipepost` (
	`recipeid` INT NOT NULL AUTO_INCREMENT,
	`recipetitle` VARCHAR(64) NULL DEFAULT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`recipewritedate` DATETIME NULL DEFAULT (CURRENT_TIMESTAMP),
	`recipefixdate` DATETIME NULL DEFAULT (CURRENT_TIMESTAMP) ON UPDATE CURRENT_TIMESTAMP,
	`recipeviews` INT NULL DEFAULT '0',
	`recommend` INT NULL DEFAULT '0',
	`isprivate` TINYINT(1) NULL DEFAULT NULL,
	`maincategoryid` INT NOT NULL,
	`userid` VARCHAR(32) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (`recipeid`) USING BTREE,
	INDEX `maincategoryid` (`maincategoryid`) USING BTREE,
	INDEX `userid` (`userid`) USING BTREE,
	CONSTRAINT `recipepost_ibfk_1` FOREIGN KEY (`maincategoryid`) REFERENCES `categorytype` (`maincategoryid`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `recipepost_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `recipeuser` (`userid`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB
AUTO_INCREMENT=10
;
