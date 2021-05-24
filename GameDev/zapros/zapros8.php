<?php 
	include "../connect.php";

$result=$conn->query("call zapros8()");/*query("SELECT `игры`.`Название`, Year(`игры`.`Дата окончания работы`)-Year(`игры`.`Дата начала работы`) AS `Лет` FROM `игры`");*/

if (count($result)==0){
		echo "Нет записей";
	}
	print "<h1 style='text-align:center;color:white;'>Сколько разрабатывались игры</h1>";

print "<table border='1' style='color:white;font-size:25px;margin:30px auto;border:3px solid orange;'><th>Название</th><th>Лет</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Название"]."</td><td>".$row["Лет"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>