<?php
// on va déclarer nos constantes
define('DB_HOST', 'database');
define('DB_USER', 'admin');
define('DB_PASS', 'admin');
define('DB_NAME', 'toysrus');


// on établit la connexion avec la base de données
$connection = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);

// on vérifie la connexion
if (!$connection) {
    die('Erreur : ' . mysqli_connect_error());
}
// echo 'Connexion réussie';

// on force l'encodage en utf-8 pour la prise en charge des caractères spéciaux
mysqli_set_charset($connection, 'utf8');
// mysqli_query($connection, 'SET NAMES utf8');