<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `заказ`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='text-align:center;color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>КодЗаказа</th><th>Дата</th><th>Код_курьера</th><th>Код_адреса</th><th>Код_клиента</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["КодЗаказа"]."</td><td>".$row["Дата"]."</td><td>".$row["Код_курьера"]."</td><td>".$row["Код_адреса"]."</td><td>".$row["Код_клиента"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>