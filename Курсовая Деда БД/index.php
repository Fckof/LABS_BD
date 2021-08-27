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
	<link rel="icon" href="ico/er.ico">
	<title>Документалки</title>
</head>
<body>
	<div class="wrapper1">

		<div class="status_bar">
		 <?php print "<p class='status_user'>".$_SESSION['user']."</p>"; ?>
		</div>

		<img src="png/qw.png" width="300" height="300" alt="">
		<div class="wrapper2">
			<nav class="header">
				<span class="header__link_span"><a href="php/tables/tech.php" target="frame">Аппаратура</a></span>
				<span class="header__link_span"><a href="php/tables/arend.php" target="frame">Аренда</a></span>
				<span class="header__link_span"><a href="php/tables/finance.php" target="frame">Источники<br>финансов</a></span>
				<span class="header__link_span"><a href="php/tables/film_members.php" target="frame">Участники<br>съемок</a></span>
				<span class="header__link_span"><a href="php/tables/films.php" target="frame">Фильмы</a></span>
				<span class="header__link_span"><a href="php/tables/group_members.php" target="frame">Член съемоч.<br>группы</a></span>
			</nav>
			<?php 
					if($_SESSION['user']=='модератор'||$_SESSION['user']=='администратор'):
				 ?>
			<hr class="hr">

			<div class="header2">
				<span class="header2__link_span"><a href="php/requests/arenda.php" target="frame">Аренда</a></span>
				<span class="header2__link_span"><a href="php/requests/budget.php" target="frame">Бюджет<br>на тематики</a></span>
				<span class="header2__link_span"><a href="php/requests/vozvrat.php" target="frame">Возвраты</a></span>
				<span class="header2__link_span"><a href="php/requests/gonorar.php" target="frame">Гонорары</a></span>
				<span class="header2__link_span"><a href="php/requests/zp.php" target="frame">Зарплаты</a></span>
				<span class="header2__link_span"><a href="php/requests/film.php" target="frame">Финансирование<br>фильмов</a></span>

				<span class="header2__link_span"><a href="php/requests/days.php" target="frame">Дней<br>на съемки</a></span>
				<span class="header2__link_span"><a href="php/requests/companys.php" target="frame">Кол-во<br>компаний</a></span>
				<span class="header2__link_span"><a href="php/requests/tematics.php" target="frame">Тематики</a></span>
				<span class="header2__link_span"><a href="php/requests/raznica.php" target="frame">Разница бюджета<br>и затрат</a></span>
			</div>
			<hr class="hr">

			<div class="header3">
				<span class="header3__link_span"><a href="php/hard-requests/temporal.php" target="frame">Изменение цены<br>аренды аппаратуры</a></span>
				<span class="header3__link_span"><a href="php/hard-requests/update.html" target="frame">Обновить<br>стоимость аренды</a></span>
				<?php 
					if($_SESSION['user']=='администратор'):
				 ?>
				<span class="header3__link_span"><a href="php/hard-requests/insert.html" target="frame">Добавить источник <br>финансирования</a></span>
				<span class="header3__link_span"><a href="php/hard-requests/delete.html" target="frame">Удалить источник <br>финансирования</a></span>
				<?php endif; ?>
				
			</div>
			<?php endif; ?>

			<main class="main">
				<iframe src="" frameborder="0" class="main__frame" name="frame"></iframe>
			</main>

		</div>
		<div class="exit">
			<a href="index.php?do=logout" target="_top" class="exit__anchor">выход</a>
		</div>
		
		<img src="png/ret.png" width="300" height="300" alt="">
	</div>

</body>
</html>