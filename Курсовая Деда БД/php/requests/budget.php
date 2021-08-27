<?php 
include "../connect.php";
$result=$conn->query("call бюджеты_на_тематики()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>Тематика</th><th>Бюджет</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Тематика"]."</td><td>".$row["Бюджет"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>