<?php

function render_list_brand($brand)
{
    $selected = '';
    if ($_POST['brand'] == $brand['id']) {
        $selected = 'selected';
    } ?>
    <option value="<?php echo $brand['id'] ?>" <?php echo $selected ?>><?php echo $brand['name'] ?></option>;
<?php
}


function render_list_store($store)
{
    $selected = '';
    if ($_POST['store'] == $store['id']) {
        $selected = 'selected';
    } ?>
    <option value="<?php echo $store['id'] ?>" <?php echo $selected ?>><?php echo $store['name'] ?></option>;
<?php

}
