-- Optimized SQL schema for MariaDB (renamed user -> recipeuser)

CREATE TABLE `subscriberlist` (
    `subscriberlistid` INT NOT NULL AUTO_INCREMENT,
    `subscriberid` VARCHAR(32) NOT NULL,
    `userid` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`subscriberlistid`)
);

CREATE TABLE `recipeuser` (
    `userid` VARCHAR(32) NOT NULL,
    `userpw` VARCHAR(64) NULL,
    `nickname` VARCHAR(32) NULL,
    `username` VARCHAR(64) NULL,
    `useremail` VARCHAR(64) NULL,
    `usertel` VARCHAR(16) NULL,
    `userbirth` DATE NULL,
    `accesslevel` VARCHAR(16) NULL,
    `recentlogindate` DATE NULL,
    `changepwdate` DATE NULL,
    `signupdate` DATE NULL,
    `userdeactivate` TINYINT(1) NULL,
    `userdeactivatedate` DATE NULL,
    PRIMARY KEY (`userid`)
);

CREATE TABLE `banrecord` (
    `bancode` INT NOT NULL AUTO_INCREMENT,
    `userid` VARCHAR(32) NOT NULL,
    `bantype` VARCHAR(32) NULL,
    `bancontent` TEXT NULL,
    `bandate` DATE NULL,
    `releasedate` DATE NULL,
    `isrelease` TINYINT(1) NULL,
    PRIMARY KEY (`bancode`, `userid`),
    FOREIGN KEY (`userid`) REFERENCES `recipeuser` (`userid`)
);

CREATE TABLE `categorytype` (
    `maincategoryid` INT NOT NULL AUTO_INCREMENT,
    `maincategoryname` VARCHAR(16) NULL,
    PRIMARY KEY (`maincategoryid`)
);

CREATE TABLE `recipepost` (
    `recipeid` INT NOT NULL AUTO_INCREMENT,
    `recipetitle` VARCHAR(64) NULL,
    `recipecontent` MEDIUMTEXT NULL,
    `recipewritedate` DATE NULL,
    `recipefixdate` DATE NULL,
    `recipeviews` INT NULL,
    `ishotdisplay` TINYINT(1) NULL,
    `isbestdisplay` TINYINT(1) NULL,
    `isprivate` TINYINT(1) NULL,
    `recipedeactivate` TINYINT(1) NULL,
    `recipedeactivatedate` DATE NULL,
    `isreport` TINYINT(1) NULL,
    `writerid` VARCHAR(32) NULL,
    `subcategoryid` INT NULL,
    `subcategoryname` VARCHAR(16) NULL,
    `maincategoryid` INT NOT NULL,
    `userid` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`recipeid`),
    FOREIGN KEY (`maincategoryid`) REFERENCES `categorytype` (`maincategoryid`),
    FOREIGN KEY (`userid`) REFERENCES `recipeuser` (`userid`)
);

CREATE TABLE `recipecomment` (
    `recipecommentid` INT NOT NULL AUTO_INCREMENT,
    `recipeid` INT NOT NULL,
    `commentwriterid` VARCHAR(32) NULL,
    `commentcontent` TEXT NULL,
    `commentdate` DATE NULL,
    `commentdeactivate` TINYINT(1) NULL,
    `commentdeactivatedate` DATE NULL,
    `isreport` TINYINT(1) NULL,
    `userid` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`recipecommentid`, `recipeid`),
    FOREIGN KEY (`recipeid`) REFERENCES `recipepost` (`recipeid`),
    FOREIGN KEY (`userid`) REFERENCES `recipeuser` (`userid`)
);

CREATE TABLE `recipereply` (
    `recipereplyid` INT NOT NULL AUTO_INCREMENT,
    `recipecommentid` INT NOT NULL,
    `recipeid` INT NOT NULL,
    `replywriterid` VARCHAR(32) NULL,
    `commentcontent` TEXT NULL,
    `commentdate` DATE NULL,
    `commentdeactivate` TINYINT(1) NULL,
    `commentdeactivatedate` DATE NULL,
    `isreport` TINYINT(1) NULL,
    `userid` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`recipereplyid`, `recipecommentid`, `recipeid`),
    FOREIGN KEY (`recipecommentid`, `recipeid`) REFERENCES `recipecomment` (`recipecommentid`, `recipeid`),
    FOREIGN KEY (`userid`) REFERENCES `recipeuser` (`userid`)
);

CREATE TABLE `recipesequence` (
    `recipestepid` INT NOT NULL AUTO_INCREMENT,
    `recipeid` INT NOT NULL,
    `recipestep` INT NULL,
    `explain` TEXT NULL,
    `recipevidlink` VARCHAR(2048) NULL,
    `ingactivate` TINYINT(1) NULL,
    `toolactivate` TINYINT(1) NULL,
    `fireactivate` TINYINT(1) NULL,
    `tipactivate` TINYINT(1) NULL,
    `ingexp` TEXT NULL,
    `toolexp` TEXT NULL,
    `fireexp` TEXT NULL,
    `tipexp` TEXT NULL,
    PRIMARY KEY (`recipestepid`, `recipeid`),
    FOREIGN KEY (`recipeid`) REFERENCES `recipepost` (`recipeid`)
);

CREATE TABLE `subscriber` (
    `subscriberid` VARCHAR(32) NOT NULL,
    `userid` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`subscriberid`),
    FOREIGN KEY (`userid`) REFERENCES `recipeuser` (`userid`)
);

