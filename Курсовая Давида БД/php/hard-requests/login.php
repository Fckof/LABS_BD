<?php 
session_start();
include "../connect.php";

$login=$_POST['login'];
$pass=$_POST['pass'];


      
$result=$conn->query("SELECT `статус` FROM `пользователи` WHERE `логин`='$login' and `пароль`='$pass'");

    $row=$result->fetch_assoc();
    
    if(count($row)==0){
        echo "Не верный логин или пароль";
    }else{
        $access=$row['статус'];
        //echo $access;
        $_SESSION['user']=$access;
        echo $_SESSION['user'];
    } 

 $conn->close();
 ?> 