<?php 
include "../scroll.php";
include "../connect.php";

$result=$conn->query("SELECT * FROM `команда проекта`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>ID команды</th><th>ID игры</th><th>ID исполнителя</th><th>ID роли</th><th>ID этапа</th><th>Оклад за этап</th><th>Начало этапа</th><th>Конец этапа</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID команды"]."</td><td>".$row["ID игры"]."</td><td>".$row["ID исполнителя"]."</td><td>".$row["ID роли"]."</td><td>".$row["ID этапа"]."</td><td>".$row["Оклад за этап"]."</td><td>".$row["Начало этапа"]."</td><td>".$row["Начало этапа"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>