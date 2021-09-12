<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `абонемент`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:black;font-size:21px;margin:20px auto;border:2px solid black;'><th>№ карты</th><th>Акция*</th><th>Скидка</th><th>Срок</th><th>Дата покупки</th><th>Дата активации</th><th>Дата окончания</th><th>Стоимость</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["№ карты"]."</td><td>".$row["Акция*"]."</td><td>".$row["Скидка"]."</td><td>".$row["Срок"]."</td><td>".$row["Дата покупки"]."</td><td>".$row["Дата активации"]."</td><td>".$row["Дата окончания"]."</td><td>".$row["Стоимость"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>