<?php 
include "../connect.php";
$result=$conn->query("call `какие фильмы частная компания финансирует`()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>Окончательно название</th><th>Источник</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Окончательно название"]."</td><td>".$row["Источник"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>