<?php 
include "../scroll.php";
include "../connect.php";

$result=$conn->query("SELECT * FROM `роли`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>ID роли</th><th>Название роли</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID роли"]."</td><td>".$row["Название роли"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>