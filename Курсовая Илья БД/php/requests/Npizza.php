<?php 
include "../connect.php";
$id=$_POST['id'];

$result=$conn->query("CALL `Отображение сотрудников которые доставили больше N пицц`($id)");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='text-align:center;color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>КодКурьера</th><th>Фамилия</th><th>Имя</th><th>Отчество</th><th>Доставок</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["КодКурьера"]."</td><td>".$row["Фамилия"]."</td><td>".$row["Имя"]."</td><td>".$row["Отчетсво"]."</td><td>".$row["Доставок"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>