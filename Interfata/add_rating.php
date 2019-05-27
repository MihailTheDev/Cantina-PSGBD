<?php
    $add_rating = null;
    include_once "all_functions.php";

    if(isset($_POST['submit'])){

        $add_rating = add_rating($_POST['id'], $_POST['valoare']);
    }

    include_once "produse.php";

    
?>