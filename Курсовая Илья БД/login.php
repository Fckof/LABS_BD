 <?php 

session_start();

include "php/connect.php";

$user=$_POST['user'];
$pass=$_POST['pass'];

if($_POST['submit']){

	$result=$conn->query("SELECT `статус` FROM `пользователи` WHERE `логин`='$user' and `пароль`='$pass'");

	$row=$result->fetch_assoc();
	
	if(count($row)==0){
		$_SESSION['msg']="Не верный логин или пароль";
	}else{

		$access=$row['статус'];

		$_SESSION['user']=$access;
		
		header("Location: index.php");
	} 
}

 ?>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/style.css">
	<title>Login</title>
	
</head>
<body>
	<div class="wrapper4">
	<form method="POST" class="login-form" autocomplete="off">
		
			

			<div class="input-field">
			<label for="login">Логин <br>

				<input type="text" name="user" class="input" id="user" placeholder="Enter login" autocomplete="off" required>

			</label></div>

			<div class="input-field">
			<label for="pass">Пароль <br>

				<input type="password" name="pass" class="input" id="password" placeholder="Enter password" autocomplete="off" required>

			</label></div>
			<?php 
				if($_SESSION['msg']){
					print "<p class='msg'>".$_SESSION['msg']."</p>";
				}
				unset($_SESSION['msg']);
			 ?>
		
		<div class="input-field">
			<input type="submit" name="submit" class="input" id="button-submit" value="Войти">
			
		</div>
		

		
	</form>
	</div>
</body>
</html>