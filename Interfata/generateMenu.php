<?php

     function generateMenu(){
        $conn = oci_connect('ANDR', 'ANDR', 'localhost/XE');
			$sql = 'BEGIN generate_menu(); END;';
            $stid = oci_parse($conn, $sql);       

            oci_execute($stid);			
			oci_free_statement($stid);
			oci_close($conn);
    
        }
    
        ?>
        
