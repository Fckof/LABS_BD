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
	<link rel="icon" href="ico/qw.ico">
	<title>Главная</title>
</head>
<body>
	<div class="wrapper1">
		<?php 
			if($_SESSION['user']=='модератор'||$_SESSION['user']=='администратор'):
			?>
			

			
		<div class="wrapper3">
			<div class="header2">
				<span class="header2__link_span"><a href="php/requests/margarita.php" target="frame">Заказы на<br>пиццу Маргарита</a></span>
				<span class="header2__link_span"><a href="php/requests/clients_order.php" target="frame">Клиенты которые<br>заказали пиццу<br>Американка</a></span>
				<span class="header2__link_span"><a href="php/requests/deliver.php" target="frame">Курьеры которые<br>доставляли пиццу<br>Ассорти</a></span>
				<span class="header2__link_span"><a href="php/requests/cour1.php" target="frame">Пиццы которые<br>доставлял курьер<br>№1</a></span>
				<span class="header2__link_span"><a href="php/requests/fam.php" target="frame">Поиск курьера<br>с фамилией<br>Ким</a></span>
				<span class="header2__link_span"><a href="php/requests/Npizza.html" target="frame">Курьеры<br>которые доставили<br>больше N пицц</a></span>
				
			</div>
		</div>

			<?php endif; ?>

		<div class="wrapper2">
			<nav class="header">
				<span class="header__link_span"><a href="php/tables/auto.php" target="frame">Автомобиль</a></span>
				<span class="header__link_span"><a href="php/tables/courier_auto.php" target="frame">Авто курьера</a></span>
				<span class="header__link_span"><a href="php/tables/zakaz.php" target="frame">Заказ</a></span>
				<span class="header__link_span"><a href="php/tables/client.php" target="frame">Клиент</a></span>
				<span class="header__link_span"><a href="php/tables/courier.php" target="frame">Курьер</a></span>
				<span class="header__link_span"><a href="php/tables/pizza.php" target="frame">Пицца</a></span>
			</nav>
			<hr class='hr'>

			<main class="main">
				<iframe src="" frameborder="0" class="main__frame" name="frame"></iframe>
			</main>

		</div>

		<?php 
			if($_SESSION['user']=='модератор'||$_SESSION['user']=='администратор'):
			?>
		<div class="wrapper3">
			<div class="header3">
				<span class="header3__link_span"><a href="php/hard-requests/temporal.php" target="frame">Изменение цены<br>пиццы</a></span>
				<span class="header3__link_span"><a href="php/hard-requests/update.html" target="frame">Обновить<br>стоимость пиццы</a></span>
				<?php 
					if($_SESSION['user']=='администратор'):
				 ?>
				<span class="header3__link_span"><a href="php/hard-requests/insert.html" target="frame">Добавить заказ</a></span>
				<span class="header3__link_span"><a href="php/hard-requests/delete.html" target="frame">Удалить заказ</a></span>
				<?php endif; ?>
				
			</div>
		</div>
		<?php endif; ?>
		<div class="exit">
			<a href="index.php?do=logout" target="_top" class="exit__anchor">выход</a>
		</div>
		
	</div>

</body>
</html>