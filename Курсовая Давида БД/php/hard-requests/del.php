<?php 
include "../connect.php";

$id=$_POST['id'];


      

 $result=$conn->query("call `удалить_продавца`('$id')");

	if ($result) {
      echo "Данные удалены";
    }else{
    	echo "Ошибка";
    }

 $conn->close();
 ?> 