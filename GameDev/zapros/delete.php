<?php 
include "../connect.php";

$exeid=$_POST['exeid'];

 $result=$conn->query("call deleteuser('$exeid')");
/*query("DELETE FROM `исполнители` WHERE `Имя`='$name' and `ID исполнителя`='$exeid'");*/
      	
	if ($result) {
      echo "<script>alert('Данные удалены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }
 $conn->close();
 ?> 