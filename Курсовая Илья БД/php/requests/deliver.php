<?php 
include "../connect.php";
$result=$conn->query("CALL `Курьеры которые доставляли эту пиццу`()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='text-align:center;color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>КодКурьера</th><th>Фамилия</th><th>Имя</th><th>Отчество</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["КодКурьера"]."</td><td>".$row["Фамилия"]."</td><td>".$row["Имя"]."</td><td>".$row["Отчетсво"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>