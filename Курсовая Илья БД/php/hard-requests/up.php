<?php 

include "../connect.php";

$id=$_POST['id'];
$newcost=$_POST['newcost'];


      // echo "<script>console.log('".$name." | ".$surname." | ".$fathername." | ".$position."');</script>";


 $result=$conn->query("call `обновить_стоимость_аппаратуры`('$id','$newcost')");
      	

	if ($result) {
      echo "<script>alert('Данные обновлены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }
 $conn->close();
 ?> 