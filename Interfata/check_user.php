<?php
    $check_user = null;
    include_once "all_functions.php";

    if(isset($_POST['submit-check'])){

        $check_user = check_user($_POST['nume'], $_POST['parola']);
    }

    include_once "user.php";

    
?>
        

