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

	

	<div class="main-header">
		<h1>Пользователь: <?php print $_SESSION['user']?></h1>

		<div class="top_menu">
			<ul>
				<!-- <hr> -->
				<li><a href="tables.html" target="menu-page" class="">Таблицы</a></li>
				<!-- <hr> -->
				
				<li><a href="zaprosi.php" target="menu-page" class="">Запросы</a></li>
				<?php 
					if($_SESSION['user']=='moderator'||$_SESSION['user']=='root'):
				 ?>
				 	<li><a href="zaprosiReduct.php" target="menu-page" class="">Редактирование</a></li>

				<?php endif; ?>
				<?php
					if($_SESSION['user']=='root'):
				?>
				<!-- <hr> -->
				<li> <a href="otchets.html" target="menu-page" class="">Отчеты</a> </li>

				<li> <a href="journals.html" target="menu-page" class="">Журналы
				</a> </li>
				<?php
					endif;
				?>
				<!-- <hr> -->
			</ul>
	</div>
	
	 <a href="index.php?do=logout" target="_top" class="font">Выход</a> 
		</div>

</body>            
</html>