<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `клиенты`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:black;font-size:21px;margin:20px auto;border:2px solid black;'><th>ID клиента</th><th>ФИО клиента</th><th>М</th><th>Ж</th><th>№ карты</th><th>Паспортные данные</th><th>ID адреса</th><th>Дата рождения</th><th>Телефонный номер</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID клиента"]."</td><td>".$row["ФИО клиента"]."</td><td>".$row["М"]."</td><td>".$row["Ж"]."</td><td>".$row["№ карты"]."</td><td>".$row["Паспортные данные"]."</td><td>".$row["ID адреса"]."</td><td>".$row["Дата рождения"]."</td><td>".$row["Телефонный номер"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>