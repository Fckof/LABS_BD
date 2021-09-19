<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `аренда_аппаратуры`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>Инвентарный_номер</th><th>Дата_аренды</th><th>ID_члена_группы</th><th>Срок_аренды</th><th>Дата_возврата</th><th>Возврат</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Инвентарный_номер"]."</td><td>".$row["Дата_аренды"]."</td><td>".$row["ID_члена_группы"]."</td><td>".$row["Срок_аренды"]."</td><td>".$row["Дата_возврата"]."</td><td>".$row["Возврат"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>