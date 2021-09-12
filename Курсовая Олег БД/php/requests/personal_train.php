<?php 
include "../connect.php";
$result=$conn->query(" CALL `Поиск_по_инд_тренировке`()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:black;font-size:21px;margin:20px auto;border:2px solid black;'><th>ФИО клиента</th><th>№ карты</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ФИО клиента"]."</td><td>".$row["№ карты"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>