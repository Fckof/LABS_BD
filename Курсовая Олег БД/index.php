<?php

session_start();

if($_GET['do'] == 'logout'){
 unset($_SESSION['user']);
 session_destroy();
} 
 
 if(is_null($_SESSION['user']))
{
    header("Location: login.php");    
    exit; 
    }
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="ico/gym.ico">
	<title>Фитнес</title>
</head>
<body>
	<div class="wrapper1">

		<div class="status_bar">
		 <?php print "<p class='status_user'>Вы: <span>".$_SESSION['user']."</span></p>"; ?>
		</div>
	<div class="wrapper7">
		<div class="wrapper4">
		<div class="bar__select-tables">
			<span class="header__link_span"><a href="php/tables/clients.php" target="frame">Клиенты</a></span>
				<span class="header__link_span"><a href="php/tables/abonements.php" target="frame">Абонементы</a></span>
				<span class="header__link_span"><a href="php/tables/adresa_client.php" target="frame">Адреса<br>клиентов</a></span>
				<span class="header__link_span"><a href="php/tables/adresa_pers.php" target="frame">Адреса<br>персонала</a></span>
				<span class="header__link_span"><a href="php/tables/group_programs.php" target="frame">Групповые<br>программы</a></span>
				<span class="header__link_span"><a href="php/tables/trainers.php" target="frame">Тренера</a></span>
				
		</div></div>
		<?php 
					if($_SESSION['user']=='модератор'||$_SESSION['user']=='администратор'):
				 ?>
		<div class="wrapper5">
			<div class="bar__select-tables">

			<span class="header2__link_span"><a href="php/requests/personal_train.php" target="frame">Персональные<br>тренировки</a></span>
				<span class="header2__link_span"><a href="php/requests/group.php" target="frame">Группа на<br>тренировку</a></span>
				<span class="header2__link_span"><a href="php/requests/vozvrat.php" target="frame">3</a></span>
				<span class="header2__link_span"><a href="php/requests/gonorar.php" target="frame">4</a></span>
				
				
		</div></div>
		<?php 
					if($_SESSION['user']=='администратор'):
				 ?>
		<div class="wrapper6">
			<div class="bar__select-tables">
			<span class="header3__link_span"><a href="php/hard-requests/temporal.php" target="frame">Изменение цены<br>абонемента</a></span>
				<span class="header3__link_span"><a href="php/hard-requests/update.html" target="frame">Обновить<br>стоимость абонемента</a></span>
				<span class="header3__link_span"><a href="php/hard-requests/insert.html" target="frame">Добавить адрес <br>клиента</a></span>
				<span class="header3__link_span"><a href="php/hard-requests/delete.html" target="frame">Удалить адрес <br>клиента</a></span>
		</div></div>
			<?php endif; ?>
		<?php endif; ?>
		</div>

		<div class="wrapper2">

			<main class="main">
				<iframe src="" frameborder="0" class="main__frame" name="frame"></iframe>
			</main>

		</div>
		<div class="exit">
			<a href="index.php?do=logout" target="_top" class="exit__anchor">/ exit /</a>
		</div>

		
	</div>

</body>
</html>