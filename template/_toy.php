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
