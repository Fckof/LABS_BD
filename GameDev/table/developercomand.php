<?php 
include "../scroll.php";
include "../connect.php";

$result=$conn->query("SELECT * FROM `команда разработчиков`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>ID разработчика</th><th>Название</th><th>Дата начала работы</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID разработчика"]."</td><td>".$row["Название"]."</td><td>".$row["Дата начала работы"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>