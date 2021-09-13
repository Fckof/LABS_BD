<?php

session_start();

if($_GET['do'] == 'logout'){
 unset($_SESSION['user']);
 session_destroy();
} 

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/style.css">
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<link rel="icon" href="ico/phone.ico">
	<title>Phones</title>
</head>
<body>
	<div class="wrapper">
		<header class="header">
			<nav class="nav">
				<div class="nav__folder">
					
					<div class="form_radio"><input type="radio" name="radio" class="nav__folder-link" id="radio-1" >
						<label for="radio-1">Заявки</label>
					</div>
					<div class="form_radio"><input type="radio" name="radio" class="nav__folder-link" id="radio-2" >
						<label for="radio-2">Магазины</label>
					</div>
					<div class="form_radio"><input type="radio" name="radio" class="nav__folder-link" id="radio-3" >
						<label for="radio-3">План продаж</label>
					</div>
					<div class="form_radio"><input type="radio" name="radio" class="nav__folder-link" id="radio-4" >
						<label for="radio-4">Поставки</label>
					</div>
					<div class="form_radio"><input type="radio" name="radio" class="nav__folder-link" id="radio-5" >
						<label for="radio-5">Продавцы</label>
					</div>
					<div class="form_radio"><input type="radio" name="radio" class="nav__folder-link" id="radio-6" >
						<label for="radio-6">Продажи</label>
					</div>
					<div class="form_radio"><input type="radio" name="radio" class="nav__folder-link" id="radio-7" >
						<label for="radio-7">Смартфоны</label>
					</div>
					<div class="form_radio"><input type="radio" name="radio" class="nav__folder-link" id="radio-8" >
						<label for="radio-8">Смартфоны в магазине</label>
					</div>
					
				</div>
				<button class="nav__enter_button" id="enter">Войти</button>
				
					<a href="index.php?do=logout" target="_top" id="logout" class="exit__anchor">Выход</a>
				
			</nav>
		</header>
		<?
			if($_SESSION["user"]=="модератор" || $_SESSION["user"]=="администратор"):
		?>
		<div class="block" id="sec_block">
			<nav class="nav">
				<div class="nav__folder">

					<div class="select__block">
						<span class="label">Запросы</span>
						<select name="sel" id="select" class="selQuery">
							<option value="">Выберите вариант</option>
							<option value="plan_otdel">План продаж для отдельного магазина</option>
							<option value="poiskpoakkum">Поиск смартфона в магазинах по аккумулятору</option>
							<option value="poiskprod">Продажи по имени продавца</option>
							<option value="poisksklad">Поиск смартфона определенного производителя на складе</option>
							<option value="salesid">Продажи смартфона по id</option>
							<option value="vsego">Всего продано единиц товаров каждым продавцом</option>
							
							<option value="temporal" class="opt">Изменение цен смартфонов</option>
							<option value="up" class="opt">Обновить цену смартфона</option>
							<?
								if($_SESSION["user"]=="администратор"):
							?>
							<option value="ins" class="opt">Добавить продавца</option>
							<option value="del" class="opt">Удалить продавца</option>
							<?
								endif;
							?>
						</select>
						<button class="Btn" id="showBtn" >Показать</button>

					</div>

				</div>
			</nav>
		</div>
		<?
			endif;
		?>
		<main class="main">
			<div class="main__window">
				<div class="output"></div>
				<table class='table'  cellspacing="20" >

				</table>
			</div>
		</main>
	</div>

	<div id="boxes">  
<div id="dialog" class="window">
<div class="top"><a href="#" class="link close"/>Закрыть</a></div>
<div class="content">
	<form id="form4">
		<label for="">Логин<br><input type="login" name="login" placeholder="Логин" required></label>
		<br>
		<label for="">Пароль<br><input type="password" name="pass" placeholder="Пароль" required></label><br>
		<input type="submit" placeholder="Войти" id="submitLogin">
	</form>
