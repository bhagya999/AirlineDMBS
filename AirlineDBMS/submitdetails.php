<?php
	require 'databaseaccess.php';
	session_start();
	$sid = $_SESSION['scheduler_id'];
	$cid = $_SESSION['customer_id'];
	echo $sid;
	$database = new DbConnect();	
	$databaseconnect = $database->connect();
	$sql3 = "INSERT INTO booking(customer_id, scheduler_id,payment,booked_time,no_of_seats) VALUES ($cid,$sid,55000,now(),1)";
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
   		$sql = "SELECT * FROM booking";
		$result = mysqli_query($databaseconnect,$sql);
		$num_rows = mysqli_num_rows($result)+1;
     	$sql1 = "INSERT INTO passenger(passport_id,first_name,last_name,seat_no,booking_id,class_type,age) VALUES ('{$passport}','{$firstname}','{$lastname}','{$id}','{$num_rows}',1,'{$age}')";
     	$result1 = mysqli_query($databaseconnect,$sql1);
     	echo mysqli_error($databaseconnect);
     	$sql2 = "UPDATE seat SET state='Booked' WHERE scheduler_id=$sid and seat_no=$id ";
     	$result2 = mysqli_query($databaseconnect,$sql2);
	}
	
	
?>