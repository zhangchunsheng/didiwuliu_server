-- 2013-03-01
CREATE TABLE dict_citys(
	id INT(10) NOT NULL AUTO_INCREMENT,
	cityCode VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'cityCode',
	cityName VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'cityName',
	spellName VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'spellName',
	customCode VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'customCode',
	parentCode VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'parentCode',
	parentId INT(10) NOT NULL DEFAULT 0 COMMENT 'parentId',
	`level` INT(1) NOT NULL DEFAULT 1 COMMENT 'level 1 - 省级 2 - 市级 3 - 县级',
	`date` INT(10) NOT NULL DEFAULT 0 COMMENT '日期',
	bz INT(10) NOT NULL DEFAULT 0 COMMENT '1 - 可用 2 - 不可用',
	PRIMARY KEY(id)
);

CREATE TABLE dict_category(
	id INT(10) NOT NULL AUTO_INCREMENT,
	categoryName VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'categoryName',
	`date` INT(10) NOT NULL DEFAULT 0 COMMENT '日期',
	bz INT(10) NOT NULL DEFAULT 0 COMMENT '1 - 可用 2 - 不可用',
	PRIMARY KEY(id)
);

CREATE TABLE dict_items(
	id INT(10) NOT NULL AUTO_INCREMENT,
	itemName VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'itemName',
	categoryId INT(10) NOT NULL DEFAULT 0 COMMENT 'categoryId',
	categoryName VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'categoryName',
	`date` INT(10) NOT NULL DEFAULT 0 COMMENT '日期',
	bz INT(10) NOT NULL DEFAULT 0 COMMENT '1 - 可用 2 - 不可用',
	PRIMARY KEY(id)
);

SELECT * FROM dict_citys;
SELECT * FROM dict_category;
SELECT * FROM dict_items;