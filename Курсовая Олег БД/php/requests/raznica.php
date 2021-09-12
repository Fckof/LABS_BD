<?php 
include "../connect.php";
$result=$conn->query("call `разница между бюджетом и реальными затратами`()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>Окончательно название</th><th>Название_источника</th><th>Реальные_затраты</th><th>Бюджет</th><th>Разница</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Окончательно название"]."</td><td>".$row["Название_источника"]."</td><td>".$row["Реальные_затраты"]."</td><td>".$row["Бюджет"]."</td><td>".$row["Разница"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>