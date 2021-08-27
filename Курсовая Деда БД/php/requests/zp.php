<?php 
include "../connect.php";
$result=$conn->query("call `зп за все время работы`()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>ID_участника</th><th>Гонорар</th><th>Дата_приема</th><th>Дата_ухода</th><th>Гонорар за все время</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID_участника"]."</td><td>".$row["Гонорар"]."</td><td>".$row["Дата_приема"]."</td><td>".$row["Дата_ухода"]."</td><td>".$row["Гонорар за все время"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>