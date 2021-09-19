<?php 
include "../connect.php";
$result=$conn->query("call гонорар()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>ID_участника</th><th>Гонорар</th><th>Кол-во участий</th><th>Общий гонорар</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID_участника"]."</td><td>".$row["Гонорар"]."</td><td>".$row["Кол-во участий"]."</td><td>".$row["Общий гонорар"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>