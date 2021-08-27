<?php 
include "../connect.php";
$result=$conn->query("call аренда()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>Инвентарный_номер</th><th>Стоимость_аренды</th><th>Срок_аренды</th><th>Общая стоимость</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Инвентарный_номер"]."</td><td>".$row["Стоимость_аренды"]."</td><td>".$row["Срок_аренды"]."</td><td>".$row["Общая стоимость"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>