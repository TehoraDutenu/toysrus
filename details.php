<?php require_once './template/_header.php'; ?>
<?php require_once './template/_navbar.php'; ?>
<?php require_once './requete/config.php'; ?>
<?php require_once './requete/get_toys.php'; ?>
<?php require_once './template/_toy.php'; ?>
<?php require_once './template/_list_brand.php'; ?>


<?php $toy_id = intval($_GET['toy_id']); ?>

<h1>Details du jouet</h1>

<?php get_toy_with_brand($toy_id); ?>

<?php require_once './template/_footer.php'; ?>