<?php 
include "../connect.php";

$name=$_POST['name'];
$id=$_POST['id'];


      

 $result=$conn->query("call `удалить источник`('$id','$name')");

	if ($result) {
      echo "<script>alert('Данные удалены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }

 $conn->close();
 ?> 