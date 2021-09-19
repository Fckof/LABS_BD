<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `участники съемочного процесса`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>ID_участника</th><th>ФИО</th><th>Должность</th><th>Паспортные данные</th><th>Номер_договора</th><th>Телефон</th><th>Гонорар</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID_участника"]."</td><td>".$row["ФИО"]."</td><td>".$row["Должность"]."</td><td>".$row["Паспортные данные"]."</td><td>".$row["Номер_договора"]."</td><td>".$row["Телефон"]."</td><td>".$row["Гонорар"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>