<?php $racine = $_SERVER['DOCUMENT_ROOT'] ?><!DOCTYPE html>
<html lang="fr">
<head>
  <title>Staff - Le Bora-Bora</title>
  <?php include_once 'include/head.php' ?>  
  <link rel="stylesheet" type="text/css" media="screen" href="css/slider.css">
</head>
<body >
<div style = 'background-image : url("img/vue.png");background-repeat: no-repeat;background-size: cover; height: 500px;'>

<?php include_once 'include/header.php' ?>


 <div style="width: 25%; padding-top:10px; padding-bottom:10px;border: 3px solid #A0A0A0; text-align : center ; margin : auto; background: #C0C0C0;margin-top: 10%;">
 <form action='include\connexionstaff.php' method='post'>
 	connexion<br>

 	identifiant : <input name='username' type="text"><br>
 	mot de passe : <input name='password' type="password"><br>
 	<input type='submit' name='submit' value='suivant'><br>
	Identifiant ou mot de passe incorrect veuillez rééssayer !

</form>
 </div>
</div>
<div>
 <?php include_once 'include/footer.php' ?>
</div>

</body>

</html>