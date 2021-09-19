<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `аппаратура`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='text-align:center;color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>ID_филм</th><th>ID_аппаратуры</th><th>Наименование</th><th>Год_выпуска</th><th>Инвентарный_номер</th><th>Стоимость_аренды</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID_филм"]."</td><td>".$row["ID_аппаратуры"]."</td><td>".$row["Наименование"]."</td><td>".$row["Год_выпуска"]."</td><td>".$row["Инвентарный_номер"]."</td><td>".$row["Стоимость_аренды"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>