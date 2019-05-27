<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="st.css">
	<title>Interfata</title>
</head>
<body>
<?php

$conn = oci_connect('ANDR', 'ANDR', 'localhost/XE');
if (!$conn) {
    $e = oci_error();
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
}
?>

	<h2 align="center" class="header">
		Utilizatori
    </h2>
	
    </h2>
    <?php
        include_once "user_add.php";
        include_once "user_delete.php";
    ?>
    <div  style="padding-bottom:30px">


    <form action="" method="POST">
	<input type="text" name="nume" placeholder="Introduce numele de user">
	<input type="text" name="tip" placeholder="Tipul de user (Admin/Client)" style="width: 170px">
	<input type="password" name="parola" placeholder="Introduce parola">
	<button type="submit" name="submit" style="cursor:pointer">Adauga user</button>
    
	<br>         
    </form>	

    <button style="float:right; cursor:pointer" onclick="window.location.assign('Meniu.php')">Inapoi</button>	
    	
    <form action="" method="POST">
	<input type="text" name="nume" placeholder="Introduce numele de user">
	<input type="password" name="parola" placeholder="Introduce parola" style="width: 170px">
	<button type="submit"  name="submit-delete" style="cursor:pointer">Sterge user</button>
	<br>

	
    </form>
    </div>
	
	<table align="center" border="1px" style="width: 600px; line-height: 40px;">
			<tr>
			<th style="width:335px; background-color: brown">Nume utilizator</th>
			<th style="background-color: brown">Privilegiu</th>
			</tr>
			<?php
			$stid = oci_parse($conn, 'SELECT NUME, TIP FROM UTILIZATORI WHERE ID_UTILIZATOR>999990');
			$r = oci_execute($stid);
			

			print "<table border='1' align='center'; style='width:600px; line-height:40px;'>\n";
			while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
				print "<tr>\n";
				foreach ($row as $item) {
					print "    <td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "&nbsp;") . "</td>\n";
				}
				print "</tr>\n";
			}
			print "</table>\n";

			oci_free_statement($stid);
			oci_close($conn);

			?>
	</table>
    
    
</body>
</html>