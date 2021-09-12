<?php 
include "../connect.php";

$name=$_POST['name'];
$id=$_POST['id'];


      

 $result=$conn->query("call `добавить_продавца`('$name', '$id')");

	if ($result) {
      echo "Данные добавлены";
    }else{
    	echo "Ошибка";
    }

 $conn->close();
 ?> 