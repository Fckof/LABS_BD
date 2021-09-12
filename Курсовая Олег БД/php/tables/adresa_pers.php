<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `адреса клиентов`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:black;font-size:21px;margin:20px auto;border:2px solid black;'><th>ID адреса</th><th>город</th><th>улица</th><th>дом</th><th>квартира</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID адреса"]."</td><td>".$row["город"]."</td><td>".$row["улица"]."</td><td>".$row["дом"]."</td><td>".$row["квартика"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>