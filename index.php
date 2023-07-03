<?php require_once './template/_header.php'; ?>
<?php require_once './template/_navbar.php'; ?>
<?php require_once './template/_toy.php'; ?>
<?php require_once './requete/config.php'; ?>
<?php require_once './requete/get_toys.php'; ?>

<h1>Accueil Top 3</h1>

<div class="d-flex flex-wrap justify-content-center">
    <?php get_top_3(); ?>
</div>


<?php require_once './template/_footer.php'; ?>