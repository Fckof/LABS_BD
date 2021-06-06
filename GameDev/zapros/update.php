<?php 

include "../connect.php";

$gameid=$_POST['gameid'];
$rating=$_POST['rating'];

 $result=$conn->query("call update_rating('$gameid','$rating')");
 /*query("UPDATE `игры` SET `Рейтинг`='$rating' WHERE `ID игры`='$gameid'");*/
      	
	if ($result) {
      echo "<script>alert('Данные обновлены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }
 $conn->close();
 ?> 