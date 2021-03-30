 <?php 

session_start();

	$user = "user";
	$pass = "user123";
	$root = "root";
	$passroot = "root123";

	if($_POST['submit']){
 		if($root == $_POST['user'] AND $passroot == $_POST['pass']){
 			$_SESSION['user'] = $root;
 			header("Location: index.php");
 			exit;
 			}elseif($user == $_POST['user'] AND $pass == $_POST['pass']){
 				$_SESSION['user'] = $user;
 			header("Location: index.php");
 			exit;
 			}
			else $_SESSION['msg']="Не верный логин или пароль";
} 

 ?>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>GameDev</title>
	<style>
		body{
			min-height: 100vh;
			min-width: 1200px;
			margin: 0;
			padding: 0;
			background-color: black;
			color: orange;
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
			font-size: 25px;
			font-family: "Comic Sans MS", sans-serif;
		}
		.input{
			padding: 10px;
			border:5px solid white;
			border-radius: 20px;
			//height: 25px;
			animation: bordercolors 6s infinite linear;
		}
		.login-form{
			width: 350px;
			height: 450px;
			display: flex;
			justify-content: space-around;
			align-items: center;
		}
		.field{
			width: 95%;
			height: 95%;
			border-radius: 30px;
		}
		.input-field{
			flex-direction: column;
			margin: 20px auto;
			display: flex;
			justify-content: center;
		}
		#button-submit{
			margin:40px auto 0 auto;
			width: 150px;
			height: 60px;
			border-radius: 30px;
			border:0px solid red;
			transition: .4s;
			animation:colors 6s linear infinite,scalebut 1s linear infinite ;
			color: white;
		}
		#button-submit:hover{
			border:5px solid white;
		}
		#button-submit:active{
			border:15px solid red;
		}
		input{
			text-align: center;
			font-size: 22px;
			outline: none;
		}

		@keyframes scalebut {
			0%{
				transform: scale(1);
			}
			50%{
				transform: scale(1.04);
			}
			100%{
				transform: scale(1);
			}
		}
		@keyframes colors {
			0%{
				background-color: #2417d4;
			}
			25%{
				background-color: #da8419;
			}
			50%{
				background-color: #990dd2;
			}
			75%{
				background-color: #dd0e90;
			}
			100%{
				background-color: #2417d4;
			}
		}
		@keyframes bordercolors {
			0%{
				border-color: #2417d4;
			}
			25%{
				border-color: #da8419;
			}
			50%{
				border-color: #990dd2;
			}
			75%{
				border-color: #dd0e90;
			}
			100%{
				border-color: #2417d4;
			}
		}
		fieldset{
			border:5px solid orange;
			animation: bordercolors 6s infinite linear;
		}
		.msg{
			font-size: 16px;
			color: red;
		}
	</style>
</head>
<body>
	<form method="POST" class="login-form" autocomplete="off">
		<fieldset class="field">
			<legend>Log In DataBase </legend>

			<div class="input-field">
			<label for="login">Login <br>

				<input type="text" name="user" class="input" id="user" placeholder="Enter login" autocomplete="off" required>

			</label></div>

			<div class="input-field">
			<label for="pass">Password <br>

				<input type="password" name="pass" class="input" id="password" placeholder="Enter password" autocomplete="off" required>

			</label></div>
			<?php 
				if($_SESSION['msg']){
					print "<p class='msg'>".$_SESSION['msg']."</p>";
				}
				unset($_SESSION['msg']);
			 ?>
		
		<div class="input-field">
			<input type="submit" name="submit" class="input" id="button-submit" value="Log In">
			
		</div>

		</fieldset>
	</form>
</body>
</html>