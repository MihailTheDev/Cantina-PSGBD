<?php

     function add_user($name, $tip, $parola){
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

        function delete_user($nume, $parola){
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
        

        function add_rating($id, $valoare){
            $conn = oci_connect('ANDR', 'ANDR', 'localhost/XE');
            $sql = 'BEGIN :value := AddRating(:id,:valoare); END;';
            $stid = oci_parse($conn, $sql);
			oci_bind_by_name($stid, ':id', $id);
            oci_bind_by_name($stid, ':valoare', $valoare);
            oci_bind_by_name($stid, ':value', $value);
            oci_execute($stid);

            if($value)
			echo "Rating adaugat, va multumim! <br>";
			
			oci_free_statement($stid);
			oci_close($conn);
        }



        function generateMenu(){


            $conn = oci_connect('ANDR', 'ANDR', 'localhost/XE');
                $sql = 'BEGIN :value := generate(); END;';
                $stid = oci_parse($conn, $sql);       
                oci_bind_by_name($stid, ':value', $value);
                oci_execute($stid);	
                oci_commit($conn);
                if($value ==1 )
                    echo "meniu generat cu success! ^_^";

                oci_close($conn);
        
            }
        function deleteMenu(){


            $conn = oci_connect('ANDR', 'ANDR', 'localhost/XE');
                $sql = 'delete from meniu';
                $stid = oci_parse($conn, $sql);       
                oci_execute($stid);	
                oci_commit($conn);

                echo "meniu sters";

                oci_close($conn);
        
            }
        ?>
        

