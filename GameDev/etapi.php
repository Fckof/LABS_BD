<?php 
	$userRoot = "root";
	$passRoot = "root";
	$servername="localhost";
	$database="gamedev";

$conn = new mysqli($servername, $userRoot, $passRoot, $database) or die("Не подрубилось...");

$result=$conn->query("SELECT * FROM `этапы`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>ID этапа</th><th>Название этапа</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID этапа"]."</td><td>".$row["Название этапа"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>