<?php

     function add_user($name, $tip, $parola){
        $name = 'Adrian';
        $tip = 'Client';
        $parola = 'admin';
        $conn = oci_connect('ANDR', 'ANDR', 'localhost/XE');
			$sql = 'BEGIN :value := createUser(:name, :tip, :parola); END;';
            $stid = oci_parse($conn, $sql);

			oci_bind_by_name($stid, ':name', $name);
			oci_bind_by_name($stid, ':tip', $tip);
            oci_bind_by_name($stid, ':parola', $parola);
            oci_bind_by_name($stid, ':value', $value);
            

            oci_execute($stid);
            if($value)
			echo "User adaugat <br>";
			
			oci_free_statement($stid);
			oci_close($conn);
    
        }
    
        ?>
        

