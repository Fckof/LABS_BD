<?php 
include "../connect.php";

$name=$_POST['name'];
$surname=$_POST['surname'];
$fathername=$_POST['fathername'];
$position=$_POST['position'];


      

 $result=$conn->query("call insert_user('$name','$surname','$fathername','$position')");/*query("INSERT INTO `исполнители` (`ID исполнителя`, `Фамилия`, `Имя`,`Отчество`,`ID должности`) VALUES (NULL, '$surname', '$name','$fathername','$position')");*/

	if ($result) {
      echo "<script>alert('Данные добавлены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }

 $conn->close();
 ?> 