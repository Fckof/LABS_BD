<?php 
	$userRoot = "root";
	$passRoot = "root";
	$servername="localhost";
	$database="gamedev";

$conn = new mysqli($servername, $userRoot, $passRoot, $database) or die("Не подрубилось...");

$result=$conn->query("SELECT `команда разработчиков`.`Название`, Sum(`команда проекта`.`Оклад за этап`) AS `Затраты`
FROM `команда разработчиков` INNER JOIN (`игры` INNER JOIN `команда проекта` ON `игры`.`ID игры` = `команда проекта`.`ID игры`) ON `команда разработчиков`.`ID разработчика` = `игры`.`ID разработчика`
GROUP BY `команда разработчиков`.`Название`
ORDER BY Sum(`команда проекта`.`Оклад за этап`) DESC");

if (count($result)==0){
		echo "Нет записей";
	}
	print "<h1 style='text-align:center;color:white;'>Затраты разработчиков</h1>";

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>Название</th><th>Затраты</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Название"]."</td><td>".$row["Затраты"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>