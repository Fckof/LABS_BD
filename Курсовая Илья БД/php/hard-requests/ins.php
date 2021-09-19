<?php 
include "../connect.php";

$name=$_POST['name'];
$id=$_POST['id'];
$budget=$_POST['budget'];
$istochnik=$_POST['istochnik'];


      

 $result=$conn->query("call `добавить источник финансирования`('$id','$istochnik','$name','$budget')");

	if ($result) {
      echo "<script>alert('Данные добавлены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }

 $conn->close();
 ?> 