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
	echo "Lista de produse la care se poate da rating ";
	?>
	
	</h2>
	<table align="center" border="1px" style="width: 800px; line-height: 40px;">
			<tr>
			<th style="width:75px; background-color: brown">Numar</th>
			<th style="width:433px; background-color: brown">Denumire produs</th>
			<!-- <th style="background-color: brown">Pret</th>
			<th style="background-color: brown">Rating</th> -->
			</tr>
			<?php
			$stid = oci_parse($conn, 'SELECT ID_PRODUS, NUME FROM PRODUSE');
			//$stid = oci_parse($conn, 'SELECT PRODUSE.ID_PRODUS, PRODUSE.NUME, PRODUSE.PRET, RATING.VALOARE_RATING FROM PRODUSE INNER JOIN RATING ON PRODUSE.ID_PRODUS=RATING.ID_PRODUS');
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
		<form align="center" action="" method="POST">
		<input type="text" name="id" placeholder="Introduce numarul produsului dorit" style="width: 250px">
		<input type="text" name="valoare" placeholder="Rating (1-5)" style="width: 170px">
		<button type="submit" name="submit" style="cursor:pointer">Adauga rating</button>     
		</form>

		<br>
		<button style="cursor:pointer; font-size: 15px" onclick="window.location.assign('rating_list.php')">Lista de rating a produselor</button>
		
		</div>
</body>
</html>