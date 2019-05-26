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
	echo "Meniul de azi ".date("d-m-Y");
	?>
	
	</h2>
	<button type="submit">Genereaza Meniu</button>
	<table align="center" border="1px" style="width: 600px; line-height: 40px;">
			<tr>
			<th style="background-color:brown;">Denumire preparat/Dish name</th>
			<th style="background-color:brown;">Cantitate/Cantity</th>
			<th style="background-color:brown;">Pret/Price</th>
			</tr>
			
			<?php
				include 'generateMenu.php';
				generateMenu();

			?>

			
	</table>

</body>
</html>