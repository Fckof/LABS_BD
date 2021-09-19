<?php 
include "../connect.php";
$result=$conn->query("CALL `Клиенты которые заказали эту пиццу`()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='text-align:center;color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>КодКлиента</th><th>Фамилия</th><th>Имя</th><th>Отчество</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["КодКлиента"]."</td><td>".$row["Фамилия"]."</td><td>".$row["Имя"]."</td><td>".$row["Отчество"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>