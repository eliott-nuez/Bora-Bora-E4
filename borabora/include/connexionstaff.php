<?php
session_start();


if (empty($_POST['username']) || empty($_POST['password'])) {
	header("Location: ../staff.php");
	exit();
}
$username = $_POST['username'];
$password = $_POST['password'];

// solution temporaire en attendant de trouver une solution pour cacher le mot de passe

if ($username=='enuez' && $password=='eliott'){
    $_SESSION['connected']=true;
	header('Location: ../pagestaff.php');
	exit();
}else{
	header('Location: ../staff.php');
	exit();
}

?>