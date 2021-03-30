 <?php 
session_start();
	$userRoot = "root";
	$passRoot = "root";
	$servername="localhost";
	$database="gamedev";

$conn = new mysqli($servername, $userRoot, $passRoot, $database) or die("Не подрубилось...");

$result=$conn->query("SELECT Должности.[Название должности], Sum([Команда проекта].[Оклад за этап]) AS [Sum-Оклад за этап]
FROM (Должности INNER JOIN Исполнители ON Должности.[ID должности] = Исполнители.[ID должности]) INNER JOIN [Команда проекта] ON Исполнители.[ID исполнителя] = [Команда проекта].[ID исполнителя]
GROUP BY Должности.[Название должности]
ORDER BY Sum([Команда проекта].[Оклад за этап]) DESC
");

if (count($result)==0){
		print "Нет записей";
	}
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<style>
		body{
			background-color: #fff;
			min-height: 100vh;
			min-width: 800px;
			margin: 0;
			padding: 0;
			flex-direction: column;
		}
		.form-header{
			background-color: rgba(0,0,200,.4);
			height: 60px;
			display: flex;
			align-items: center;
			justify-content: space-around;
		}
		.form-header h1{
			//margin: auto 0 auto 20px;
			color: black;
			font-family: sans-serif;
			font-weight: 300;
		}
		.form-header p{
			font-size: 22px;
		}
		th{
			border:none;
		}
		th{
			margin: 15px auto;
		}
	</style>
</head>
<body>
	<div class="form">
		<div class="form-header">
			<h1>Отчет о разработках</h1>
			<p> <?php print date("d F Y г.")."<br>".date("h:m:s"); ?> </p>
		</div>

<?php 
	print "<table border='1'bordercolor='grey' style='color:black;font-size:25px;margin:15px auto;border:0 solid grey;'><th>Компания разработчик</th><th>Затраты</th>";

	while ($row=$result->fetch_assoc()) {
		print "<tr><td>".$row["Название"]."</td><td>".$row["затраты"]."</td></tr>";
			}

	print "</table>";
	$conn->close();
		 ?>

	</div>
</body>
</html>