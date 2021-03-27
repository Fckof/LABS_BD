<?php 
	$userRoot = "root";
	$passRoot = "root";
	$servername="localhost";
	$database="gamedev";

$conn = new mysqli($servername, $userRoot, $passRoot, $database) or die("Не подрубилось...");

$result=$conn->query("SELECT `игры`.`Название`, Count(`исполнители`.`ID исполнителя`) AS `Исполнители`
FROM `игры` INNER JOIN (`исполнители` INNER JOIN `команда проекта` ON `исполнители`.`ID исполнителя` = `команда проекта`.`ID исполнителя`) ON `игры`.`ID игры` = `команда проекта`.`ID игры`
GROUP BY `игры`.`Название`");

if (count($result)==0){
		echo "Нет записей";
	}
	print "<h1 style='text-align:center;color:white;'>Исполнителей на каждой игре</h1>";

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>Название</th><th>Исполнители</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Название"]."</td><td>".$row["Исполнители"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>