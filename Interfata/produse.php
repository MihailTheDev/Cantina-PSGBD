<!DOCTYPE html>
<html>
<head>
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
	<h2 align="center">
	
	<?php
	echo "Produsele disponibile din data de ".date("d-m-Y");
	?>
	
	</h2>
	<table align="center" border="1px" style="width: 600px; line-height: 40px;">
			<tr>
			<th style="width:500px; background-color: brown">Denumire produs</th>
			<th style="background-color: brown">Pret</th>
			</tr>
			<?php
			$stid = oci_parse($conn, 'SELECT NUME, PRET FROM PRODUSE');
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