<!DOCTYPE html>
<head>
	<?php
	session_start();
		require 'databaseaccess.php';
		if (!isset($_SESSION['id'])) {
			// echo "name";
	    	header('location: welcome.php');
	    }
	    elseif($_SESSION['type']!="customer"){
	    	// echo $_SESSION['type'];
	    	header('location: welcome.php');
	    }elseif (!isset($_SESSION['scheduler_id'])) {
	    	header('location: flightscheduler.php');
	    }
	?>
	<title>
		Booking
	</title>
	<style type="text/css">
		a.button {
    -webkit-appearance: button;
    -moz-appearance: button;
    appearance: button;

    text-decoration: none;
    color: initial;
}
	</style>
	<link href="css.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="navBar">
		<ul>
		  
		  <li><a href="flightscheduler.php">Flight Scheduler</a></li>
		  <li style="float:right"><a class="logout" href="logout.php">Log Out</a></li>
		</ul>
	</div>


	<h1>Book </h1>
	<?php $sid = $_SESSION['scheduler_id'];
	$seatno = $_GET['seatno'];
	$items = $_SESSION['cart'];
	$seats = explode(",", $items);
	?>
	<form action="submitdetails.php" method="POST">
	<?php
	$i=0;
	foreach ($seats as $key=>$id) {
		$i+=1;
		$database = new DbConnect();	
		$databaseconnect = $database->connect();
		$query = " SELECT * FROM flight_scheduler,flight where scheduler_id = $sid and flight_scheduler.flight_id = flight.flight_id";
		$result = mysqli_query($databaseconnect,$query);
		$query = " SELECT additional_charge FROM class where class_name = $sid and flight_scheduler.flight_id = flight.flight_id";
		while($row = mysqli_fetch_array($result)){
			$ticket_value=$row["ticket_value"];
		}
		?>
		<h3>Seat No:<?php echo $id  ?></h3>
		<label for="passport"><b>Passport ID:</b></label>
		<input align="center" type="text" name="passport<?php echo $i;?>"> 
		<br><br>
		<label for="firstname"><b>First Name:</b></label>
		<input align="center" type="text" name="firstname<?php echo $i;?>"> 
		<br><br>
		<label for="lastname"><b>Last Name:</b></label>
		<input align="center" type="text" name="lastname<?php echo $i;?>"> 
		<br><br>
		<label for="age"><b>Age:</b></label>
		<input align="center" type="text" name="age<?php echo $i;?>"> 
		<br><br>
		<label for="ticketvalue"><b>Ticket Value(Economy):</b></label>
		<input type="text" name="ticket_value" value="<?php echo $ticket_value?>" readonly>
		<br><br><br>
	<?php
	}
	?>
	<label for="ticketamount"><b>Number of Tickets:</b></label>
		<input type="text" name="ticketamount" value="<?php echo $i?>" readonly>
		<br><br><br>
		<button class="mainbutton" type= "submit">Submit</button>
	</form>
	
	<br>
	<br>

	<br><br><br>
	<table >
		<tr>
			<th>Class Type</th>
			<th>Additinal Charge Precentage</th>
			<th>Full Charge</th>
		</tr>
		<tr align="center">
			<td>First Class</td>
			<td>70%</td>
			<td><?php echo $ticket_value * 1.7?></td>
		</tr>
		<tr align="center">
			<td>Business Class</td>
			<td>40%</td>
			<td><?php echo $ticket_value * 1.4?></td>
		</tr>
		<tr align="center">
			<td>Premium Economy Class</td>
			<td>30%</td>
			<td><?php echo $ticket_value * 1.3?></td>
		</tr>
		<tr align="center">
			<td>Economy Class</td>
			<td>0%</td>
			<td><?php echo $ticket_value * 1?></td>
		</tr>
		


	</table>

	
	
	


</body>



