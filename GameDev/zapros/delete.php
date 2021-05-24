<?php 
include "../connect.php";

$name=$_POST['name'];
$exeid=$_POST['exeid'];

 $result=$conn->query("call deleteuser('$exeid','$name')");
/*query("DELETE FROM `исполнители` WHERE `Имя`='$name' and `ID исполнителя`='$exeid'");*/
      	
	if ($result) {
      echo "<script>alert('Данные удалены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }
 $conn->close();
 ?> 