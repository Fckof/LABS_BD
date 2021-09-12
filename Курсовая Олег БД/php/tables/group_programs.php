<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `групповые программы`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:black;font-size:21px;margin:20px auto;border:2px solid black;'><th>ID программы</th><th>Наименование</th><th>Целевая группа</th><th>ПН</th><th>ВТ</th><th>СР</th><th>ЧТ</th><th>ПТ</th><th>СБ</th><th>ВС</th><th>ID зала</th><th>ID тренера</th><th>Продолжительность</th><th>Цена</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID программы"]."</td><td>".$row["Наименование"]."</td><td>".$row["Целевая группа"]."</td><td>".$row["ПН"]."</td><td>".$row["ВТ"]."</td><td>".$row["СР"]."</td><td>".$row["ЧТ"]."</td><td>".$row["ПТ"]."</td><td>".$row["СБ"]."</td><td>".$row["ВС"]."</td><td>".$row["ID зала"]."</td><td>".$row["ID тренера"]."</td><td>".$row["Продолжительность"]."</td><td>".$row["Цена"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>