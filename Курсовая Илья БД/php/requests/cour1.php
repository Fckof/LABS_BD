<?php 
include "../connect.php";
$result=$conn->query("CALL `Пиццы которые доставлял этот курьер`()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='text-align:center;color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>КодКурьера</th><th>Название</th><th>Стоимость</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["КодКурьера"]."</td><td>".$row["Название"]."</td><td>".$row["Стоимость"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>