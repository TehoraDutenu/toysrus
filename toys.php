<?php require_once './template/_header.php'; ?>
<?php require_once './template/_navbar.php'; ?>
<?php require_once './template/_toy.php'; ?>
<?php require_once './template/_list_brand.php'; ?>
<?php require_once './requete/config.php'; ?>
<?php require_once './requete/get_toys.php'; ?>


<?php

// on regarde si on a une valeur postée
// si c'est vide on lui donne la valeur 0
// sinon on lui donne la valeur de $_POST['brand']
$brand_id = empty($_POST['brand']) ? 0 : $_POST['brand'];

get_title($brand_id); ?>


<form method="post">
    <select name="brand">
        <option value="0">Toutes les marques</option>
        <?php get_all_brand() ?>
    </select>
    <input type="submit" value="OK">
</form>

<div class="d-flex flex-wrap justify-content-center">
    <?php
    get_all_toys($brand_id);
    ?>
</div>

<?php require_once './template/_footer.php'; ?>