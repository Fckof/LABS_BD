<?php 
include "../connect.php";

$client=$_POST['client'];
$address=$_POST['address'];
$cour=$_POST['courier'];



      

 $result=$conn->query("call `Добавление нового заказа`('$cour','$address','$client')");

	if ($result) {
      echo "<script>alert('Данные добавлены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }

 $conn->close();
 ?> 