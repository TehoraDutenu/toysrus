<?php

function render_toy($toy)
{
?>
    <a class="card m-2" href="../details.php?toy_id=<?php echo $toy['id'] ?>" style="width:18rem">
        <div class="d-flex flex-column align-items-center card-body">
            <img class="toy_image" src="../img/<?php echo $toy['image'] ?>" alt="Image de " <?php echo $toy['name'] ?>>
            <h5 class="toy_name"><?php echo $toy['name'] ?></h5>
            <p class="toy_price"><?php echo str_replace('.', ',', $toy['price']) ?>€</p>
        </div>
    </a>

<?php }

function render_toy_detail($toy)
{
?>
    <div class="d-flex flex-column align-items-center">
        <h2 class="mt-3"> <?php echo $toy['name'] ?> </h2>
        <div class="d-flex justify-content-center">
            <div class="d-flex flex-column col-md-4 p-4">
                <img class="toy-image" src="../img/<?php echo $toy['image'] ?>" alt="<?php echo $toy['name'] ?>">
                <p class="toy_price"><?php echo str_replace('.', ',', $toy['price']) ?>€</p>

                <form method="post">
                    <select name="store">
                        <option value="0">Quel magasin ?</option>
                        <?php get_all_store() ?>
                    </select>
                    <input type="submit" value="OK">
                </form>

                <?php
                $toy_id = $toy['id'];
                $store_id = empty($_POST['store']) ? 0 : $_POST['store'];

                get_toys_by_store($toy_id, $store_id)
                ?>
                <!-- TODO: appeler une fonction qui va retourner le nombre de jouets par magasin ou le nombre total de jouets -->
            </div>
            <div class="d-flex flex-column col-md-8 p-4">
                <p class="fw-bold"><span class="text-primary">Marque: </span> <?php echo $toy['brand_name'] ?> </p>
                <p> <?php echo $toy['description'] ?></p>
            </div>
        </div>
    </div>
<?php
}

function render_toy_by_store($toy)
{
    // si le stock est à on affiche "produit épuisé" sinon on affiche la quantité
    $quantity = $toy['quantity'] == 0 ? "Produit épuisé" : $toy['quantity'];
    $color = $toy['quantity'] == 0 ? "text-danger" : ($toy['quantity'] < 5 ? "text-warning" : "text-primary");
?>

    <div class="card mb-3" style="width: 540px;">
        <div class="row g-0">
            <div class="col-md-4">
                <img src="../img/<?php echo $toy['image'] ?>" class="img-fluid rounded-start " alt="<?php echo $toy['name'] ?>">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title"><?php echo $toy['name'] ?></h5>
                    <p class="card-text"><?php echo str_replace('.', ',', $toy['price']) ?>€</p>
                    <p class="card-text">Stock disponible :
                        <small class="<?php echo $color ?> fw-bold"><?php echo $quantity ?></small>
                    </p>
                    <a href="../details.php?toy_id=<?php echo $toy['id'] ?>" class="btn btn-outline-primary">Détails</a>
                </div>
            </div>
        </div>
    </div>

<?php
}
