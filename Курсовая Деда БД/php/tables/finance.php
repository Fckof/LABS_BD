<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `источники финансирования`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>ID_филм</th><th>Источник</th><th>Название_источника</th><th>Бюджет</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID_филм"]."</td><td>".$row["Источник"]."</td><td>".$row["Название_источника"]."</td><td>".$row["Бюджет"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>