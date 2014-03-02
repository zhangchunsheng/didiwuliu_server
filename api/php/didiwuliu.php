<?php
	define("DEBUG", true);
	define("STARTTIME", microtime());
	$_SGLOBAL = array();
	include("lib/MysqlUtil.class.php");
	
	$db = new MysqlUtil();
	$db -> charset = "utf8";
	$db -> connect("localhost:3306", "root", "root", "didiwuliu");
	
	$key = "cars";
	if(array_key_exists("key", $_GET)) {
		$key = $_GET["key"];
	}
	
	if($key == "cars") {
		$sql = "SELECT plateNumber_province,plateNumber_city,plateNumber,brand,queryPassword,province,city,purpose,carType,vanType,`length`,wide,height,maxCarry,hasGPS,hasInsurance,transportRoute,instruction,publishDate FROM didiwuliu_cars";
		$query = $db -> query($sql);
		$cars = array();
		while($row = $db -> fetch_array($query)) {
			$cars[] = $row;
		}
		echo json_encode($cars);
	} else {
		$sql = "SELECT `type`,category,roughWeight,volume,mannerOfPacking,transportCorridor,departure_province,departure_city,destination_province,destination_city,typeOfDelivery,freight,freightUnit,clearingForm,shipmentsDate,shipmentsDataType,instruction,publishDate FROM didiwuliu_cargos";
		$query = $db -> query($sql);
		$cargos = array();
		while($row = $db -> fetch_array($query)) {
			$cargos[] = $row;
		}
		echo json_encode($cargos);
	}
?>