CREATE TABLE `ingredients` (
    `recipeid` INT NOT NULL,
    `ingorder` INT NOT NULL,
    `ingquantity` INT NULL,
    `unit` VARCHAR(32) NULL,
    `exp` TEXT NULL,
    PRIMARY KEY (`recipeid`, `ingorder`),
    FOREIGN KEY (`recipeid`) REFERENCES `recipepost` (`recipeid`)
);

CREATE TABLE `question` (
    `questionid` INT NOT NULL AUTO_INCREMENT,
    `questiontitle` VARCHAR(64) NULL,
    `questioncontent` MEDIUMTEXT NULL,
    `questiondate` DATE NULL,
    `questionfixdate` DATE NULL,
    `questiondeactivate` TINYINT(1) NULL,
    `questiondeactivatedate` DATE NULL,
    `userid` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`questionid`),
    FOREIGN KEY (`userid`) REFERENCES `recipeuser` (`userid`)
);

CREATE TABLE `answer` (
    `answerid` INT NOT NULL AUTO_INCREMENT,
    `questionid` INT NOT NULL,
    `answererid` VARCHAR(32) NULL,
    `answercontent` MEDIUMTEXT NULL,
    `answerdate` DATE NULL,
    `answerdeactivate` TINYINT(1) NULL,
    `answerdeactivatedate` DATE NULL,
    `userid` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`answerid`, `questionid`),
    FOREIGN KEY (`questionid`) REFERENCES `question` (`questionid`),
    FOREIGN KEY (`userid`) REFERENCES `recipeuser` (`userid`)
);

CREATE TABLE `recipefavorites` (
    `favoritesid` INT NOT NULL AUTO_INCREMENT,
    `isfavorite` TINYINT(1) NULL,
    `recipeid` INT NOT NULL,
    `userid` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`favoritesid`),
    FOREIGN KEY (`recipeid`) REFERENCES `recipepost` (`recipeid`),
    FOREIGN KEY (`userid`) REFERENCES `recipeuser` (`userid`)
);

CREATE TABLE `userloginstate` (
    `userid` VARCHAR(32) NOT NULL,
    `islogin` TINYINT(1) NULL,
    `wrongnum` INT NULL,
    `blocklogin` TINYINT(1) NULL,
    `blockdate` DATE NULL,
    PRIMARY KEY (`userid`),
    FOREIGN KEY (`userid`) REFERENCES `recipeuser` (`userid`)
);

CREATE TABLE `recipetag` (
    `recipeid` INT NOT NULL,
    `tagorder` INT NOT NULL,
    `tagname` VARCHAR(64) NULL,
    PRIMARY KEY (`recipeid`, `tagorder`),
    FOREIGN KEY (`recipeid`) REFERENCES `recipepost` (`recipeid`)
);

CREATE TABLE `attachment` (
    `attachmentid` INT NOT NULL AUTO_INCREMENT,
    `fileorder` INT NULL,
    `filename` VARCHAR(256) NULL,
    `fileext` VARCHAR(8) NULL,
    `Field4` VARCHAR(255) NULL,
    `Field5` VARCHAR(255) NULL,
    `recipeid` INT NULL,
    `recipestepid` INT NULL,
    `announcementid` INT NULL,
    `questionid` INT NULL,
    PRIMARY KEY (`attachmentid`),
    FOREIGN KEY (`recipeid`) REFERENCES `recipepost` (`recipeid`),
    FOREIGN KEY (`announcementid`) REFERENCES `announcement` (`announcementid`),
    FOREIGN KEY (`questionid`) REFERENCES `question` (`questionid`)
);

CREATE TABLE `announcement` (
    `announcementid` INT NOT NULL AUTO_INCREMENT,
    `announcementtitle` VARCHAR(64) NULL,
    `announcementcontent` MEDIUMTEXT NULL,
    `announcementdate` DATE NULL,
    `announcementfixdate` DATE NULL,
    `announcementview` INT NULL,
    `isimportant` TINYINT(1) NULL,
    `announcementwriterid` VARCHAR(32) NULL,
    `announcementdeactivate` TINYINT(1) NULL,
    `announcementdeactivatedate` DATE NULL,
    `userid` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`announcementid`),
    FOREIGN KEY (`userid`) REFERENCES `recipeuser` (`userid`)
);

CREATE TABLE `recommend` (
    `recommendid` INT NOT NULL AUTO_INCREMENT,
    `isrecommend` TINYINT(1) NULL,
    `userid` VARCHAR(32) NOT NULL,
    `recipeid` INT NOT NULL,
    PRIMARY KEY (`recommendid`),
    FOREIGN KEY (`userid`) REFERENCES `recipeuser` (`userid`),
    FOREIGN KEY (`recipeid`) REFERENCES `recipepost` (`recipeid`)
);

CREATE TABLE `notification` (
    `notificationid` INT NOT NULL AUTO_INCREMENT,
    `userid` VARCHAR(32) NOT NULL,
    `type` ENUM('COMMENT','REPLY','SUBSCRIBE_POST') NOT NULL,
    `sourceid` INT NOT NULL,
    `message` VARCHAR(255) NOT NULL,
    `isread` TINYINT(1) DEFAULT 0,
    `createdat` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`notificationid`),
    FOREIGN KEY (`userid`) REFERENCES `recipeuser` (`userid`)
);
