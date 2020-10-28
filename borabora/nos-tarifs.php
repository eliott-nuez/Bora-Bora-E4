<?php
$racine = $_SERVER['DOCUMENT_ROOT'];
require_once 'include/connexion.php';

// Exécution d'une requête, on récupère toues les consommations de disponibles
$query = "select cc.lib_cat, c.lib_cons, c.prix_cons from consommation c inner join cat_cons cc on cc.cat = c.cat;";
$stmt = $pdo->prepare($query);
$stmt->execute();

$query2 = "select cb.lib_cat, b.lib_plat, b.prix_plat from brasserie b inner join cat_brasserie cb on cb.cat = b.cat;";
$stmt2 = $pdo->prepare($query2);
$stmt2->execute();

$query3 = "select cs.lib_cat, s.lib_soin, s.prix_soin from spa s inner join cat_spa cs on cs.cat = s.cat;";
$stmt3 = $pdo->prepare($query3);
$stmt3->execute();

$query4 = "select cchambre.lib_cat,chambre.lib_chambre, chambre.prix_chambre from chambre inner join cat_chambre cchambre on cchambre.cat = chambre.cat group by lib_chambre;";
$stmt4 = $pdo->prepare($query4);
$stmt4->execute();
// On rempli un tableau à deux dimensions à partir du résultat de la requête


$prix_par_categorie = array();
while ($enregistrement = $stmt->fetch(PDO::FETCH_ASSOC)) {
  $prix_par_categorie[$enregistrement['lib_cat']][] = array(
    'libelle' => $enregistrement['lib_cons'],
    'prix' => $enregistrement['prix_cons']
  );
}

$prix_par_categorie2 = array();
while ($enregistrement2 = $stmt2->fetch(PDO::FETCH_ASSOC)) {
  $prix_par_categorie2[$enregistrement2['lib_cat']][] = array(
    'libelle' => $enregistrement2['lib_plat'],
    'prix' => $enregistrement2['prix_plat']
  );
}

$prix_par_categorie3 = array();
while ($enregistrement3 = $stmt3->fetch(PDO::FETCH_ASSOC)) {
  $prix_par_categorie3[$enregistrement3['lib_cat']][] = array(
    'libelle' => $enregistrement3['lib_soin'],
    'prix' => $enregistrement3['prix_soin']
  );
}

$prix_par_categorie4 = array();
while ($enregistrement4 = $stmt4->fetch(PDO::FETCH_ASSOC)) {
  $prix_par_categorie4[$enregistrement4['lib_cat']][] = array(
    'libelle' => $enregistrement4['lib_chambre'],
    'prix' => $enregistrement4['prix_chambre']
  );
}
// On récupère le nombre de catégories pour gérer l'affichage par colonnes
$nb_categories = count($prix_par_categorie);

$nb_categories2 = count($prix_par_categorie2);

$nb_categories3 = count($prix_par_categorie3);

$nb_categories4 = count($prix_par_categorie4);

?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <title>Nos prestations - Le Bora-Bora</title>
  <?php include_once 'include/head.php' ?>
