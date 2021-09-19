<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `обновление цены пиццы`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>Название</th><th>Старая стоимость</th><th>Новая стоимость</th><th>Дата до обновления</th><th>Дата обновления</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Название"]."</td><td>".$row["Старая цена"]."</td><td>".$row["Новая цена"]."</td><td>".$row["Дата до обновления"]."</td><td>".$row["Дата обновления"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>