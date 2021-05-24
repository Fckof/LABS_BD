<?php 
	include "../connect.php";

$result=$conn->query("CALL zapros1()");/*query("SELECT `игры`.`Название`, COUNT(`команда проекта`.`ID этапа`) AS `Количество`
FROM `игры` INNER JOIN `команда проекта` ON `игры`.`ID игры` = `команда проекта`.`ID игры`
GROUP BY `игры`.`Название`");*/

if (count($result)==0){
		echo "Нет записей";
	}
	print "<h1 style='text-align:center;color:white;'>За сколько этапов создали игру</h1>";

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>Название</th><th>Кол-во</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Название"]."</td><td>".$row["Количество"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>