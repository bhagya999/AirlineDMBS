<!DOCTYPE html>
<html>
<?php 
		if (!isset($_SESSION['id'])) {
	      header('location: welcome.php');
	    }
	    elseif($_SESSION['type']!="admin"){
	    	header('location: welcome.php');
	    } ?>
<head>
	<title>Update scheduler</title>
	<link href="css.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="navBar">
		<ul>
		  <li><a href="index.php">Home</a></li>
		  <li><a href="">Aeroplane Types</a></li>
		  <li><a href="flight.php">Flights</a></li>
		  <li><a  class="active" href="scheduler_add.php">Update scheduler</a></li>
		  <li style="float:right"><a class="logout" href="logout.php">Log Out</a></li>
		</ul>
	</div>
	<?php if ( !empty($_POST) ) {
		$planeID = $_POST['planeID'];
		$schedulerID = $_POST['schedulerID'];
		$flightID = $_POST['flightID'];
		$flightDate = $_POST['flightDate'];

		$servername = "localhost";
		$username = "root";
		$password = "";
		$dbname = "airlinedbms";

		// Create connection
		$conn = new mysqli($servername, $username, $password, $dbname);
		// Check connection
		if ($conn->connect_error) {
		    die("Connection failed: " . $conn->connect_error);
		} 

		$sql2 = "INSERT INTO flight_scheduler VALUES ($schedulerID, $flightID, $flightDate,'Not Delayed', $planeID)";
					$result2 = $conn->query($sql2);
		
		$sql = "SELECT no_of_seats FROM plane NATURAL JOIN aeroplane_type WHERE plane_id = $planeID ";
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
		    // output data of each row
		    while($row = $result->fetch_assoc()) {
		        
				for ($x = 1; $x <= $row["no_of_seats"]; $x++) {
				    $sql1 = "INSERT INTO seat VALUES ($schedulerID, $x, 00, 'Available')";
					$result1 = $conn->query($sql1);
				} 
		    }
		} else {
		    echo "0 results";
		}
		$conn->close();
	} ?>
	<h2>Update scheduler</h2>
	<form action="scheduler_add.php" method="post">
	  <fieldset>
	    <legend>Schedule details:</legend>
	    Scheduler ID:<br>
	    <input type="text" name="schedulerID" value="" required=""><br><br>
	    Flight ID:<br>
	    <input type="text" name="flightID" value="" required=""><br><br>
	    Plane ID:<br>
	    <input type="text" name="planeID" value="" required=""><br><br>
	    Flight Date:<br>
	    <input type="date" name="flightDate" value="" required=""><br><br>
	    <input type="submit" value="Submit">
	  </fieldset>
	</form>
</body>
</html>