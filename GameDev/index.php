
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
    <title>ЛР БД</title>
    <link rel="stylesheet" href="style.css">
    
</head>
        <frameset rows="60,*,50" border="0" bordercolor='aqua' noresize >

            <frameset>
                <frame src="header.php">
            </frameset>

            <frameset cols="20%, 80%">
                <frame src="" name="menu-page">
                <frame src="" name="main-page">
            </frameset>

            <frameset>
                <frame src="campaign.html">
           </frameset>
        </frameset>
        
</html>
