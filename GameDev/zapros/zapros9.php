<?php 
	include "../connect.php";
include "../scroll.php";
$result=$conn->query("call zapros9()");/*query("SELECT DISTINCT `игры`.`Название`, Sum(`команда проекта`.`Оклад за этап`) AS `Стоимость`
FROM игры INNER JOIN `команда проекта` ON `игры`.`ID игры` = `команда проекта`.`ID игры`
GROUP BY `игры`.`Название`
");*/

if (count($result)==0){
		echo "Нет записей";
	}
	print "<h1 style='text-align:center;color:white;'>Стоимость игр</h1>";

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>Название</th><th>Стоимость</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Название"]."</td><td>".$row["Стоимость"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>