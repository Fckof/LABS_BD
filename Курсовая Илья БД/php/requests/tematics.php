<?php 
include "../connect.php";
$result=$conn->query("call `кол-во фильмов разных тематик`()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>Тематика</th><th>Количество фильмов</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Тематика"]."</td><td>".$row["Количество фильмов"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>