<!DOCTYPE html>
<head>
	<?php
	session_start();
		require 'databaseaccess.php';
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

</head>

<body>
	<h1>Book </h1>
	<?php $sid = $_SESSION['scheduler_id'];
	$seatno = $_GET['seatno'];
	$items = $_SESSION['cart'];
	$seats = explode(",", $items);
	foreach ($seats as $key=>$id) {
		$database = new DbConnect();	
		$databaseconnect = $database->connect();
		$query = " SELECT * FROM flight_scheduler,flight where scheduler_id = $sid and flight_scheduler.flight_id = flight.flight_id";
		$result = mysqli_query($databaseconnect,$query);
		$query = " SELECT additional_charge FROM class where class_name = $sid and flight_scheduler.flight_id = flight.flight_id";
		while($row = mysqli_fetch_array($result)){
			$ticket_value=$row["ticket_value"];
		}
		?>
		<label for="seat_no_label"><b>Seat No:</b></label>
		<input align="center" type="text" name="seat_no" value="<?php echo $id ?>"readonly>
		<br><br>
		<label for="passport"><b>Passport ID:</b></label>
		<input align="center" type="text" name="passport"> 
		<br><br>
		<label for="firstname"><b>First Name:</b></label>
		<input align="center" type="text" name="firstname"> 
		<br><br>
		<label for="lastname"><b>Last Name:</b></label>
		<input align="center" type="text" name="lastname"> 
		<br><br>
		<label for="age"><b>Age:</b></label>
		<input align="center" type="text" name="age"> 
		<br><br>
		<label for="ticketvalue"><b>Ticket Value(Economy):</b></label>
		<input type="text" name="ticket_value" value="<?php echo $ticket_value?>" readonly>
		<br><br>

	<?php 
	}
	
	?>
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



