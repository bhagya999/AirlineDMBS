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
	<input type="text" name="from"><br>
  to :<br>
	<input type="text" name="to"><br>

	<br>	
  
  <input type="submit" value="Submit" name="submit">
	<?php
if(isset($_POST["submit"]) )
{
	$x= $_POST['from'];
	$y = $_POST['to'];

 

	
    $database = new DbConnect();	
		
	$databaseconnect = $database->connect();
	

	$query1 = "SELECT * FROM flight_scheduler NATURAL JOIN flightview NATURAL JOIN route NATURAL JOIN passengercount WHERE flight_from = '{$x}' AND flight_to = '{$y}'";

	$result = mysqli_query($databaseconnect,$query1);
		
			
			echo "<table class= 'table-bordered'>";
			echo"<th>"; echo" Flight From"; echo"</th>";
			echo"<th>"; echo"Flight To"; echo"</th>";
			echo"<th>"; echo"Scheduler ID"; echo"</th>";
			echo"<th>"; echo"No of Passengers"; echo"</th>";

			while($row = mysqli_fetch_array($result)){
					echo"<tr>";
					echo"<td>";   echo $row["flight_from"]; echo"</td>";   
					echo"<td>";   echo $row["flight_to"]; echo"</td>";   
					echo"<td>";   echo $row["scheduler_id"]; echo"</td>";   
					echo"<td>";   echo $row["count(*)"]; echo"</td>";
					echo"</tr>";
		}
		
	
		
		

echo"</table>";


	
}	

?>

</form>
	
</body>



</html>

