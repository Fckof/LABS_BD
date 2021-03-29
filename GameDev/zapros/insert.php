<?php 
$name=$_POST['name'];
$surname=$_POST['surname'];
$fathername=$_POST['fathername'];
$position=$_POST['position'];


      // echo "<script>console.log('".$name." | ".$surname." | ".$fathername." | ".$position."');</script>";

 $conn=new mysqli('localhost','root','root','gamedev') or die("Не подключилось..");

 $result=$conn->query("INSERT INTO `исполнители` (`ID исполнителя`, `Фамилия`, `Имя`,`Отчество`,`ID должности`) VALUES (NULL, '$surname', '$name','$fathername','$position')");

	if ($result) {
      echo "<script>alert('Данные добавлены');</script>";
    }else{
    	echo "<script>alert('Ошибка');</script>";
    }

 $conn->close();
 ?> 