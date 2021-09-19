<?php 
include "../connect.php";
$result=$conn->query("call `кол-во компаний`()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>Источник</th><th>Количество компаний</th><th>Общий бюджет</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Источник"]."</td><td>".$row["количество компаний"]."</td><td>".$row["Общий бюджет"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>