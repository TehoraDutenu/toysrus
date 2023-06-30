<?php

if (isset($_POST['brand'])) {
    // on importe notre variable de connexion
    global $connection;
    $brand_id = intval($_POST['brand']);
    // on crée la requête sql
    $query_by_brand = "SELECT * FROM toys WHERE brand_id=$brand_id";
    // on exécute la requête
    if ($result = mysqli_query($connection, $query_by_brand)) {
        // on vérifie que l'on a des résultats
        if (mysqli_num_rows($result) > 0) {
            // on parcourt les résultats
            while ($toy = mysqli_fetch_assoc($result)) {
                render_toy($toy);
            }
        } else { ?>
            <div class="alert alert-warning" role="alert">
                Aucun jouet trouvé
            </div>
<?php  }
    }
}
