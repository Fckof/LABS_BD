<?php 
include "../connect.php";
include "../scroll.php";
$result=$conn->query("SELECT * FROM `должности`");
//$data=new array();
if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>ID должности</th><th>Название должности</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID должности"]."</td><td>".$row["Название должности"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>