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
    <div  style="padding-bottom:30px">


    <form action="">
	<input type="text" name="nume" placeholder="Introduce numele de user">
	<input type="text" name="tip" placeholder="Tipul de user (Admin/Client)" style="width: 170px">
	<input type="password" name="parola" placeholder="Introduce parola">
	<button type="submit">Adauga user</button>
	<br>
                  
				<?php
			/* 	if (isset($_GET["tip"])) {
					
					include 'functionAdd.php';
					$nume=$_GET['nume'];
					$tip=$_GET['tip'];
					$parola=$_GET['parola'];
					add_user($nume,$tip,$parola);
				} */
				?>

	</form>			
    <form action="">
	<input type="text" name="nume" placeholder="Introduce numele de user">
	<input type="password" name="parola" placeholder="Introduce parola" style="width: 170px">
	<button type="submit">Sterge user</button>
	<br>
    
		<?php
			
			/* include 'functionDelete.php';
			$nume=$_GET['nume'];
			$parola=$_GET['parola'];
			delete_user($nume,$parola); */

		?>

    </form>
    </div>
	
	<table align="center" border="1px" style="width: 600px; line-height: 40px;">
			<tr>
			<th style="width:303px; background-color: brown">Nume utilizator</th>
			<th style="background-color: brown">Privilegiu</th>
			</tr>
			<?php
			$stid = oci_parse($conn, 'SELECT NUME, TIP FROM UTILIZATORI  WHERE ID_UTILIZATOR>999998');
			if (!$stid) {
				$e = oci_error($conn);
				trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
			}
			$r = oci_execute($stid);
			if (!$r) {
				$e = oci_error($stid);
				trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
			}

			print "<table border='1' align='center' style='width:600px; line-height:40px;l='>\n";
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