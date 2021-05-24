<?php 
	include "../connect.php";

$result=$conn->query("call zapros5()");/*query("SELECT `Должности`.`Название должности`, Sum(`Команда проекта`.`Оклад за этап`) AS `Общий оклад`
FROM (`должности` INNER JOIN `исполнители` ON `должности`.`ID должности` = `исполнители`.`ID должности`) INNER JOIN `команда проекта` ON `исполнители`.`ID исполнителя` = `команда проекта`.`ID исполнителя`
GROUP BY `должности`.`Название должности`
ORDER BY Sum(`команда проекта`.`Оклад за этап`) DESC;
");*/

if (count($result)==0){
		echo "Нет записей";
	}
	print "<h1 style='text-align:center;color:white;'>Оплата должностей</h1>";

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>Название должности</th><th>Общий оклад</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Название должности"]."</td><td>".$row["Общий оклад"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>