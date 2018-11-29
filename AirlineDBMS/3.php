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
<link href="css.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="navBar">
		<ul>
		  
		  <li><a class="active" href="">Aeroplane Types</a></li>
		  <li><a href="flight.php">Flights</a></li>
		  <li><a href="scheduler_add.php">Update scheduler</a></li>
		  <li><a href="1.php">Report 1</a></li>
		  <li><a href="2.php">Report 2</a></li>
		  <li><a href="3.php">Report 3</a></li>
		  <li><a href="4.php">Report 4</a></li>
		  <li><a href="5.php">Report 5</a></li>
		  <li style="float:right"><a class="logout" href="logout.php">Log Out</a></li>
		</ul>
	</div>
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
	$query1 = " SELECT DISTINCT class_name, count(class_type) AS NumberOfPassengers FROM (passenger LEFT OUTER JOIN passenger_destination ON passenger.booking_id=passenger_destination.booking_Id)NATURAL JOIN class WHERE flight_date BETWEEN cast('$x'as date) and cast('$y' as date) GROUP BY class_type ";
	
			$result = mysqli_query($databaseconnect,$query1);
		
		
			echo "<table class= 'table-bordered'>";
			echo"<th>"; echo" class type"; echo"</th>";
			echo"<th>"; echo"number of passengers"; echo"</th>";
			//echo"<th>"; echo"age"; echo"</th>";

			while($row = mysqli_fetch_array($result)){
					echo"<tr>";
					echo"<td>";   echo $row["class_name"]; echo"</td>";   
					echo"<td>";   echo $row["NumberOfPassengers"]; echo"</td>";   
					//echo"<td>";   echo $row["age"]; echo"</td>";   
					echo"</tr>";
		}
		
echo"</table>";


	
}	

?>

</form>
	
</body>



</html>