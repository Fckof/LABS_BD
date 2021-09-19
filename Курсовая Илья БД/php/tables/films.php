<?php 
include "../connect.php";
$result=$conn->query("SELECT * FROM `фильмы`");

if (count($result)==0){
		echo "Нет записей";
	}

print "<table border='1' style='text-align:center;color:white;font-size:21px;margin:20px auto;border:2px solid black;'><th>ID_филм</th><th>Рабочее название</th><th>Окончательное название</th><th>Год</th><th>Тематика</th><th>Режиссёр</th><th>Длительность</th><th>Бюджет</th><th>Реальные_затраты</th><th>Дата решения о съёмке</th><th>Дата начала съёмки</th><th>Дата конца съёмки</th><th>Дата премьеры</th>";

while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["ID_филм"]."</td><td>".$row["Рабочее название"]."</td><td>".$row["Окончательно название"]."</td><td>".$row["Год"]."</td><td>".$row["Тематика"]."</td><td>".$row["Режиссёр"]."</td><td>".$row["Длительность"]."</td><td>".$row["Бюджет"]."</td><td>".$row["Реальные_затраты"]."</td><td>".$row["Дата решения о съёмке"]."</td><td>".$row["Дата начала съёмки"]."</td><td>".$row["Дата конца съёмки"]."</td><td>".$row["Дата премьеры"]."</td></tr>";
	}

print "</table>";

$conn->close();
 ?>