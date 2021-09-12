<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `заявки`");

if (count($result)==0){
		echo "Нет записей";
	}

$data=array();

	while ($row=$result->fetch_assoc()) {
		$data[]=$row;
		//echo $row;
	}
	
	//echo count($result);
	echo json_encode($data, JSON_UNESCAPED_UNICODE);
	//print_r($data);

$conn->close();
 ?>