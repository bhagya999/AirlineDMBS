<html>
<?php 
	session_start();
    if (!isset($_SESSION['user_name'])) {
      header('location: welcome.php');
    }
 ?>
<head>
	<title>Home</title>
</head>
<body>

</body>
</html>