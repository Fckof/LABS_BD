<?php 
	$userRoot = "root";
	$passRoot = "root";
	$servername="localhost";
	$database="films";

$conn = new mysqli($servername, $userRoot, $passRoot, $database) or die("Не подрубилось...");

include "scroll.php";
 ?>
