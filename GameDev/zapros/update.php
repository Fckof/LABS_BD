<?php 
$gameid=$_POST['gameid'];
$rating=$_POST['rating'];


      // echo "<script>console.log('".$name." | ".$surname." | ".$fathername." | ".$position."');</script>";

 $conn=new mysqli('localhost','root','root','gamedev') or die("Не подключилось..");

 $result=$conn->query("UPDATE `игры` SET `Рейтинг`='$rating' WHERE `ID игры`='$gameid'");
      	
	if ($result) {
      echo "<script>alert('Данные обновлены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }
 $conn->close();
 ?> 