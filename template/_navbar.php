<div class="d-flex flex-column w-100">
    <div>
        <a href="../index.php">
            <img class="m-2 logo" src="../img/logo.jpg" alt="Logo du site">
        </a>
    </div>

    <nav class="navbar navbar-expand-lg bg-body-tertiary custom-background">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../toys.php">Accueil</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Par marque
                        </a>
                        <ul class="dropdown-menu">
                            <?php get_toys_by_brand(); ?>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Par magasin
                        </a>
                        <ul class="dropdown-menu">
                            <?php get_stores(); ?>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>