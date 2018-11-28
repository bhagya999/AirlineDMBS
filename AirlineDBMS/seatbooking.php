<!DOCTYPE html>
<head>
	<?php
	session_start();
		require 'databaseaccess.php';
		if ( !empty($_POST) ) {
			$customer_id = $_POST['customer_id'];
			$classtype = $_POST['classtype'];
			$ticket_value = $_POST['ticket_value'];
			$scheduler_id = $_POST['scheduler_id'];
			$seat_no = $_POST['seat_no'];
			$database = new DbConnect();	
			$databaseconnect = $database->connect();
			$sql1 = "SELECT * FROM class WHERE class_type = '$classtype'";
			$result = mysqli_query($databaseconnect,$sql1);
			while($row = mysqli_fetch_array($result)){
				$additional_charge=$row["additional_charge"];
				$final_amount = $ticket_value * $additional_charge/100;
			}
			
			$sql2 = "INSERT INTO booking(customer_id, scheduler_id,payment,booked_time,no_of_seats) VALUES ($customer_id,$scheduler_id,$final_amount,'2018-11-12 12:00:00',1)";
			$result1 = mysqli_query($databaseconnect,$sql2);
			$sql3 = "UPDATE seat SET state='Booked' WHERE scheduler_id=$scheduler_id and seat_no=$seat_no ";
			$result2 = mysqli_query($databaseconnect,$sql3);
		}
		
	?>
	<title>
		Seat Booking
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
	<h1>Select a Seat </h1>
	<h2>Sheduler ID</h2> 
	<?php 
	$_SESSION['scheduler_id'] = $_GET['sid'];
	$sid = $_GET['sid'];
	echo $_SESSION['scheduler_id'];

	?>
	<table>
        <thead>
            <tr>
                <th>Seat No</th>
                <th>State</th>
            </tr>
        </thead>
		<tbody align="center">
			<?php
			$database = new DbConnect();	
			$databaseconnect = $database->connect();
			$query = " SELECT seat_no , state FROM seat WHERE scheduler_id='$sid'";
			$result = mysqli_query($databaseconnect,$query);
			while($row = mysqli_fetch_array($result)){?>
				<tr>
                    <td><?php    echo $row["seat_no"];  ?></td>
                    <td><?php  echo $row["state"];  ?></td>
                    <?php
                    if($row["state"]=='Available'){?>
                    <td><a class="button" href="/AirlineDBMS/booking.php?sid=<?php echo $sid?>&seatno=<?php echo $row["seat_no"]?>">Book</a></td>
                    <td><a class="button" href="/AirlineDBMS/addtocart.php?sid=<?php echo $sid?>&seatno=<?php echo $row["seat_no"]?>">Add to Cart </a></td>
                	<?php } ?>
                	
            	</tr><?php
			}
		?>
        </tbody>
    </table>
	
	


</body>