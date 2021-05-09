<?php session_start() ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="menu">
				<div class="stat-block"><a href="menu.php" target="menu-page" id="back"><--Назад</a><hr class="red-hr"></div>

			<ul class="list">
					<li><a href="zapros/zapros1.php" target="main-page">Запрос №1</a></li>
					<hr>
					<li><a href="zapros/zapros2.php" target="main-page">Запрос №2</a></li>
					<hr>
					<li><a href="zapros/zapros3.php" target="main-page">Запрос №3</a></li>
					<hr>
					<li><a href="zapros/zapros4.php" target="main-page">Запрос №4</a></li>
					<hr>
					<li><a href="zapros/zapros5.php" target="main-page">Запрос №5</a></li>
					<hr>
					<li><a href="zapros/zapros6.php" target="main-page">Запрос №6</a></li>
					<hr>
					<li><a href="zapros/zapros7.php" target="main-page">Запрос №7</a></li>
					<hr>
					<li><a href="zapros/zapros8.php" target="main-page">Запрос №8</a></li>
					<hr>
					<li><a href="zapros/zapros9.php" target="main-page">Запрос №9</a></li>
					<hr>
					<li><a href="zapros/zapros10.php" target="main-page">Запрос №10</a></li>
					<hr>
					<li><a href="zapros/zapros14.php" target="main-page">Запрос №11</a></li>
					<hr>
					
					 <?php 
						if($_SESSION['user']=='moderator'||$_SESSION['user']=='root'):
					 ?>
					<li><a href="zapros/insertForm.html" target="main-page">Добавить исполнителя</a></li>
					<hr>
					<li><a href="zapros/updateForm.html" target="main-page">Обновить рейтинг</a></li>
					<hr>
					<?php endif; ?>
					
					<?php 
						if($_SESSION['user']=='root'):
					?>
					<li><a href="zapros/deleteForm.html" target="main-page">Удалить исполнителя</a></li>
					

					<?php endif; ?>
				</ul>
	</div>
</body>
</html>