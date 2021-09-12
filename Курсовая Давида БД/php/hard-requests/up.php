<?php 

include "../connect.php";

$id=$_POST['id'];
$newcost=$_POST['newcost'];

 $result=$conn->query("call `обновить_цену_смартфона`('$newcost','$id')");
      	

	if ($result) {
      echo "Данные обновлены";
    }else{
    	echo "Ошибка";
    }
 $conn->close();
 ?> 