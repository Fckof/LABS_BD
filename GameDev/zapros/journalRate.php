<?php 
	include "../connect.php";
include "../scroll.php";
$result=$conn->query("SELECT * FROM `изменение рейтинга`");

if (count($result)==0){
		echo "Нет записей";
	}
	print "<h1 style='text-align:center;color:white;'>Изменение рейтинга</h1>";

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>Название игры</th><th>Старый рейтинг</th><th>Новый рейтинг</th><th>Дата до обновления</th><th>Дата обновления</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Название"]."</td><td>".$row["Старый рейтинг"]."</td><td>".$row["Новый рейтинг"]."</td><td>".$row["Дата до обновления"]."</td><td>".$row["Дата обновления"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>