<?php
	include 'includes/session.php';
	

	if(isset($_POST['post_it'])){
		if(isset($_SESSION['admin']) || isset($_SESSION['user']) )
		{
			if(isset($_SESSION['admin'])){
				$id =$_SESSION['admin'];
			}
		
			if(isset($_SESSION['user'])){
				$id=$_SESSION['user'];
			}
			
			$post_comment = $_POST['post_comment'];
			
			$name_prod = $_POST['prodId'];
			$conn = $pdo->open();
	
			$stmt = $conn->prepare("SELECT * FROM products WHERE slug=:namev");
			$stmt->execute(['namev'=>$name_prod]);
			foreach($stmt as $row){
				$id_post= $row['id'];
			}
			
			try{
				$stmt1 = $conn->prepare("INSERT INTO comment (id_user, id_product, post_comment) VALUES (:id_user, :id_product, :post_comment)");
				$stmt1->execute(['id_user'=>$id, 'id_product'=>$id_post, 'post_comment'=>$post_comment]);
				$_SESSION['success'] = 'User added successfully';
				$parm = 'product='.$name_prod.'';
				header("location: product.php?product=$name_prod");
	
			}
			catch(PDOException $e){
				$_SESSION['error'] = $e->getMessage();
			}
			$pdo->close();
		}
		else{
			header('location: login.php');
		}
	

	}
        
	
	
	else{
		$_SESSION['error'] = 'Fill up product form first';
	}

	

?>