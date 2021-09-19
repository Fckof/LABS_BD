<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `клиент`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='text-align:center;color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>КодКлиента</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Адрес</th><th>Метро</th><th>КодОтДомофона</th><th>Подъезд</th><th>Этаж</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["КодКлиента"]."</td><td>".$row["Фамилия"]."</td><td>".$row["Имя"]."</td><td>".$row["Отчество"]."</td><td>".$row["Адрес"]."</td><td>".$row["Метро"]."</td><td>".$row["КодОтДомофона"]."</td><td>".$row["Подъезд"]."</td><td>".$row["Этаж"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>