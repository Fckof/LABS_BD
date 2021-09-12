<?php 
include "../connect.php";

$house=$_POST['house'];
$street=$_POST['street'];
$room=$_POST['room'];
$city=$_POST['city'];


      

 $result=$conn->query("call `Добавить_адрес`('$city','$street','$house','$room')");

	if ($result) {
      echo "<script>alert('Данные добавлены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }

 $conn->close();
 ?> 