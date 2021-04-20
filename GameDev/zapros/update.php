<?php 
$gameid=$_POST['gameid'];
$rating=$_POST['rating'];


      // echo "<script>console.log('".$name." | ".$surname." | ".$fathername." | ".$position."');</script>";

 $conn=new mysqli('localhost','root','root','gamedev') or die("Не подключилось..");
 
 // $trigger="DROP TRIGGER IF EXISTS `rating_update`CREATE DEFINER=`root`@`localhost` TRIGGER `rating_update` BEFORE UPDATE ON `игры` FOR EACH ROW INSERT INTO `rating_temp` (`rating_temp`.`id`,`rating_temp`.`game_id`,`rating_temp`.`updated`,`rating_temp`.`old_rate`,`rating_temp`.`new_rate`,`rating_temp`.`game_name`) SELECT null,`ID игры`,NOW() as date, OLD.`Рейтинг`,NEW.`Рейтинг`, `игры`.`Название` FROM `игры` WHERE `ID игры`=$gameid";

 // $trig=$conn->query($trigger);

 $result=$conn->query("UPDATE `игры` SET `Рейтинг`='$rating' WHERE `ID игры`='$gameid'");
      	

	if ($result) {
      echo "<script>alert('Данные обновлены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }
 $conn->close();
 ?> 