</head>
<body>
  <?php include_once 'include/header.php' ?>
  
  <!--==============================Méthode 1================================-->
  <section id="content">
    <div class="container_12 top"
      <!--==============================Méthode 2================================-->
      <div class="grid_12 box-2 pad-1">
        <div>
          <p class="text-3">LE BAR</p>
        </div>
      </div>
      
      <div class="grid_6">
        <ul class="list-2 top-5">
          <?php
          $moitie = ceil($nb_categories / 2);
          reset($prix_par_categorie);

          for ($cpt=0; $cpt<$moitie; $cpt++) {
          ?>
          <li>
            <?php echo key($prix_par_categorie); ?>
            <ul>
              <?php foreach (current($prix_par_categorie) as $consommation) { ?>
              <li><?php echo $consommation['libelle'] .' => '. $consommation['prix'] ?></li>
              <?php } ?>
            </ul>
          </li>
          <?php next($prix_par_categorie); } ?>
        </ul>
      </div>

      <div class="grid_6">
        <ul class="list-2 top-5">
          <?php for (; $cpt<$nb_categories; $cpt++) { ?>
          <li>
            <?php echo key($prix_par_categorie); ?>
            <ul>
              <?php foreach (current($prix_par_categorie) as $consommation) { ?>
              <li><?php echo $consommation['libelle'] .' => '. $consommation['prix'] ?></li>
              <?php } ?>
            </ul>
          </li>
          <?php next($prix_par_categorie); } ?>
        </ul>
      </div>
      
      <div class="grid_12 box-2 pad-1">
        <div>
          <p class="text-3">LA BRASSERIE</p>
        </div>
      </div>
      
      <div class="grid_6">
        <ul class="list-2 top-5">
          <?php
          $moitie2 = ceil($nb_categories2 / 2);
          reset($prix_par_categorie2);

          for ($cpt2=0; $cpt2<$moitie2; $cpt2++) {
          ?>
          <li>
            <?php echo key($prix_par_categorie2); ?>
            <ul>
              <?php foreach (current($prix_par_categorie2) as $consommation2) { ?>
              <li><?php echo $consommation2['libelle'] .' => '. $consommation2['prix'] ?></li>
              <?php } ?>
            </ul>
          </li>
          <?php next($prix_par_categorie2); } ?>
        </ul>
      </div>

      <div class="grid_6">
        <ul class="list-2 top-5">
          <?php for (; $cpt2<$nb_categories2; $cpt2++) { ?>
          <li>
            <?php echo key($prix_par_categorie2); ?>
            <ul>
              <?php foreach (current($prix_par_categorie2) as $consommation2) { ?>
              <li><?php echo $consommation2['libelle'] .' => '. $consommation2['prix'] ?></li>
              <?php } ?>
            </ul>
          </li>
          <?php next($prix_par_categorie2); } ?>
        </ul>
      </div>
	  
	  
	  <div class="grid_12 box-2 pad-1">
        <div>
          <p class="text-3">LE SPA</p>
        </div>
      </div>
      
      <div class="grid_6">
        <ul class="list-2 top-5">
          <?php
          $moitie3 = ceil($nb_categories3 / 2);
          reset($prix_par_categorie3);

          for ($cpt3=0; $cpt3<$moitie3; $cpt3++) {
          ?>
          <li>
            <?php echo key($prix_par_categorie3); ?>
            <ul>
              <?php foreach (current($prix_par_categorie3) as $consommation3) { ?>
              <li><?php echo $consommation3['libelle'] .' => '. $consommation3['prix'] ?></li>
              <?php } ?>
            </ul>
          </li>
          <?php next($prix_par_categorie3); } ?>
        </ul>
      </div>

      <div class="grid_6">
        <ul class="list-2 top-5">
          <?php for (; $cpt3<$nb_categories3; $cpt3++) { ?>
          <li>
            <?php echo key($prix_par_categorie3); ?>
            <ul>
              <?php foreach (current($prix_par_categorie3) as $consommation3) { ?>
              <li><?php echo $consommation3['libelle'] .' => '. $consommation3['prix'] ?></li>
              <?php } ?>
            </ul>
          </li>
          <?php next($prix_par_categorie3); } ?>
        </ul>
      </div>
      
      <div class="grid_12 box-2 pad-1">
        <div>
          <p class="text-3">LES CHAMBRES</p>
        </div>
      </div>
      
      <div class="grid_6">
        <ul class="list-2 top-5">
          <?php
          $moitie4 = ceil($nb_categories4 / 2);
          reset($prix_par_categorie4);

          for ($cpt4=0; $cpt4<$moitie4; $cpt4++) {
          ?>
          <li>
            <?php echo key($prix_par_categorie4); ?>
            <ul>
              <?php foreach (current($prix_par_categorie4) as $consommation4) { ?>
              <li><?php echo $consommation4['libelle'] .' => '. $consommation4['prix'] ?></li>
              <?php } ?>
            </ul>
          </li>
          <?php next($prix_par_categorie4); } ?>
        </ul>
      </div>

      <div class="grid_6">
        <ul class="list-2 top-5">
          <?php for (; $cpt4<$nb_categories4; $cpt4++) { ?>
          <li>
            <?php echo key($prix_par_categorie4); ?>
            <ul>
              <?php foreach (current($prix_par_categorie4) as $consommation4) { ?>
              <li><?php echo $consommation4['libelle'] .' => '. $consommation4['prix'] ?></li>
              <?php } ?>
            </ul>
          </li>
          <?php next($prix_par_categorie4); } ?>
        </ul>
      </div>
	  <?php include_once 'include/footer.php' ?>  
  </section>
  
<!--==============================footer=================================-->


</body>
</html>
