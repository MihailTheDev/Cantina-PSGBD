<?php
    $add_com = null;
    include_once "all_functions.php";

    if(isset($_POST['submit'])){

        $add_com = add_com($_POST['id'], $_POST['comanda']);
    }

    include_once "comenzi.php";

    
?>
        

