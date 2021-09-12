<?php 
include "../connect.php";
$result=$conn->query("call `кол-во дней с решения о съемке`()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>Дата решения о съёмке</th><th>Дата премьеры</th><th>Дни</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Дата решения о съёмке"]."</td><td>".$row["Дата премьеры"]."</td><td>".$row["Дни"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>