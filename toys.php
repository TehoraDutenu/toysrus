<?php require_once './template/_header.php'; ?>
<?php require_once './template/_navbar.php'; ?>
<?php require_once './template/_toy.php'; ?>
<?php require_once './template/_list_brand.php'; ?>
<?php require_once './requete/config.php'; ?>
<?php require_once './requete/get_toys.php'; ?>

<h1>Liste des jouets</h1>

<form method="post">
    <select name="brand">
        <option value="0">Toutes les marques</option>
        <?php get_all_brand() ?>
    </select>
    <input type="submit" value="OK">
</form>

<?php var_dump($_POST); ?>
<div class="d-flex flex-wrap justify-content-center">
    <?php get_all_toys($_POST['brand']); ?>
</div>


<?php require_once './template/_footer.php'; ?>