<?php 
include "../connect.php";
$result=$conn->query("CALL `Всего продано единиц товаров каждым продавцом`();");

if (count($result)==0){
		echo "Нет записей";
	}

$data=array();

	while ($row=$result->fetch_assoc()) {
		$data[]=$row;
		
	}
	
	echo json_encode($data, JSON_UNESCAPED_UNICODE);

$conn->close();
 ?>