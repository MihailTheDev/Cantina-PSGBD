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
	
	<?php
	echo "Lista de comenzi ";
	include_once "add_comanda.php";
	?>
	</h2>

	<button style="float:right; cursor:pointer" onclick="window.location.assign('Meniu.php')">Inapoi</button>

	<table align="center" border="1px" style="width: 800px; line-height: 40px;  margin-right:394px;">
			<tr>
			<th style="width:100px; background-color: brown">Numarul comenzii</th>
			<th style="width:100px; background-color: brown">Nume Utilizator</th>
			<th style="width:100px; background-color: brown">Numarul utilizatorului</th>
			</tr>
			<?php
			$stid = oci_parse($conn, 'SELECT COMANDA.ID_COMANDA, UTILIZATORI.NUME ,UTILIZATORI.ID_UTILIZATOR FROM COMANDA INNER JOIN UTILIZATORI ON COMANDA.ID_UTILIZATOR=UTILIZATORI.ID_UTILIZATOR');
			if (!$stid) {
				$e = oci_error($conn);
				trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
			}
			$r = oci_execute($stid);
			if (!$r) {
				$e = oci_error($stid);
				trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
			}

			print "<table border='1' align='center'; style='width:800px; line-height:40px;'>\n";
			while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
				print "<tr>\n";
				foreach ($row as $item) {
					print "<td>" . htmlentities($item, ENT_QUOTES) . "</td>\n";
				}
				print "</tr>\n";
			}
			print "</table>\n";

			oci_free_statement($stid);
			oci_close($conn);

			?>
			<br>
	</table>
	<div align="center" style="padding-bottom:3em">

		<form action="" method="POST">
		<input type="text" name="id" placeholder="Introduce numarul id-ului dumnevoastra" style="width: 250px">
		<input type="text" name="comanda" placeholder="Numarul comenzii" style="width: 170px">
		<button type="submit" name="submit" style="cursor:pointer">Adauga comanda</button>     
		</form>
		</div>
</body>
</html>