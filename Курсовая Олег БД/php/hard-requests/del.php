<?php 
include "../connect.php";

$id=$_POST['id'];


      

 $result=$conn->query("call `Удалить_адрес`('$id')");

	if ($result) {
      echo "<script>alert('Данные удалены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }

 $conn->close();
 ?> 