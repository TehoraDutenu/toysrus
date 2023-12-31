<?php

function get_all_toys($brand_id)
{
    global $connection;
    // on crée la requête sql
    if ($brand_id == 0) {
        $query = "SELECT id, name, price, image FROM toys";
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
    } else {
        $query = "SELECT id, name, price, image FROM toys WHERE brand_id = ?";
        // on prépare la requête
        if ($stmt = mysqli_prepare($connection, $query)) {
            mysqli_stmt_bind_param($stmt, 'i', $brand_id);

            // on exécute la requête
            if (mysqli_stmt_execute($stmt)) {
                // on récupère le résultat de la requête
                $result = mysqli_stmt_get_result($stmt);

                // on vérifie que l'on a des résultats
                if (mysqli_num_rows($result) > 0) {

                    // on vérifie qu'on a des résultats
                    while ($toy = mysqli_fetch_assoc($result)) {
                        render_toy($toy);
                    }
                }
            }
        }
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


function get_title($brand_id)
{
    global $connection;

    if ($brand_id == 0) {
        ?>
        <h1>Tous les jouets</h1>
        <?php
    } else {
        $query = "SELECT name FROM brands WHERE id = ?";

        // on prépare la requête
        if ($stmt = mysqli_prepare($connection, $query)) {
            mysqli_stmt_bind_param(
                $stmt, // on lui donne la requête préparée(la variable qui est devant mysqli_prepare)
                'i', // on lui donne les types de parapètres de chaque ? (i=integer, s=string, d=double)
                $brand_id
            ); // on lui donne les valeurs des ? dans l'ordre

            //on exécute la requête
            if (mysqli_stmt_execute($stmt)) {
                // on récupère le résultat de la requête
                $result = mysqli_stmt_get_result($stmt);

                // on vérifie que l'on a des résultats
                while ($brand = mysqli_fetch_assoc($result)) {
                    // le rendu du titre avec la marque du jouet
        ?>
                    <h1>Tous les jouets de la marque : <?php echo $brand['name'] ?> </h1>

            <?php
                }
            }
        }
    }
}

function get_toy_with_brand($toy_id)
{
    //on récupère la connection à la base de données
    global $connection;

    // on crée la requête sql
    $query = "SELECT t.id, t.name, t.description, t.price, t.image, b.name AS brand_name
    FROM toys AS t
    INNER JOIN brands AS b
    ON t.brand_id = b.id
    WHERE t.id = $toy_id";

    // on exécute la requête
    if ($result = mysqli_query($connection, $query)) {
        // on vérifie que l'on a des résultats
        if (mysqli_num_rows($result) > 0) {
            while ($toy = mysqli_fetch_assoc($result)) {
                // ici le rendu HTML d'un jouet
                render_toy_detail($toy);
            }
        }
    }
}


function get_all_store()
{
    // on importe notre variable de connexion
    global $connection;

    // on crée la requête sql
    $query_store = "SELECT `id`, `name` FROM stores";
    // on exécute la requête
    if ($result = mysqli_query($connection, $query_store)) {
        // on vérifie que l'on a des résultats
        if (mysqli_num_rows($result) > 0) {
            // on parcourt les résultats
            while ($store = mysqli_fetch_assoc($result)) {
                render_list_store($store);
            }
        } else { ?>
            <div class="alert alert-warning" role="alert">
                Aucun magasin trouvé
            </div>
            <?php  }
    }
}

function get_toys_by_store($toy_id, $store_id)
{
    global $connection;

    if ($store_id == 0) {
        $query = "SELECT SUM(quantity) AS total 
        FROM stock 
        WHERE toy_id = $toy_id";
    } else {
        $query = "SELECT quantity AS total
        FROM stock
        WHERE toy_id = $toy_id
        AND store_id = $store_id";
    }
    // on exécute la requête
    if ($result = mysqli_query($connection, $query)) {
        // on vérifie si on a des résultats
        if (mysqli_num_rows($result) > 0) {
            while ($stock = mysqli_fetch_assoc($result)) {
            ?>
                <p class="fw-bold">
                    <span class="text-primary">Stock: </span>
                    <?php echo $stock['total']; ?>
                </p>
            <?php
            }
        }
    }
}

function get_top_3()
{
    global $connection;

    $query = "SELECT
                t.id,
                t.name,
                t.image,
                t.price,
                SUM(s.quantity) AS total
                FROM toys AS t
                INNER JOIN sales AS s 
                ON t.id = s.toy_id
                GROUP BY t.id
                ORDER BY total DESC
                LIMIT 3";

    // on exécute la requête
    if ($result = mysqli_query($connection, $query)) {
        // on vérifie si on a des résultats
        if (mysqli_num_rows($result) > 0) {
            while ($toy = mysqli_fetch_assoc($result)) {
                render_toy($toy);
            }
        }
    }
}


function get_toys_by_brand()
{
    global $connection;

    $query = "SELECT brands.name, brands.id, COUNT(toys.brand_id) AS total
                FROM brands
                INNER JOIN toys
                ON brands.id = toys.brand_id
                GROUP BY brands.id";

    if ($result = mysqli_query($connection, $query)) {
        if (mysqli_num_rows($result) > 0) {
            while ($brand = mysqli_fetch_assoc($result)) { ?>
                <li>
                    <a class="dropdown-item" href="../brand.php?brand_id=<?php echo $brand['id'] ?>">

                        <?php echo $brand['name'] ?> (<?php echo $brand['total'] ?>)
                    </a>
                </li>
            <?php
            }
        }
    }
}


function get_stores()
{
    global $connection;

    $query = "SELECT id, name FROM stores";

    if ($result = mysqli_query($connection, $query)) {
        if (mysqli_num_rows($result) > 0) {
            while ($store = mysqli_fetch_assoc($result)) { ?>
                <li>
                    <a class="dropdown-item" href="../store.php?store_id=<?php echo $store['id'] ?>">
                        <?php echo $store['name']; ?>
                    </a>
                </li>
                <?php
            }
        }
    }
}


function get_title_store($store_id)
{
    global $connection;

    if (isset($store_id)) {

        $query = "SELECT * FROM stores WHERE id = ?";

        // on prépare la requête
        if ($stmt = mysqli_prepare($connection, $query)) {
            mysqli_stmt_bind_param(
                $stmt, // on lui donne la requête préparée(la variable qui est devant mysqli_prepare)
                'i', // on lui donne les types de parapètres de chaque ? (i=integer, s=string, d=double)
                $store_id
            ); // on lui donne les valeurs des ? dans l'ordre

            //on exécute la requête
            if (mysqli_stmt_execute($stmt)) {
                // on récupère le résultat de la requête
                $result = mysqli_stmt_get_result($stmt);

                if (mysqli_stmt_execute($stmt)) {
                    // on vérifie que l'on a des résultats
                    while ($store = mysqli_fetch_assoc($result)) {
                        // le rendu du titre avec la marque du jouet
                ?>
                        <h1>Magasin choisi : <?php echo $store['name'] ?> </h1>
                        <h5>Adresse : <?= $store['postal_code'] ?>, <?= $store['city'] ?> </h5>

<?php
                    }
                }
            }
        }
    }
}


function get_all_toys_by_store($store_id)
{
    // on récupère la connection
    global $connection;

    if (isset($store_id)) {
        // on récupère la requête sql
        $query = "SELECT
                    stock.quantity,
                    toys.id,
                    toys.name,
                    toys.price,
                    toys.image,
                    stores.name AS store_name,
                    stores.postal_code,
                    stores.city,
                    brands.name AS brand_name
                FROM stock
                    INNER JOIN toys ON stock.toy_id = toys.id
                    INNER JOIN stores ON stock.store_id = stores.id
                    INNER JOIN brands ON toys.brand_id = brands.id
                WHERE stores.id = ?";

        // on prépare la requête
        if ($stmt = mysqli_prepare($connection, $query)) {
            mysqli_stmt_bind_param(
                $stmt, // on lui donne la requête préparée(la variable qui est devant mysqli_prepare)
                'i', // on lui donne les types de parapètres de chaque ? (i=integer, s=string, d=double)
                $store_id
            ); // on lui donne les valeurs des ? dans l'ordre

            //on exécute la requête
            if (mysqli_stmt_execute($stmt)) {
                // on récupère le résultat de la requête
                $result = mysqli_stmt_get_result($stmt);

                if (mysqli_stmt_execute($stmt)) {
                    // on vérifie que l'on a des résultats
                    while ($toy = mysqli_fetch_assoc($result)) {
                        // le rendu du titre avec la marque du jouet

                        render_toy_by_store($toy);
                    }
                }
            }
        }
    }
}
