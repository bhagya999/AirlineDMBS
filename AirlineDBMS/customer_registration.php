<!DOCTYPE html>
<head>
	<?php
		require 'databaseaccess.php';
	?>
	<title>
		Register
	</title>
	

</head>

<body>
	<h1>Register </h1>
	<br>
	<br>
	<form action="login.php" method="POST" >
		<label for="first_name_label"><b>First Name:</b></label>
		<input align="center" type="text" name="first_name">
		<br><br>
		<label for="last_name_label"><b>Last Name:</b></label>
		<input align="center" type="text" name="last_name">
		<br><br>
		<label for="address_label"><b>Address:	</b></label>
		<input type="text" name="address"><br><br>
		<label for="email_address_label"><b>Email Address:</b></label>
		<input type="text" name="email_address"><br><br>
		<label for="username_label"><b>User Name:</b></label>
		<input type="text" name="user_name"><br><br>
		<label for="password_label"><b>Password:</b></label>
		<input type="text" name="password"><br><br>
		<br><br>
		<input type="submit" value="Register">
	</form>
	<br><br><br>


</body>
