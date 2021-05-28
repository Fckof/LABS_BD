<?php 

include "../connect.php";

$gameid=$_POST['gameid'];
$rating=$_POST['rating'];


      // echo "<script>console.log('".$name." | ".$surname." | ".$fathername." | ".$position."');</script>";


 $result=$conn->/*query("UPDATE `игры` SET `Рейтинг`='$rating' WHERE `ID игры`='$gameid'");*/query("call update_rating('$gameid','$rating')");
      	

	if ($result) {
      echo "<script>alert('Данные обновлены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }
 $conn->close();
 ?> 