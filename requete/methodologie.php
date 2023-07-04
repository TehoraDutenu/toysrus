<?php
require_once './config.php';

// ------------------------- Cas d'un requete sans paramètre et sans condition -------------------------


// 1- Penser à récupérer la connexion à la base de données (fichier config.php dans un dossier requete)
// avec le mot clé global suivi du nom de variable de notre connexion
global $connection; // $connection vient du fichier config.php

// 2- Ecrire la requete sql dans une variable du nom de notre choix (query est pas obligatoire)
$query = "SELECT * FROM toys"; // La mettre dans une variable est plus pratique à utiliser plus tard

// 3- Comme on n'a pas de parametre on peux directement execute la requete avec mysqli_query()
$result = mysqli_query($connection, $query); // 1ere parametre la connexion à la BDD, 2eme parametre la requete

// 4- On passe le résultat dans un tableau associatif avec mysqli_fetch_assoc()
while ($variable = mysqli_fetch_assoc($result)) {
    // 5- Maintenant dans la boucle, c'est ici qu'il faut faire le rendu HTML
    // et c'est $variable qui contient les données de chaque ligne de la table toys
    var_dump($variable);
    var_dump($variable['id']);
    var_dump($variable['name']);
    var_dump($variable['description']);
    var_dump($variable['image']);
    var_dump($variable['price']);
    // Soit on echo les données directement en PHP
    echo "<h1>$variable[name]</h1>"; ?>
    <!-- Soit on sort du PHP et on fait du HTML -->
    <p><?php echo $variable['price'] ?></p>

<?php
}


// ------------------------- Cas d'un requete sans paramètre avec condition cas d'erreur -------------------------


// 1- Penser à récupérer la connexion à la base de données (fichier config.php dans un dossier requete)
// avec le mot clé global suivi du nom de variable de notre connexion
global $connection; // $connection vient du fichier config.php

// 2- Ecrire la requete sql dans une variable du nom de notre choix (query est pas obligatoire)
$query1 = "SELECT * FROM toys"; // La mettre dans une variable est plus pratique à utiliser plus tard

// 3- Premiere Condition lorsqu'on execute la requete
if ($result = mysqli_query($connection, $query1)) {

    // 4- On verifie que l'on a au moins un résultat
    if (mysqli_num_rows($result) > 0) {
        // Si je rentre dans la condition c'est que j'ai au moins un résultat

        // -5 On passe le resultat dans un tableau assiciatif avec mysqli_fetch_assoc()
        while ($variable = mysqli_fetch_assoc($result)) {

            // 6- Maintenant dans la boucle, c'est ici qu'il faut faire le rendu HTML
            // et c'est $variable qui contient les données de chaque ligne de la table toys
            echo "<h1>$variable[name]</h1>";
        }
    } else {

        // Si je rentre dans le else c'est que je n'ai pas de résultat
        // On peux faire un rendu HTML pour dire qu'il n'y a pas de résultat
        echo "<h1>Il n'y a pas de jouet</h1>";
    }
} else {

    // Ici on gére l'erreur si la connexion n'est pas bonne ou la requete est mal écrite.
    die("Erreur dans la requete sql: $query1");
}


// ------------------------- Cas d'un requete avec paramètre avec condition cas d'erreur -------------------------


// 1- Penser à récupérer la connexion à la base de données (fichier config.php dans un dossier requete)
// avec le mot clé global suivi du nom de variable de notre connexion
global $connection; // $connection vient du fichier config.php

// 2- Ecrire la requete sql dans une variable du nom de notre choix (query est pas obligatoire)
$query2 = "SELECT * FROM toys WHERE id=?"; // Le ? remplace le parametre dynamique

// 3- On prépare la requete avec mysqli_prepare()
if ($stmt = mysqli_prepare($connection, $query2)) {

    // 4- On peux bind le/les parametre avec mysqli_stmt_bind_param()
    mysqli_stmt_bind_param(
        $stmt,  // 1ere paramètre la requete préparé
        "i",    // 2eme paramètre le type de paramètre (i pour interger, s pour string, d pour double)
        $id     // 3eme paramètre la variable qui contient la valeur du paramètre  
    );

    // 5- On execute la requete avec mysqli_stmt_execute()
    if (mysqli_stmt_execute($stmt)) {
        if ($result = mysqli_stmt_get_result($stmt)) {

            // 7- On verifie que l'on est au moins un résultat
            if (mysqli_num_rows($result) > 0) {
                // Si je rentre dans la condition c'est que j'ai au moins un résultat

                // -8 On passe le resultat dans un tableau assiciatif avec mysqli_fetch_assoc()
                while ($variable = mysqli_fetch_assoc($result)) {

                    // 9- Maintenant dans la boucle, c'est ici qu'il faut faire le rendu HTML
                    // et c'est $variable qui contient les données de chaque ligne de la table toys
                    echo "<h1>$variable[name]</h1>";
                }
            } else {

                // Si je rentre dans le else c'est que je n'ai pas de résultat
                // On peux faire un rendu HTML pour dire qu'il n'y a pas de résultat
                echo "<h1>Il n'y a pas de jouet</h1>";
            }
        }
    } else {

        // Ici on gere l'erreur lors de l'execution de la requete
        die("Erreur lors de l'execution de la requete");
    }
} else {

    // Ici on gére l'erreur si la connexion n'est pas bonne ou la requete est mal écrite.
    die("Erreur dans la requete sql: $query2");
}
