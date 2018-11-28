<?php
	require 'databaseaccess.php';
	session_start();
	$sid = $_SESSION['scheduler_id'];
	$cid = $_SESSION['customer_id'];
	$ticket_amount = $_POST['ticketamount'];
	$database = new DbConnect();	
	$databaseconnect = $database->connect();
	$query4 = " SELECT * FROM flight_scheduler,flight where scheduler_id = $sid and flight_scheduler.flight_id = flight.flight_id";
	$result4 = mysqli_query($databaseconnect,$query4);
	while($row = mysqli_fetch_array($result4)){
			$ticket_value=$row["ticket_value"];
		}
	$totalamount = $ticket_value * $ticket_amount;
	$sql3 = "INSERT INTO booking(customer_id, scheduler_id,payment,booked_time,no_of_seats) VALUES ('{$cid}','{$sid}','{$totalamount}',now(),'{$ticket_amount}')";
	$result3 = mysqli_query($databaseconnect,$sql3);
	$items = $_SESSION['cart'];
	$seats = explode(",", $items);
	$i=0;
	foreach ($seats as $key=>$id) {
		$i++; 
     	$firstname = $_POST['firstname'.$i];
      	$lastname = $_POST['lastname'.$i];
     	$passport = $_POST['passport'.$i];
  		$age = $_POST['age'.$i];
   		$sql = "SELECT booking_id FROM booking ORDER BY booking_id DESC LIMIT 1;";
		$result = mysqli_query($databaseconnect,$sql);
		while($row = mysqli_fetch_array($result)){
			$bookingid=$row["booking_id"];
		}
     	$sql1 = "INSERT INTO passenger(passport_id,first_name,last_name,seat_no,booking_id,class_type,age) VALUES ('{$passport}','{$firstname}','{$lastname}','{$id}','{$bookingid}',1,'{$age}')";
     	$result1 = mysqli_query($databaseconnect,$sql1);
     	echo mysqli_error($databaseconnect);
     	$sql2 = "UPDATE seat SET state='Booked' WHERE scheduler_id=$sid and seat_no=$id ";
     	$result2 = mysqli_query($databaseconnect,$sql2);
	}



	unset($_SESSION['cart']);
 	unset($_SESSION['scheduler_id']);
 	header('Location: flightscheduler.php');
	
	
?>