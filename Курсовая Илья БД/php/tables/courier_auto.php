<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `курьеравтомобиль`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='text-align:center;color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>КодКурьера</th><th>КодАвтомобиля</th><th>ДатаЗакреп</th><th>ДатаОткреп</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["КодКурьера"]."</td><td>".$row["КодАвтомобиля"]."</td><td>".$row["ДатаЗакреп"]."</td><td>".$row["ДатаОткреп"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>