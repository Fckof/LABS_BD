<?php 
	$userRoot = "root";
	$passRoot = "root";
	$servername="localhost";
	$database="gamedev";

$conn = new mysqli($servername, $userRoot, $passRoot, $database) or die("Не подрубилось...");

$result=$conn->query("SELECT * FROM `исполнители`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>ID исполнителя</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>ID должности</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID исполнителя"]."</td><td>".$row["Фамилия"]."</td><td>".$row["Имя"]."</td><td>".$row["Отчество"]."</td><td>".$row["ID должности"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>