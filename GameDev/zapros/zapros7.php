<?php 
	include "../connect.php";
include "../scroll.php";
$result=$conn->query("call zapros7()");/*query("SELECT `команда разработчиков`.`Название`, Count(`игры`.`Название`) AS `Количество`
FROM `команда разработчиков` INNER JOIN `игры` ON `команда разработчиков`.`ID разработчика` = `игры`.`ID разработчика`
GROUP BY `команда разработчиков`.`Название`");*/

if (count($result)==0){
		echo "Нет записей";
	}
	print "<h1 style='text-align:center;color:white;'>Количество игр у каждого разработчика</h1>";

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>Название</th><th>Количество</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Название"]."</td><td>".$row["Количество"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>