</div>
</div>
</div>
	<div id="mask"></div>
	<script>
		$(document).on('submit', '.form_data', function() {
			var form=$(`#${$(this).attr('id')}`);

			$.post(`php/hard-requests/${$('#select').val()}.php`,form.serialize(), function(data) {
					alert(data)
					});
			return false;
			});

		$('#form4').on('submit', function() {
			var form=$(`#${$(this).attr('id')}`);

			$.post(`php/hard-requests/login.php`,form.serialize(), function(data) { 
						//console.log(data);// 
					});
			});

		

		jQuery(document).ready(function() {
			
			
				$('#enter').text("<?echo $_SESSION['user'];?>")
				if($('#enter').text()==""){
					$('#enter').text("Войти");
				}
			
			$('#enter').click(function(){
				var maskHeight = $(document).height();
			    var maskWidth = $(window).width();
			    $('#mask').css({'width':maskWidth,'height':maskHeight});
			    $('#mask').fadeIn(1000); 
			    $('#mask').fadeTo("slow",0.4); 
			    var winH = $(window).height();
			    var winW = $(window).width();
			    $("#dialog").css('top',  winH/2-$("#dialog").height()/2);
			    $("#dialog").css('left', winW/2-$("#dialog").width()/2);
			    $("#dialog").fadeIn(2000); 
			    });
			    $('.window .close').click(function (e) { 
			    e.preventDefault();
			    $('#mask, .window').hide();
			    $('#mask, .window').fadeOut();
			    }); 
			    $('#mask').click(function () {
				$(this).fadeOut();
				$('.window').fadeOut();
			    $(this).hide();
			    $('.window').hide();
			    
						})

			if($(".table").text()=="") {
				$(".main").hide();
			}

			$('.main').css("display", "none");
			
		$('#radio-1').click(function(){
			$('.output').empty();
			$('.table').empty();
			$('.main').css("display", "none");
				$.getJSON(`php/tables/zayavki.php`, function(json) {
		  			console.log(json);

		  			$("<th>Код</th><th>ID_СМАРТ</th><th>ID_МАГ</th><th>Дата</th><th>Кол-во</th><th>Кол-во получено</th><th>Дата получения</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i].Код}</td><td>${json[i].ID_СМАРТ}</td><td>${json[i].ID_МАГ}</td><td>${json[i].Дата}</td><td>${json[i]['Кол-во']}</td><td>${json[i]['Кол-во получено']}</td><td>${json[i]['Дата получения']}</td></tr>`).appendTo('.table')
		  			}

		  	});
				
			//<td>${json[i].ID_МАГ}</td>
				$('.main').fadeIn(500);
			
		})

		$('#radio-2').click(function(){
			$('.output').empty();
			$('.table').empty();
			$('.main').css("display", "none");
				$.getJSON(`php/tables/shops.php`, function(json) {
		  			console.log(json);

		  			$("<th>ID_МАГ</th><th>Название</th><th>Адрес</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i].ID_МАГ}</td><td>${json[i].Название}</td><td>${json[i].Адрес}</td></tr>`).appendTo('.table')
		  			}
		  			
		  	});
				$('.main').fadeIn(500);
			//<td>${json[i].ID_МАГ}</td>
			
			
		})

		$('#radio-3').click(function(){
			$('.output').empty();
			$('.table').empty();
			$('.main').css("display", "none");
				$.getJSON(`php/tables/plan.php`, function(json) {
		  			console.log(json);

		  			$("<th>Код плана</th><th>ID_СМАРТ</th><th>ID_МАГ</th><th>Начало квартала (дата)</th><th>Год</th><th>Конец квартала (дата)</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i]['Код плана']}</td><td>${json[i].ID_СМАРТ}</td><td>${json[i].ID_МАГ}</td><td>${json[i]['Начало квартала (дата)']}</td><td>${json[i].Год}</td><td>${json[i]['Конец квартала (дата)']}</td></tr>`).appendTo('.table')
		  			}

		  	});
				
			//<td>${json[i].ID_МАГ}</td>
			
			$('.main').fadeIn(500);
		})
			
			
		$('#radio-4').click(function(){
			$('.output').empty();
			$('.table').empty();
			$('.main').css("display", "none");
				$.getJSON(`php/tables/postavki.php`, function(json) {
		  			console.log(json);

		  			$("<th>Код</th><th>ID_ПОСТОВ</th><th>Дата поставки</th><th>ID_МАГ</th><th>ID_СМАРТ</th><th>Кол-во</th><th>Цена за шт</th><th>Цена поставки</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i]['Код']}</td><td>${json[i].ID_ПОСТОВ}</td><td>${json[i]['Дата поставки']}</td><td>${json[i]['ID_МАГ']}</td><td>${json[i].ID_СМАРТ}</td><td>${json[i]['Кол-во']}</td><td>${json[i]['Цена за шт']}</td><td>${json[i]['Цена поставки']}</td></tr>`).appendTo('.table')
		  			}

		  	});
				
			//<td>${json[i].ID_МАГ}</td>
			
			$('.main').fadeIn(500);
		})
			
		$('#radio-5').click(function(){
			$('.output').empty();
			$('.table').empty();
			$('.main').css("display", "none");
				$.getJSON(`php/tables/prod.php`, function(json) {
		  			console.log(json);

		  			$("<th>ФИО</th><th>ID_МАГ</th><th>ID_ПРОД</th><").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i]['ФИО']}</td><td>${json[i].ID_МАГ}</td><td>${json[i].ID_ПРОД}</td></tr>`).appendTo('.table')
		  			}

		  	});
				
			//<td>${json[i].ID_МАГ}</td>
			
			$('.main').fadeIn(500);
		})


		$('#radio-6').click(function(){
			$('.output').empty();
			$('.table').empty();
			$('.main').css("display", "none");
				$.getJSON(`php/tables/sales.php`, function(json) {
		  			console.log(json);

		  			$("<th>Код</th><th>ID_СМАРТ</th><th>ID_ПРОД</th><th>Кол-во проданного</th><th>Дата</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i]['Код']}</td><td>${json[i].ID_СМАРТ}</td><td>${json[i].ID_ПРОД}</td><td>${json[i]['Кол-во проданного']}</td><td>${json[i].Дата}</td></tr>`).appendTo('.table')
		  			}

		  	});
				
			//<td>${json[i].ID_МАГ}</td>
			
			$('.main').fadeIn(500);
		})

		$('#radio-7').click(function(){
			$('.output').empty();
			$('.table').empty();
			$('.main').css("display", "none");
				$.getJSON(`php/tables/phone.php`, function(json) {
		  			console.log(json);

		  			$("<th>ID_СМАРТ</th><th>Наименование</th><th>Производитель</th><th>Диагональ экрана (дюйм)</th><th>Оперативная память (ГБ)</th><th>Процессор</th><th>Аккумулятор (мА·ч)</th><th>Память (ГБ)</th><th>Цена</th><th>Кол-во на складе</th><th>Дата выхода</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i]['ID_СМАРТ']}</td><td>${json[i].Наименование}</td><td>${json[i].Производитель}</td><td>${json[i]['Диагональ экрана (дюйм)']}</td><td>${json[i]['Оперативная память (ГБ)']}</td><td>${json[i]['Процессор']}</td><td>${json[i]['Аккумулятор (мА·ч)']}</td><td>${json[i]['Память (ГБ)']}</td><td>${json[i]['Цена']}</td><td>${json[i]['Кол-во на складе']}</td><td>${json[i]['Дата выхода']}</td></tr>`).appendTo('.table')
		  			}

		  	});
				
			//<td>${json[i].ID_МАГ}</td>
			
			$('.main').fadeIn(500);
		})

		$('#radio-8').click(function(){
			$('.output').empty();
			$('.table').empty();
			$('.main').css("display", "none");
				$.getJSON(`php/tables/phoneinshop.php`, function(json) {
		  			console.log(json);

		  			$("<th>Код</th><th>ID_СМАРТ</th><th>Кол-во</th><th>ID_МАГ</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i]['Код']}</td><td>${json[i].ID_СМАРТ}</td><td>${json[i]['Кол-во']}</td><td>${json[i]['ID_МАГ']}</td></tr>`).appendTo('.table')
		  			}

		  	});
				
			//<td>${json[i].ID_МАГ}</td>
			
			$('.main').fadeIn(500);
		})

			$('#showBtn').click(function(){
				$('input[type="radio"]').prop("checked",false);
				if( $('#select').val()=="up" || $('#select').val()=="ins" || $('#select').val()=="del"){

				$('.output').empty();
				$('.table').empty();
				$('.main').css("display", "none");
					switch($('#select').val()) {
						case "up":
						//action="php/hard-requests/up.php
							$('<form class="form_data" id="form1"><div class="input-field"><label for="surname">ID смартфона <br><input type="number" name="id" class="input" id="surname" placeholder="" autocomplete="off" required  minlength="1"></label></div><div class="input-field"><label for="name">Новая стоимость <br><input type="number" name="newcost" class="input" id="name" placeholder="" autocomplete="off" required  minlength="2"></label></div><div class="input-field"><input type="submit" name="send" class="input" id="button-submit" value="Обновить" ></div></form>').appendTo('.output');
							break;
						case "ins":
							$('<form class="form_data" id="form2"><div class="input-field"><label for="surname">ID магазина <br><input type="number" name="id" class="input" id="surname" placeholder="" autocomplete="off" required  minlength="1"></label></div><div class="input-field"><label for="fathername">ФИО <br><input type="text" name="name" class="input" id="fathername" placeholder="" autocomplete="off" required  minlength="3"><br><input type="submit" name="send" class="input" id="button-submit" value="Добавить" ></div></form>').appendTo('.output')
							break;
						case "del":
							$('<form class="form_data" id="form3"><div class="input-field"><label for="surname">ID продавца <br><input type="number" name="id" class="input" id="exeid" placeholder="" autocomplete="off" required></label></div><input type="submit" name="send" class="input" id="button-submit" value="Удалить" ></div><form>').appendTo(".output")
						break;
					}
					$('.main').fadeIn(500);

					
				}
				else if($('#select').val()==""){
					return 0;
				}
				else{
				$('.output').empty();
			$('.table').empty();
			$('.main').css("display", "none");

				
					$.getJSON(`php/requests/${$('#select').val()}.php`, function(json) {
		  			console.log(json);

		  			switch($('#select').val()) {
		  				case "plan_otdel":

		  					$("<th>Код плана</th><th>Адрес</th><th>Наименование</th><th>Кол-во</th><th>Начало квартала (дата)</th><th>Конец квартала (дата)</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i]['Код плана']}</td><td>${json[i].Адрес}</td><td>${json[i]['Наименование']}</td><td>${json[i]['Кол-во']}</td><td>${json[i]['Начало квартала (дата)']}</td><td>${json[i]['Конец квартала (дата)']}</td></tr>`).appendTo('.table')
		  			}
		  					break;
		  				case "poiskpoakkum":

		  					$("<th>Наименование</th><th>Цена</th><th>Название</th><th>Адрес</th><th>Кол-во</th><th>Аккумулятор (мА·ч)</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i]['Наименование']}</td><td>${json[i].Цена}</td><td>${json[i]['Название']}</td><td>${json[i]['Адрес']}</td><td>${json[i]['Кол-во']}</td><td>${json[i]['Аккумулятор (мА·ч)']}</td></tr>`).appendTo('.table')
		  			}
		  					break;

		  				case "poiskprod":
		  					$("<th>ФИО</th><th>Наименование</th><th>Кол-во проданного</th><th>Дата</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i]['ФИО']}</td><td>${json[i]['Наименование']}</td><td>${json[i]['Кол-во проданного']}</td><td>${json[i]['Дата']}</td></tr>`).appendTo('.table')
		  			}
		  			break;
		  			case "poisksklad":

		  			$("<th>Производитель</th><th>Наименование</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i]['Производитель']}</td><td>${json[i]['Наименование']}</td></tr>`).appendTo('.table')
		  			}
		  			break;
		  			case "salesid":
		  			$("<th>ФИО</th><th>Наименование</th><th>Цена</th><th>Дата</th><th>Кол-во проданного</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i]['ФИО']}</td><td>${json[i]['Наименование']}</td><td>${json[i]['Цена']}</td><td>${json[i]['Дата']}</td><td>${json[i]['Кол-во проданного']}</td></tr>`).appendTo('.table')
		  			}
		  			break;
		  			case "vsego":
		  			$("<th>ФИО</th><th>Всего продано единиц товаров</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i]['ФИО']}</td><td>${json[i]['Всего продано единиц товаров']}</td></tr>`).appendTo('.table')
		  			}
		  			break;
		  			case "temporal":
		  			$("<th>Название</th><th>Старая цена</th><th>Новая цена</th><th>Дата до обновления</th><th>Дата обновления</th>").appendTo(".table")

		  			for(var i in json){
		  				$(`<tr><td>${json[i]['Название']}</td><td>${json[i]['Старая цена']}</td><td>${json[i]['Новая цена']}</td><td>${json[i]['Дата до обновления']}</td><td>${json[i]['Дата обновления']}</td></tr>`).appendTo('.table')
		  			}
		  			break;
		  			}

		  	});
			$('.main').fadeIn(500);
					
			}
			})

	
		});
			
			
	</script>
</body>
</html>