<?php 
	$userRoot = "root";
	$passRoot = "root";
	$servername="localhost";
	$database="gamedev";

$conn = new mysqli($servername, $userRoot, $passRoot, $database) or die("Не подрубилось...");

$result=$conn->query("SELECT `роли`.`Название роли`, Count(`исполнители`.`ID исполнителя`) AS `Люди`
FROM `роли` INNER JOIN (`исполнители` INNER JOIN `команда проекта` ON `исполнители`.`ID исполнителя` = `команда проекта`.`ID исполнителя`) ON `роли`.`ID роли` = `команда проекта`.`ID роли`
GROUP BY `роли`.`Название роли`
");

if (count($result)==0){
		echo "Нет записей";
	}
	print "<h1 style='text-align:center;color:white;'>Популярность ролей</h1>";

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>Название роли</th><th>Люди</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Название роли"]."</td><td>".$row["Люди"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>