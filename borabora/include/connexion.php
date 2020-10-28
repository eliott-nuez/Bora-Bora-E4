<?php
// Création de la connexion à la base de données
$serveur = "localhost";
$nom_de_la_base = "borabora";
$utilisateur = 'root';
$mot_de_passe = '';
$pdo = new PDO(
  "mysql:host=".$serveur.";dbname=".$nom_de_la_base, $utilisateur, $mot_de_passe,
  array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8", PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION)
);