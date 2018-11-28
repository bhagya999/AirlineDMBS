<!DOCTYPE html>
<head>
	<?php
		require 'databaseaccess.php';
		if ( !empty($_POST) ) {
			$first_name = $_POST['first_name'];
			$last_name = $_POST['last_name'];
			$address = $_POST['address'];
			$email_address = $_POST['email_address'];
			$user_name = $_POST['user_name'];
			$password = $_POST['password'];
			$database = new DbConnect();	
			$databaseconnect = $database->connect();
			$sql1 = "SELECT * FROM customer";
			$result1 = mysqli_query($databaseconnect,$sql1);
			$count = mysqli_num_rows($result1)+1;
			$sqlf = "INSERT INTO customer(customer_id,first_name,last_name,address,email,user_name,password,package_type) VALUES ($count,'$first_name','$last_name','$address','$email_address','$user_name','$password','Guest')";
			$result = mysqli_query($databaseconnect,$sqlf);
		}
	?>
	<title>
		Login
	</title>

</head>
