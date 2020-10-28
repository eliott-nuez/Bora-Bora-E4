<?php 
$racine = $_SERVER['DOCUMENT_ROOT'];

session_start();
if (empty($_SESSION['connected'])) {
    header('Location: staff.php');
    exit();
}

?>


<!DOCTYPE html>
<html lang="fr">
<head>
  <title>Staff - Le Bora-Bora</title>
  <?php include_once 'include/head.php';
include_once 'include/connexion.php';  ?>  
  <link rel="stylesheet" type="text/css" media="screen" href="css/slider.css">
</head>
<body >
<div style = 'background-image : url("img/vue.png");background-repeat: no-repeat;background-size: cover; height: 500px;'>

<?php include_once 'include/header.php' ?>


 <div style="width: 25%; padding-top:10px; padding-bottom:10px;border: 3px solid #A0A0A0; text-align : center ; margin : auto; background: #C0C0C0;margin-top: 10%;">
 <form action='include\connexionstaff.php' method='post'>
 	nom : <input type='text' name='nom'>  prenom : <input type='text' name='prenom'>  numéro de chambre : <input type='integer' name='num_chambre'> <input type='submit' name='submit' value='chercher'>

</form>
<table>
  <tr>
    <td>N° Chambre :</td>
    <td>Nom :</td>
    <td>Prenom :</td>
    <td>Date Arrivée :</td>
    <td>Date Depart :</td>
    <td>Action :</td>
  </tr>
<?php

$query = "SELECT facture.num_fact, nom, prenom, datea, dateb, num_chambre
FROM client 
INNER JOIN facture ON client.id_client = facture.id_client
INNER JOIN comprend_chambre ON facture.num_fact = comprend_chambre.num_fact
GROUP BY nom, datea, dateb
ORDER BY datea DESC";
$stmt = $pdo->prepare($query);
$stmt->execute();
while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
	$num_chambre=$row['num_chambre'];
	$nom=$row['nom'];
	$prenom=$row['prenom'];
	$datea=$row['datea'];
	$dateb=$row['dateb'];
	$num_fact=$row['num_fact'];
	
	echo("
	<tr>
		<td>".$num_chambre."</td>
		<td>".$nom."</td>
		<td>".$prenom."</td>
		<td>".$datea."</td>
		<td>".$dateb."</td>
		<td>".
		"<a href='facture.php?action=detail&id=" . $num_fact . "'> Consulter la facture </a>"
		."</td>
	</tr>
	");
}

?>

</table>
 </div>
</div>
<div>

</div>

</body>

</html>