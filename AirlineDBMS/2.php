<!DOCTYPE html>
<html>
<head>
	<?php
		require 'databaseaccess.php';
	?>
	<title>
		Reports
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
	<?php $x; ?>
	<?php $y; ?>
	<?php $query; ?>

		
<form method = "post">
  from:<br>
	<input type="date" name="from"><br>
  to :<br>
	<input type="date" name="to"><br>

	<br>	
  
  <input type="submit" value="Submit" name="submit">
	<?php
if(isset($_POST["submit"]) )
{
	$x= $_POST['from'];
	$y = $_POST['to'];

 

	
    $database = new DbConnect();	
		
	$databaseconnect = $database->connect();
	$query1 = " SELECT route.flight_to AS destination, COUNT(booking.no_of_seats) AS NumberOfPassengers FROM booking LEFT JOIN flight_scheduler ON booking.scheduler_id=flight_scheduler.scheduler_id LEFT JOIN flight ON flight_scheduler.flight_id=flight.flight_id LEFT JOIN route ON flight.route_id=route.route_id WHERE flight_date BETWEEN CAST('$x' AS DATE) AND CAST('$y' AS DATE) GROUP BY flight_to";
	//$query2 = " SELECT first_name,last_name,age FROM booking LEFT OUTER JOIN customer ON booking.customer_id=customer.customer_id WHERE booking.scheduler_id=$x and customer.age>=18";
	//$query3 = " SELECT first_name,last_name,age FROM booking LEFT OUTER JOIN customer ON booking.customer_id=customer.customer_id WHERE booking.scheduler_id=$x and customer.age<18";

	
	
			$result = mysqli_query($databaseconnect,$query1);
		
		
			echo "<table class= 'table-bordered'>";
			echo"<th>"; echo" destination"; echo"</th>";
			echo"<th>"; echo"number of passengers"; echo"</th>";
			//echo"<th>"; echo"age"; echo"</th>";

			while($row = mysqli_fetch_array($result)){
					echo"<tr>";
					echo"<td>";   echo $row["destination"]; echo"</td>";   
					echo"<td>";   echo $row["NumberOfPassengers"]; echo"</td>";   
					//echo"<td>";   echo $row["age"]; echo"</td>";   
					echo"</tr>";
		}
		
	/*else if($y==2){
		$result = mysqli_query($databaseconnect,$query2);
		
		
			echo "<table class= 'table-bordered'>";
			echo"<th>"; echo"first name"; echo"</th>";
			echo"<th>"; echo"last name"; echo"</th>";
			echo"<th>"; echo"age"; echo"</th>";

			while($row = mysqli_fetch_array($result)){
					echo"<tr>";
					echo"<td>";   echo $row["first_name"]; echo"</td>";   
					echo"<td>";   echo $row["last_name"]; echo"</td>";   
					echo"<td>";   echo $row["age"]; echo"</td>";   
					echo"</tr>";
	}
	}
	else if ($y==1){
		$result = mysqli_query($databaseconnect,$query3);
		
		
			echo "<table class= 'table-bordered'>";
			echo"<th>"; echo"first name"; echo"</th>";
			echo"<th>"; echo"last name"; echo"</th>";
			echo"<th>"; echo"age"; echo"</th>";

			while($row = mysqli_fetch_array($result)){
					echo"<tr>";
					echo"<td>";   echo $row["first_name"]; echo"</td>";   
					echo"<td>";   echo $row["last_name"]; echo"</td>";   
					echo"<td>";   echo $row["age"]; echo"</td>";   
					echo"</tr>";
	}
	
	

	}*/	
		
		
		

echo"</table>";


	
}	

?>

</form>
	
</body>



</html>