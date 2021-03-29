<?php 
$name=$_POST['name'];
$exeid=$_POST['exeid'];


 $conn=new mysqli('localhost','root','root','gamedev') or die("Не подключилось..");

 $result=$conn->query("DELETE FROM `исполнители` WHERE `Имя`='$name' and `ID исполнителя`=$exeid");
      	
	if ($result) {
      echo "<script>alert('Данные удалены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }
 $conn->close();
 ?> 