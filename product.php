<?php include 'includes/session.php'; ?>
<?php
if(!isset($_GET['product'])){
	header('location: index.php');
}
	$conn = $pdo->open();

	$slug = $_GET['product'];

	try{
		 		
	    $stmt = $conn->prepare("SELECT *, products.name AS prodname, category.name AS catname, products.id AS prodid FROM products LEFT JOIN category ON category.id=products.category_id WHERE slug = :slug");
	    $stmt->execute(['slug' => $slug]);
		$product = $stmt->fetch();
		
		
	}
	catch(PDOException $e){
		echo "There is some problem in connection: " . $e->getMessage();
	}
	

	//page view
	$now = date('Y-m-d');
	if($product['date_view'] == $now){
		$stmt = $conn->prepare("UPDATE products SET counter=counter+1 WHERE id=:id");
		$stmt->execute(['id'=>$product['prodid']]);
	}
	else{
		$stmt = $conn->prepare("UPDATE products SET counter=1, date_view=:now WHERE id=:id");
		$stmt->execute(['id'=>$product['prodid'], 'now'=>$now]);
	}

?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue layout-top-nav">
<script>
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12';
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
<div class="wrapper">

	<?php include 'includes/navbar.php'; ?>
	 
	  <div class="content-wrapper">
	    <div class="container">

	      <!-- Main content -->
	      <section class="content">
	        <div class="row">
	        	<div class="col-sm-9">
	        		<div class="callout" id="callout" style="display:none">
	        			<button type="button" class="close"><span aria-hidden="true">&times;</span></button>
	        			<span class="message"></span>
	        		</div>
		            <div class="row">
		            	<div class="col-sm-6">
		            		<img src="<?php echo (!empty($product['photo'])) ? 'images/'.$product['photo'] : 'images/noimage.jpg'; ?>" width="100%" class="zoom" data-magnify-src="images/large-<?php echo $product['photo']; ?>">
		            		<br><br>
		            		<form class="form-inline" id="productForm">
		            			<div class="form-group">
			            			
			            			<button type="submit" class="btn btn-primary btn-lg btn-flat"><i class="fa fa-shopping-cart"></i> Add to favorites</button>
			            		</div>
		            		</form>
		            	</div>
		            	<div class="col-sm-6">
		            		<h1 class="page-header"><?php echo $product['prodname']; ?></h1>
		            		<h3><b><?php echo number_format($product['price'], 2); ?> DT</b></h3>
		            		<p><b>Category:</b> <a href="category.php?category=<?php echo $product['cat_slug']; ?>"><?php echo $product['catname']; ?></a></p>
		            		<p><b>Description:</b></p>
		            		<p><?php echo $product['description']; ?></p>
		            	</div>
		            </div>
		            <br>
					
				    
	        	</div>
	        	<div class="col-sm-3">
	        		<?php include 'includes/sidebar.php'; ?>
	        	</div>
				<div class="container">
						<div class="row">
						<div class="col-sm-12">
						<h3>User comments here</h3>
						</div><!-- /col-sm-12 -->
						</div><!-- /row -->
						<div class="row">
						<div class="col-sm-1">
						<div class="thumbnail">
						<img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
						</div><!-- /thumbnail -->
						</div><!-- /col-sm-1 -->

						
						
						<form action="/ecommerce/post_comment.php" method="post">
						
							<div class="form-group">
								<textarea name="post_comment" class="form-control"  rows="3"></textarea>
							</div>
							<input id="prodId" name="prodId" type="hidden" <?php echo 'value="' . $slug . '"';?>>
							<input type="submit" class="btn btn-primary mb-2" name="post_it" value="post">
						</form>
						
						

					</div><!-- /container -->
					<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
					<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
					<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
					<h2 class="page-header">Comments</h2>
					<?php
                    $conn = $pdo->open();

                    $where= "";
                    
                       
                    try{
						$stmt1 = $conn->prepare("SELECT * FROM products WHERE slug=:namev");
						$stmt1->execute(['namev'=>$slug]);
						foreach($stmt1 as $row1){
							$id_post= $row1['id'];
						}
                      $stmt = $conn->prepare("SELECT * FROM comment WHERE id_product=$id_post");
                      $stmt->execute();
                      foreach($stmt as $row){
						  $use=$row['id_user'];
                        $stmt2 = $conn->prepare("SELECT * FROM users WHERE id=$use LIMIT 1");
						  $stmt2->execute();
						  foreach($stmt2 as $rowuser){
							  $fname_user = $rowuser['firstname'];
							  $lname_user = $rowuser['lastname'];
							  $photo = $rowuser['photo'];

						  }
                        echo "
						<div class='container'>
						<div class='row'>
						  <div class='col-md-8'>
							
							  <section class='comment-list'>
								<!-- First Comment -->
								<article class='row'>
								  <div class='col-md-2 col-sm-2 hidden-xs'>
									<figure class='thumbnail'>
									  <img class='img-responsive' src='images/".$photo;echo "' />
									  <figcaption class='text-center'>".$fname_user;echo " ".$lname_user;echo "</figcaption>
									</figure>
								  </div>
								  <div class='col-md-10 col-sm-10'>
									<div class='panel panel-default arrow left'>
									  <div class='panel-body'>
										<header class='text-left'>
										  <div class='comment-user'><i class='fa fa-user'></i> ".$fname_user;echo " ".$lname_user;echo "</div>
										  <time class='comment-date' datetime='16-12-2014 01:05'><i class='fa fa-clock-o'></i> ".$row['date_post'];echo "</time>
										</header>
										<br>
										<div class='comment-post'>
										  <p>
											".$row['post_comment'];echo "
										  </p>
										</div>
										
									  </div>
									</div>
								  </div>
								</article>
							  
							  </section>
						  </div>
						</div>
					  </div>
                        ";
                      }
                    }
                    catch(PDOException $e){
                      echo $e->getMessage();
                    }

                    $pdo->close();
                  ?>






					
<!------ Include the above in your HEAD tag ---------->



	        </div>
	      </section>
	     
	    </div>
	  </div>
  	<?php $pdo->close(); ?>
  	<?php include 'includes/footer.php'; ?>
</div>

<?php include 'includes/scripts.php'; ?>
<script>
$(function(){
	$('#add').click(function(e){
		e.preventDefault();
		var quantity = $('#quantity').val();
		quantity++;
		$('#quantity').val(quantity);
	});
	$('#minus').click(function(e){
		e.preventDefault();
		var quantity = $('#quantity').val();
		if(quantity > 1){
			quantity--;
		}
		$('#quantity').val(quantity);
	});

});
</script>
</body>
</html>