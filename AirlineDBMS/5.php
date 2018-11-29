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
	<?php	
$database = new DbConnect();	
$databaseconnect = $database->connect();
$query1 = "SELECT type_id,SUM(final_amount) FROM (booking NATURAL JOIN revenue) NATURAL JOIN (flight_scheduler NATURAL JOIN plane) GROUP BY type_id";
	$result = mysqli_query($databaseconnect,$query1);
		
			
			echo "<table class= 'table-bordered'>";
			echo"<th>"; echo" Plane Type"; echo"</th>";
			echo"<th>"; echo"Total Revenue"; echo"</th>";

			while($row = mysqli_fetch_array($result)){
					echo"<tr>";
					echo"<td>";   echo $row["type_id"]; echo"</td>";   
					echo"<td>";   echo $row["SUM(final_amount)"]; echo"</td>"; 
					echo"</tr>";
			}
		
	
		
		

echo"</table>";




?>

</form>
	
</body>



</html>

