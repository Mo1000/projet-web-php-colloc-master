<?php
	include 'includes/session.php';
	$id_user = $_SESSION['admin'];

	$output = '';

	$conn = $pdo->open();

	$stmt = $conn->prepare("SELECT * FROM products");
	$stmt->execute();
	foreach($stmt as $row){
		$output .= "
			<option value='".$row['id']."' class='append_items'>".$row['name']."</option>
		";
	}

	$pdo->close();
	echo json_encode($output);

?>