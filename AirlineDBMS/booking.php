<!DOCTYPE html>
<head>
	<?php
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
	<?php $sid = $_GET['sid'];
	$seatno = $_GET['seatno'];
	
	?>
	<br>
	<br>

	<form action="seatbooking.php?sid=<?php echo $sid?>" method="POST" >
		<label for="scheduler_id_label"><b>Scheduler_ID:</b></label>
		<input align="center" type="text" name="scheduler_id" value="<?php echo $sid ?>"readonly>
		<br><br>
		<label for="seat_no_label"><b>Seat No:</b></label>
		<input align="center" type="text" name="seat_no" value="<?php echo $seatno ?>"readonly>
		<br><br>
		<label for="cid"><b>Customer ID:	</b></label>
		<input type="text" name="customer_id"><br><br>
		<label for="classtypelabel"><b>Class Type:</b></label>
		<select name="classtype" >
            <option value="1">First Class</option>
            <option value="2">Business Class</option>
            <option value="3" >Premium Economy Class</option>
            <option value="4" >Economy</option>
        </select><br><br>
        <?php 	
        $database = new DbConnect();	
		$databaseconnect = $database->connect();
		$query = " SELECT * FROM flight_scheduler,flight where scheduler_id = $sid and flight_scheduler.flight_id = flight.flight_id";
		$result = mysqli_query($databaseconnect,$query);
		$query = " SELECT additional_charge FROM class where class_name = $sid and flight_scheduler.flight_id = flight.flight_id";
		while($row = mysqli_fetch_array($result)){
			$ticket_value=$row["ticket_value"];
		}
		?>
        <label for="ticketvalue"><b>Ticket Value(Economy):</b></label>
		<input type="text" name="ticket_value" value="<?php echo $ticket_value?>" readonly>
		<br><br>
		<input type="submit" value="Book">
	</form>
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



