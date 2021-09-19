<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `член съемочной группы`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>ID_члена_группы</th><th>ID_филм</th><th>ID_участника</th><th>Дата_приема</th><th>Дата_ухода</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID_члена_группы"]."</td><td>".$row["ID_филм"]."</td><td>".$row["ID_участника"]."</td><td>".$row["Дата_приема"]."</td><td>".$row["Дата_ухода"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>