<?php 
	$userRoot = "root";
	$passRoot = "root";
	$servername="localhost";
	$database="gamedev";

$conn = new mysqli($servername, $userRoot, $passRoot, $database) or die("Не подрубилось...");

$result=$conn->query("SELECT `исполнители`.`Фамилия`, `исполнители`.`Имя`, `исполнители`.`Отчество`, `команда проекта`.`Оклад за этап` FROM `исполнители` INNER JOIN `команда проекта` ON `исполнители`.`ID исполнителя` = `команда проекта`.`ID исполнителя`");

if (count($result)==0){
		echo "Нет записей";
	}
	print "<h1 style='text-align:center;color:white;'>Зарплаты исполнителей</h1>";

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Оклад за этап</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Фамилия"]."</td><td>".$row["Имя"]."</td><td>".$row["Отчество"]."</td><td>".$row["Оклад за этап"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>