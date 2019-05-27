<?php
    $add_user = null;
    include_once "all_functions.php";

    if(isset($_POST['submit'])){

        $add_user = add_user($_POST['nume'], $_POST['tip'], $_POST['parola'] );
    }

    include_once "user.php";

    
?>
        

