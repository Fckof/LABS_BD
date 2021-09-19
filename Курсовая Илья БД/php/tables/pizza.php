<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `пицца`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='text-align:center;color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>КодПиццы</th><th>Название</th><th>Вес</th><th>Стоимость</th><th>Размер</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["КодПиццы"]."</td><td>".$row["Название"]."</td><td>".$row["Вес"]."</td><td>".$row["Стоимость"]."</td><td>".$row["Размер"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>