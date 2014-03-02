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
ALTER TABLE dict_category ADD COLUMN tableName VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'tableName';
ALTER TABLE dict_category ADD COLUMN columnName VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'columnName';
SELECT * FROM dict_category;

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

CREATE TABLE dict_enums(
	id INT(10) NOT NULL AUTO_INCREMENT,
	enumId INT(10) NOT NULL DEFAULT 0 COMMENT 'enumId',
	enumName VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'itemName',
	tableName VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'tableName',
	columnName VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'columnName',
	`date` INT(10) NOT NULL DEFAULT 0 COMMENT '日期',
	bz INT(10) NOT NULL DEFAULT 0 COMMENT '1 - 可用 2 - 不可用',
	PRIMARY KEY(id)
);
SELECT * FROM dict_enums;

CREATE TABLE didiwuliu_user(
	id INT(10) NOT NULL AUTO_INCREMENT,
	loginName VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'loginName',
	`password` VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'password',
	email VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'email',
	realName VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'realName',
	`type` INT(1) NOT NULL DEFAULT 0 COMMENT '类型 1 - 个人会员 2 - 物流公司 3 - 物流园区 4 - 生产贸易企业',
	role INT(1) NOT NULL DEFAULT 0 COMMENT '角色 1 - 车主 2 - 货主 3 - 配货商 4 - 其他',
	province INT(10) NOT NULL DEFAULT 0 COMMENT 'province',
	city INT(10) NOT NULL DEFAULT 0 COMMENT 'city',
	phoneNum BIGINT(10) NOT NULL DEFAULT 0 COMMENT 'phoneNum',
	telephone VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'telephone',
	fax VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'fax',
	postCode VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'postCode',
	qq VARCHAR(60) NOT NULL DEFAULT '' COMMENT 'qq',
	address VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'address',
	website VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'website',
	`registerDate` INT(10) NOT NULL DEFAULT 0 COMMENT '注册日期',
	`validEmailDate` INT(10) NOT NULL DEFAULT 0 COMMENT '验证邮箱日期',
	`validPhoneDate` INT(10) NOT NULL DEFAULT 0 COMMENT '验证手机日期',
	`date` INT(10) NOT NULL DEFAULT 0 COMMENT '日期',
	bz INT(10) NOT NULL DEFAULT 0 COMMENT '1 - 可用 2 - 不可用',
	PRIMARY KEY(id)
);
SELECT * FROM didiwuliu_user;

CREATE TABLE didiwuliu_cars(
	id INT(10) NOT NULL AUTO_INCREMENT,
	plateNumber_province VARCHAR(10) NOT NULL DEFAULT 0 COMMENT '车牌 省的简称',
	plateNumber_city VARCHAR(10) NOT NULL DEFAULT 0 COMMENT '车牌 市的编码',
	plateNumber VARCHAR(10) NOT NULL DEFAULT '' COMMENT '车牌 提交后不可更改。如需修改请与客服联系 ',
	brand VARCHAR(60) NOT NULL DEFAULT '' COMMENT '如：解放、东风小霸王等',
	queryPassword VARCHAR(60) NOT NULL DEFAULT '' COMMENT '查询密码',
	province INT(10) NOT NULL DEFAULT 0 COMMENT 'province',
	city INT(10) NOT NULL DEFAULT 0 COMMENT 'city',
	purpose INT(10) NOT NULL DEFAULT 0 COMMENT '用途',
	carType INT(10) NOT NULL DEFAULT 0 COMMENT '车种',
	vanType INT(10) NOT NULL DEFAULT 0 COMMENT '厢形',
	`length` INT(10) NOT NULL DEFAULT 0 COMMENT '长 单位：米',
	wide INT(10) NOT NULL DEFAULT 0 COMMENT '宽 单位：米',
	height INT(10) NOT NULL DEFAULT 0 COMMENT '高 单位：米',
	maxCarry INT(10) NOT NULL DEFAULT 0 COMMENT '最大载重 单位：吨',
	picture TEXT COMMENT '图片',
	hasGPS INT(1) NOT NULL DEFAULT 0 COMMENT '是否有GPS 0 - 没有 1 - 有',
	hasInsurance INT(1) NOT NULL DEFAULT 0 COMMENT '是否有保险 0 - 没有 1 - 有',
	transportRoute INT(1) NOT NULL DEFAULT 0 COMMENT '运输路线 1 - 非固定线路 2 - 固定线路 3 - 专线',
	instruction VARCHAR(255) NOT NULL DEFAULT '' COMMENT '说明',
	`date` INT(10) NOT NULL DEFAULT 0 COMMENT '日期',
	bz INT(10) NOT NULL DEFAULT 0 COMMENT '1 - 可用 2 - 不可用',
	PRIMARY KEY(id)
);
DROP TABLE didiwuliu_cars;
SELECT * FROM didiwuliu_cars;
ALTER TABLE didiwuliu_cars ADD COLUMN publishDate INT(10) NOT NULL DEFAULT 0 COMMENT '发布日期';

