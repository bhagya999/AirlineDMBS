<?php
	require 'databaseaccess.php';
	session_start();
	$sid = $_SESSION['scheduler_id'];
	$cid = $_SESSION['id'];
	$ticket_amount = $_POST['ticketamount'];
	$database = new DbConnect();	
	$databaseconnect = $database->connect();
	$query4 = " SELECT * FROM flight_scheduler,flight where scheduler_id = $sid and flight_scheduler.flight_id = flight.flight_id";
	$result4 = mysqli_query($databaseconnect,$query4);
	while($row = mysqli_fetch_array($result4)){
			$ticket_value=$row["ticket_value"];
		}
	$totalamount = $ticket_value * $ticket_amount;
	mysqli_autocommit($databaseconnect, false);
	$flag = true;
	$sql3 = "INSERT INTO booking(id, scheduler_id,payment,booked_time,no_of_seats) VALUES ('{$cid}','{$sid}','{$totalamount}',now(),'{$ticket_amount}')";
	$result3 = mysqli_query($databaseconnect,$sql3);
	if (!$result3) {

		$flag = false;

		echo "Error details: " . mysqli_error($databaseconnect) . ".";
	}

	$items = $_SESSION['cart'];
	$seats = explode(",", $items);
	$i=0;
	foreach ($seats as $key=>$id) {
		$i++; 
     	$firstname = mysqli_real_escape_string($databaseconnect, $_POST['firstname'.$i]);
      	$lastname = mysqli_real_escape_string($databaseconnect, $_POST['lastname'.$i]);
     	$passport = mysqli_real_escape_string($databaseconnect, $_POST['passport'.$i]);
  		$age = mysqli_real_escape_string($databaseconnect, $_POST['age'.$i]);
   		$sql = "SELECT booking_id FROM booking ORDER BY booking_id DESC LIMIT 1;";
		$result = mysqli_query($databaseconnect,$sql);
		while($row = mysqli_fetch_array($result)){
			$bookingid=$row["booking_id"];
		}
     	$sql1 = "INSERT INTO passenger(passport_id,first_name,last_name,seat_no,booking_id,class_type,age) VALUES ('{$passport}','{$firstname}','{$lastname}','{$id}','{$bookingid}',1,'{$age}')";
     	$result1 = mysqli_query($databaseconnect,$sql1);
     	if (!$result1) {

			$flag = false;

			echo "Error details: " . mysqli_error($databaseconnect) . ".";
		}
     	echo mysqli_error($databaseconnect);
     	$sql2 = "UPDATE seat SET state='Booked' WHERE scheduler_id=$sid and seat_no=$id ";
     	$result2 = mysqli_query($databaseconnect,$sql2);
     	if (!$result2) {

			$flag = false;

			echo "Error details: " . mysqli_error($databaseconnect) . ".";
		}
	}
	$lastamount = $totalamount*0.95;
	$sql5 = "INSERT INTO revenue(booking_id, sub_total,discounting_amount,final_amount) VALUES ('{$bookingid}','{$totalamount}',5,'{$lastamount}')";
	$result5 = mysqli_query($databaseconnect,$sql5);
	if (!$result5) {

			$flag = false;

			echo "Error details: " . mysqli_error($databaseconnect) . ".";
		}
	if ($flag) {
		mysqli_commit($databaseconnect);
		
		} else {
		mysqli_rollback($databaseconnect);
		
	}



	unset($_SESSION['cart']);
 	unset($_SESSION['scheduler_id']);
 	header('Location: flightscheduler.php');
	
	
?>