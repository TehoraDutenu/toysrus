<?php require_once './requete/config.php'; ?>
<?php require_once './requete/get_toys.php'; ?>
<?php require_once './template/_toy.php'; ?>
<?php require_once './template/_list_brand.php'; ?>
<?php require_once './template/_header.php'; ?>
<?php require_once './template/_navbar.php'; ?>

<?php


if (isset($_GET['brand_id'])) {
    $brand_id = intval($_GET['brand_id']);
    get_title($brand_id);
    echo "<div class='d-flex flex-wrap justify-content-center'>";
    get_all_toys($brand_id);
    echo "</div>";
} else {
    get_all_toys(0);
}




require_once './template/_footer.php';

?>