CREATE TABLE didiwuliu_cargos(
	id INT(10) NOT NULL AUTO_INCREMENT,
	`type` INT(10) NOT NULL DEFAULT 0 COMMENT '分类',
	category INT(10) NOT NULL DEFAULT 0 COMMENT '类别',
	roughWeight DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '毛重，单位：吨',
	volume DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT '体积，单位：立方米',
	mannerOfPacking INT(10) NOT NULL DEFAULT 0 COMMENT '包装方式',
	transportCorridor INT(10) NOT NULL DEFAULT 0 COMMENT '运输通道',
	departure_province INT(10) NOT NULL DEFAULT 0 COMMENT '出发地 省份',
	departure_city INT(10) NOT NULL DEFAULT 0 COMMENT '出发地 市',
	destination_province INT(10) NOT NULL DEFAULT 0 COMMENT '目的地 省份',
	destination_city INT(10) NOT NULL DEFAULT 0 COMMENT '目的地 市',
	typeOfDelivery INT(10) NOT NULL DEFAULT 0 COMMENT '运送方式',
	freight INT(10) NOT NULL DEFAULT 0 COMMENT '运费',
	freightUnit INT(1) NOT NULL DEFAULT 0 COMMENT '运费单位 1 - 元/吨 2 - 元/车 3 - 元/方 4 - 面议',
	clearingForm VARCHAR(60) NOT NULL DEFAULT '' COMMENT '结算方式 如:现结，货到后付款，月结等',
	shipmentsDate INT(10) NOT NULL DEFAULT 0 COMMENT '发货日期',
	shipmentsDataType INT(1) NOT NULL DEFAULT 0 COMMENT '1 - 指定日期发货 2 - 有效期到',
	instruction VARCHAR(60) NOT NULL DEFAULT '' COMMENT '说明',
	publishDate INT(10) NOT NULL DEFAULT 0 COMMENT '发布日期',
	`date` INT(10) NOT NULL DEFAULT 0 COMMENT '日期',
	bz INT(10) NOT NULL DEFAULT 0 COMMENT '1 - 可用 2 - 不可用',
	PRIMARY KEY(id)
);
SELECT * FROM didiwuliu_cargos;
ALTER TABLE didiwuliu_cargos ADD COLUMN publishDate INT(10) NOT NULL DEFAULT 0 COMMENT '发布日期';

SELECT * FROM dict_citys WHERE parentCode=0;

-- 2013-03-02
SELECT * FROM dict_category;
SELECT * FROM dict_items;
SELECT COUNT(1) FROM dict_citys;

SELECT * FROM dict_citys;
TRUNCATE TABLE didiwuliu_cars;
SELECT UNIX_TIMESTAMP(NOW());
INSERT INTO didiwuliu_cars(plateNumber_province,plateNumber_city,plateNumber,brand,queryPassword,province,city,purpose,carType,
	vanType,`length`,wide,height,maxCarry,hasGPS,hasInsurance,transportRoute,instruction,publishDate) VALUES ('京','A','111111','大众',
	'111111',1,2,58,69,81,1,1,1,1,1,1,2,"hello",UNIX_TIMESTAMP(NOW()));
SELECT * FROM didiwuliu_cars;
SELECT plateNumber_province,plateNumber_city,plateNumber,brand,queryPassword,province,city,purpose,carType,vanType,`length`,wide,height,maxCarry,hasGPS,hasInsurance,transportRoute,instruction,publishDate FROM didiwuliu_cars;

INSERT INTO didiwuliu_cargos(`type`,category,roughWeight,volume,mannerOfPacking,transportCorridor,departure_province,departure_city,
	destination_province,destination_city,typeOfDelivery,freight,freightUnit,clearingForm,shipmentsDate,shipmentsDataType,instruction,publishDate) VALUES (
	92,104,1,1,110,118,1,2,1,2,125,1,1,'现结',UNIX_TIMESTAMP(NOW()),1,'hello',UNIX_TIMESTAMP(NOW())
	);
SELECT * FROM didiwuliu_cargos;
SELECT `type`,category,roughWeight,volume,mannerOfPacking,transportCorridor,departure_province,departure_city,destination_province,destination_city,typeOfDelivery,freight,freightUnit,clearingForm,shipmentsDate,shipmentsDataType,instruction,publishDate FROM didiwuliu_cargos;