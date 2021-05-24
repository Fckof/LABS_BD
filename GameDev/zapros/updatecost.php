<?php 

include "../connect.php";

$gameid=$_POST['gameid'];
$cost=$_POST['cost'];
 $result=$conn->/*query("UPDATE `игры` SET `Рейтинг`='$rating' WHERE `ID игры`='$gameid'");*/query("call updatecost('$gameid','$cost')");
      	

	if ($result) {
      echo "<script>alert('Данные обновлены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }
 $conn->close();
 ?> 