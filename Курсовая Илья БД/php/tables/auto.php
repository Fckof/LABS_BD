<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `автомобиль`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='text-align:center;color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>КодАвтомобиля</th><th>Регистрационный номер</th><th>Дата последнего ТО</th><th>Цвет</th><th>МаркаАвтомобиля</th><th>Год выпуска</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["КодАвтомобиля"]."</td><td>".$row["Регистрационный номер"]."</td><td>".$row["Дата последнего ТО"]."</td><td>".$row["Цвет"]."</td><td>".$row["МаркаАвтомобиля"]."</td><td>".$row["Год выпуска"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>