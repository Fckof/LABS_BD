<?php 
include "../connect.php";
$result=$conn->query("call Группа()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:black;font-size:21px;margin:20px auto;border:2px solid black;'><th>Наименование</th><th>ФИО клиента</th><th>ФИО тренера</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Наименование"]."</td><td>".$row["ФИО клиента"]."</td><td>".$row["ФИО тренера"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>