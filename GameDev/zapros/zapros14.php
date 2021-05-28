<?php 
	include "../connect.php";
include "../scroll.php";
$result=$conn->query("call zapros14()");/*query("SELECT * FROM `исполнители` INNER JOIN `должности` ON `должности`.`ID должности`=`исполнители`.`ID должности` WHERE `Имя` LIKE 'И%' ");*/

if (count($result)==0){
		echo "Нет записей";
	}
	print "<h1 style='text-align:center;color:white;'>Исполнители с первой `И` в имени</h1>";

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>ID исполнителя</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Название должности</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID исполнителя"]."</td><td>".$row["Фамилия"]."</td><td>".$row["Имя"]."</td><td>".$row["Отчество"]."</td><td>".$row["Название должности"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>