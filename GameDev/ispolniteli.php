<?php 
	$userRoot = "root";
	$passRoot = "root";
	$servername="localhost";
	$database="gamedev";

$conn = new mysqli($servername, $userRoot, $passRoot, $database) or die("Не подрубилось...");

$result=$conn->query("SELECT * FROM `игры`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>ID исполнителя</th><th>Фамилия</th><th>Название</th><th>Дата начала работы</th><th>Дата окончания работы</th><th>Дата выпуска</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID игры"]."</td><td>".$row["ID разработчика"]."</td><td>".$row["Название"]."</td><td>".$row["Дата начала работы"]."</td><td>".$row["Дата окончания работы"]."</td><td>".$row["Дата выпуска"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>