<?php

function render_list_brand($brand)
{
?>
    <option value="<?php echo $brand['id'] ?>"><?php echo $brand['name'] ?></option>
<?php
}
