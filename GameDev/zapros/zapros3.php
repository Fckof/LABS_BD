<?php 
	$userRoot = "root";
	$passRoot = "root";
	$servername="localhost";
	$database="gamedev";

$conn = new mysqli($servername, $userRoot, $passRoot, $database) or die("Не подрубилось...");

$result=$conn->query("SELECT `игры`.`Название`, `этапы`.`Название этапа`, SUM(`команда проекта`.`Оклад за этап`) AS `Общая сумма` FROM `игры` INNER JOIN (`этапы` INNER JOIN `команда проекта` ON `этапы`.`ID этапа` = `команда проекта`.`ID этапа`) ON `игры`.`ID игры` = `команда проекта`.`ID игры`
GROUP BY `игры`.`Название`, `этапы`.`Название этапа`");

if (count($result)==0){
		echo "Нет записей";
	}
	print "<h1 style='text-align:center;color:white;'>Стоимость каждого этапа</h1>";

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>Название</th><th>Название этапа</th><th>Общая сумма</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Название"]."</td><td>".$row["Название этапа"]."</td><td>".$row["Общая сумма"]."</td><td>".$row["Оклад за этап"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>