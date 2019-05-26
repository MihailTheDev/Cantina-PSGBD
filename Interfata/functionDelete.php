<?php

function delete_user($nume, $parola){
            $nume = 'Adrian';
            $parola = 'admin';
            $conn = oci_connect('ANDR', 'ANDR', 'localhost/XE');
            $sql = 'BEGIN :value := deleteUser(:name,:parola); END;';
            $stid = oci_parse($conn, $sql);
			oci_bind_by_name($stid, ':name', $nume);
            oci_bind_by_name($stid, ':parola', $parola);
            oci_bind_by_name($stid, ':value', $value);
            oci_execute($stid);

            if($value)
			echo "User sters <br>";
			
			oci_free_statement($stid);
			oci_close($conn);
        }

?>