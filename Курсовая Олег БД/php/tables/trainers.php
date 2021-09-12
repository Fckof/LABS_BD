<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `тренера`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:black;font-size:21px;margin:20px auto;border:2px solid black;'><th>ID тренера</th><th>ФИО тренера</th><th>Специализация</th><th>Категория</th><th>Паспортные данные</th><th>ID адреса</th><th>Дата рождения</th><th>Телефонный номер</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID тренера"]."</td><td>".$row["ФИО тренера"]."</td><td>".$row["Специализация"]."</td><td>".$row["Категория"]."</td><td>".$row["Паспортные данные"]."</td><td>".$row["ID адреса"]."</td><td>".$row["Дата рождения"]."</td><td>".$row["Номер телефона"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>