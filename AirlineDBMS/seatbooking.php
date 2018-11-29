<!DOCTYPE html>
<head>
	<?php
	session_start();
		require 'databaseaccess.php';
		if (!isset($_GET['sid'])) {
	    	header('location: flightscheduler.php');
	    }
	    elseif (!isset($_SESSION['id'])) {
			// echo "name";
	    	header('location: welcome.php');
	    }
	    elseif($_SESSION['type']!="customer"){
	    	header('location: welcome.php');
	    }

		if ( !empty($_POST) ) {
			$database = new DbConnect();	
			$databaseconnect = $database->connect();
			$customer_id = mysqli_real_escape_string($databaseconnect, $_POST['customer_id']);
			$classtype = mysqli_real_escape_string($databaseconnect, $_POST['classtype']);
			$ticket_value = mysqli_real_escape_string($databaseconnect, $_POST['ticket_value']);
			$scheduler_id = mysqli_real_escape_string($databaseconnect, $_POST['scheduler_id']);
			$seat_no = mysqli_real_escape_string($databaseconnect, $_POST['seat_no']);
			
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
	<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">	
	<link href="css.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="navBar">
		<ul>
		  
		  <li><a href="flightscheduler.php">Flight Scheduler</a></li>
		  <li style="float:right"><a class="logout" href="logout.php">Log Out</a></li>
		</ul>
	</div>
	<h1>Select a Seat </h1>
	<h2>Sheduler ID</h2> 
	<?php 
	if(!isset($_SESSION['cart']) or empty($_SESSION['cart'])){
		$_SESSION['scheduler_id'] = $_GET['sid'];
		
	}
	$sid = $_GET['sid'];
	?><h2><?php echo $_SESSION['scheduler_id'];?></h2><?php
	if(isset($_GET['seatno']) & !empty($_GET['seatno'])){
		if(isset($_SESSION['cart']) & !empty($_SESSION['cart'])){
			$items = $_SESSION['cart'];
			$cartitems = explode(",", $items);
			if(in_array($_GET['seatno'], $cartitems)){
			}else{
				$items .= "," . $_GET['seatno'];
				$_SESSION['cart'] = $items;
	
			}
		}else{
			$items = $_GET['seatno'];
			$_SESSION['cart'] = $items;
		}
	}
	?>
	<div class = "container">
	<div class = "row">
	<div class="col-sm">
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
		                    <td><a class="button" href="seatbooking.php?sid=<?php echo $sid?>&seatno=<?php echo $row["seat_no"]?>">Add to Cart </a></td>
	                	<?php } ?>
	                	
	            	</tr><?php
				}
			?>
	        </tbody>
	    </table>
	</div>
	<div class="col-sm">
		<h2> Cart </h2>
		<table>
			<thead>
	            <tr>
	                <th>Scheduler ID</th>
	                <th>Seat No</th>
	            </tr>
	    	</thead>
	    	<tbody align="center">
			    <?php 
			    if(isset($_SESSION['cart']) & !empty($_SESSION['cart'])){
				    $items = $_SESSION['cart'];
					$seats = explode(",", $items);
					foreach ($seats as $key=>$id) {
		 			?>	  	
					<tr>
						<td><?php echo $_SESSION['scheduler_id']; ?></td>
						<td><?php echo $id; ?></td>
						
					</tr>
				<?php  
					}
				}
				?>
			</tbody>
		</table>
		<a class="button" href="booking.php?sid=<?php echo $sid?>&seatno=<?php echo $row["seat_no"]?>">Book</a>
	</div>
	</div>
</div>
</body>