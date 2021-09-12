<?php 
include "../connect.php";
$result=$conn->query("call возврат()");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>Инвентарный_номер</th><th>ID_члена_группы</th><th>Возврат</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Инвентарный_номер"]."</td><td>".$row["ID_члена_группы"]."</td><td>".$row["Возврат"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>