<?php 
	include "../connect.php";
include "../scroll.php";
$result=$conn->query("SELECT * FROM `изменение цен игр`");

if (count($result)==0){
		echo "Нет записей";
	}
	print "<h1 style='text-align:center;color:white;'>Изменение цен</h1>";

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>Название игры</th><th>Старая цена</th><th>Новая цена</th><th>Дата до обновления</th><th>Дата обновления</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Название"]."</td><td>".$row["Старая цена"]."</td><td>".$row["Новая цена"]."</td><td>".$row["Дата до обновления"]."</td><td>".$row["Дата обновления"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>