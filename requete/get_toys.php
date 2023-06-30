<?php

function get_all_toys($brand_id)
{
    global $connection;
    // on crée la requête sql
    if ($brand_id == 0) {
        $query = "SELECT id, name, price, image FROM toys";
    } else {
        $query = "SELECT id, name, price, image FROM toys WHERE brand_id = $brand_id";
    }

    if ($result = mysqli_query($connection, $query)) {
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


function get_all_brand()
{
    // on importe notre variable de connexion
    global $connection;
    // on crée la requête sql
    $query_brand = "SELECT * FROM brands";
    // on exécute la requête
    if ($result = mysqli_query($connection, $query_brand)) {
        // on vérifie que l'on a des résultats
        if (mysqli_num_rows($result) > 0) {
            // on parcourt les résultats
            while ($brand = mysqli_fetch_assoc($result)) {
                render_list_brand($brand);
            }
        } else { ?>
            <div class="alert alert-warning" role="alert">
                Aucun jouet trouvé
            </div>
<?php  }
    }
}
