<?php session_start();?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="style.css">
	<style>
	</style>
</head>
<body>
	<div class="menu">
			<ul>
				<hr>
				<li><a href="tables.html" target="menu-page" class="font">Таблицы</a></li>
				<hr>
				
				<li><a href="zaprosi.php" target="menu-page" class="font">Запросы</a></li>

				<?php
					if($_SESSION['user']=='root'):
				?>
				<hr>
				<li> <a href="otchets.html" target="menu-page" class="font">Отчеты</a> </li>
				<?php
					endif;
				?>
				<hr>
			</ul>
	</div>
</body>
</html>