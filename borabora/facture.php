<?php

session_start();
if (empty($_SESSION['connected'])) {
    header('Location: staff.php');
    exit();
}

if (empty($_GET['id'])) {
  header("Location: listefacture.php");
  exit();
}

$id = $_GET['id'];

include_once "include/connexion.php";
?>


<!DOCTYPE html>
<html lang="fr">
<head>
  <title>Staff - Le Bora-Bora</title>
  <?php include_once 'include/head.php' ?>  
  <link rel="stylesheet" type="text/css" media="screen" href="css/slider.css">
</head>
<body >
<div style = 'background-image : url("img/vue.png");background-repeat: no-repeat;background-size: cover; height: 500px;'>

<?php include_once 'include/header.php' ?>

<?php
$total=0;
?>
 <div id="facture" style="width: 75%; padding-top:10px; padding-bottom:10px;border: 3px solid #A0A0A0; text-align : center ; margin : auto; background: #C0C0C0;margin-top: 10%;">
	
	<?php
	$query = ("SELECT nom,prenom
	FROM client
	INNER JOIN facture ON client.id_client=facture.id_client
	WHERE num_fact=:id");
	$stmt = $pdo->prepare($query);
	$stmt->bindParam(':id', $id, PDO::PARAM_INT);
	$stmt->execute();
	while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
		$nom=$row['nom'];
		$prenom=$row['prenom'];
		
		echo "<b>Nom client : </b>".$nom." ".$prenom."   ";
	}
	?>
	
	<?php
	$query = ("SELECT num_chambre
	FROM comprend_chambre
	WHERE num_fact=:id");
	$stmt = $pdo->prepare($query);
	$stmt->bindParam(':id', $id, PDO::PARAM_INT);
	$stmt->execute();
	while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
		$num_chambre=$row['num_chambre'];
		
		echo "<b>N° Chambre : </b>".$num_chambre;
	}
	?>
	<h3>Détail :</h3>
	<table style="text-align: center; border: 1px solid black;width : 80%;margin:auto;">
	  <tr>
		<td><b>Date :</b></td>
		<td><b>Libellé :</b></td>
		<td><b>Quantité :</b></td>
		<td><b>Prix Unitaire :</b></td>
		<td><b>Prix Total :</b></td>
	  </tr>
	<?php
	
	$query = ("SELECT datea,dateb,lib_chambre,prix_chambre
	FROM comprend_chambre
	INNER JOIN chambre ON comprend_chambre.num_chambre=chambre.num_chambre
	WHERE num_fact=:id");
	$stmt = $pdo->prepare($query);
	$stmt->bindParam(':id', $id, PDO::PARAM_INT);
	$stmt->execute();
	while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
		$datea=$row['datea'];
		$datea2=strtotime($datea);
		$dateb=$row['dateb'];
		$dateb2=strtotime($dateb);
		$lib_chambre=$row['lib_chambre'];
		$qte=$dateb2-$datea2;
		$qte=$qte/86400;
		$prix_chambre=$row['prix_chambre'];
		$prix_total=$qte*$prix_chambre;
		$total+=$prix_total;
		echo("
		<tr>
			<td>".$datea." au ".$dateb."</td>
			<td>".$lib_chambre."</td>
			<td>".$qte."</td>
			<td>".$prix_chambre."</td>
			<td>".$prix_total."</td>
		</tr>
		");
	}
	?>
	
	
	
	<?php
	
	$query = ("SELECT DATE_FORMAT(date,'%d-%m-%y')as date,lib_cons,sum(qte) as qte,prix_cons,sum(qte)*prix_cons as prix_total
	FROM comprend_bar
	INNER JOIN consommation ON comprend_bar.num_cons=consommation.num_cons
	WHERE num_fact=:id
	GROUP BY DATE_FORMAT(date,'%d-%m-%y'),lib_cons");
	$stmt = $pdo->prepare($query);
	$stmt->bindParam(':id', $id, PDO::PARAM_INT);
	$stmt->execute();
	while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
		$date=$row['date'];
		$lib_cons=$row['lib_cons'];
		$qte=$row['qte'];
		$prix_cons=$row['prix_cons'];
		$prix_total=$row['prix_total'];
		$total+=$prix_total;
		echo("
		<tr>
			<td>".$date."</td>
			<td>".$lib_cons."</td>
			<td>".$qte."</td>
			<td>".$prix_cons."</td>
			<td>".$prix_total."</td>
		</tr>
		");
	}
	
	?>
	
	
	<?php
	
	$query = ("SELECT DATE_FORMAT(date,'%d-%m-%y')as date,lib_plat,sum(qte) as qte,prix_plat,sum(qte)*prix_plat as prix_total
	FROM comprend_brasserie
	INNER JOIN brasserie ON comprend_brasserie.num_plat=brasserie.num_plat
	WHERE num_fact=:id
	GROUP BY DATE_FORMAT(date,'%d-%m-%y'),lib_plat");
	$stmt = $pdo->prepare($query);
	$stmt->bindParam(':id', $id, PDO::PARAM_INT);
	$stmt->execute();
	while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
		$date=$row['date'];
		$lib_plat=$row['lib_plat'];
		$qte=$row['qte'];
		$prix_plat=$row['prix_plat'];
		$prix_total=$row['prix_total'];
		$total+=$prix_total;
		echo("
		<tr>
			<td>".$date."</td>
			<td>".$lib_plat."</td>
			<td>".$qte."</td>
			<td>".$prix_plat."</td>
			<td>".$prix_total."</td>
		</tr>
		");
	}
	
	?>
	
	
	<?php
	
	$query = ("SELECT DATE_FORMAT(date,'%d-%m-%y')as date,lib_soin,sum(qte) as qte,prix_soin,sum(qte)*prix_soin as prix_total
	FROM comprend_spa
	INNER JOIN spa ON comprend_spa.num_soin=spa.num_soin
	WHERE num_fact=:id
	GROUP BY DATE_FORMAT(date,'%d-%m-%y'),lib_soin");
	$stmt = $pdo->prepare($query);
	$stmt->bindParam(':id', $id, PDO::PARAM_INT);
	$stmt->execute();
	while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
		$date=$row['date'];
		$lib_soin=$row['lib_soin'];
		$qte=$row['qte'];
		$prix_soin=$row['prix_soin'];
		$prix_total=$row['prix_total'];
		$total+=$prix_total;
		echo("
		<tr>
			<td>".$date."</td>
			<td>".$lib_soin."</td>
			<td>".$qte."</td>
			<td>".$prix_soin."</td>
			<td>".$prix_total."</td>
		</tr>
		");
	}
	echo "</table>";
	
	
	echo "<b>Prix total : </b>".$total." cfp  ";
	$query = ("SELECT paye
	FROM facture
	WHERE num_fact=:id");
	$stmt = $pdo->prepare($query);
	$stmt->bindParam(':id', $id, PDO::PARAM_INT);
	$stmt->execute();
	while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
		$paye=$row['paye'];
		
		if($paye==0){
			
			echo "<b>Payé ? </b> non   ";
		}else{
			echo "<b>Payé ? </b> oui   ";
		}
	}
	?>

	
 </div>
 <button id="print">Imprimer</button>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js" integrity="sha256-c3RzsUWg+y2XljunEQS0LqWdQ04X1D3j22fd/8JCAKw=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>
<script>
  $('body').on('click', '#print', function () {
    var doc = new jsPDF({ orientation: 'landscape' });
    doc.addHTML($('#facture')[0], 15, 15, {
      'background': '#fff',
    }, function() {
      doc.save('facture-<?= $id ?>.pdf');
    });
  });
</script>
</body>

</html>