<?php
    $delete_user = null;
    include_once "all_functions.php";

    if(isset($_POST['submit-delete'])){

        $delete_user = delete_user($_POST['nume'], $_POST['parola']);
    }

    include_once "user.php";

    
?>
        

