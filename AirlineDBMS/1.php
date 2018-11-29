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
  shedule nomber:<br>
	<input type="int" name="name"><br>
  age :<br>
	<select name= "age">
	<option value= 1> below 18 </option>
	<option value= 2> over 18 </option>
	<option value= 3> All </option>
	</select><br>	
  
  <input type="submit" value="Submit" name="submit">
	<?php
if(isset($_POST["submit"]) )
{
	$x= $_POST['name'];
	$y = $_POST['age'];

 

	
    $database = new DbConnect();	
		
	$databaseconnect = $database->connect();
	$query1 = " SELECT first_name,last_name,age FROM booking LEFT OUTER JOIN passenger ON booking.booking_id=passenger.booking_id WHERE booking.scheduler_id=$x";
	$query2 = " SELECT first_name,last_name,age FROM booking LEFT OUTER JOIN passenger ON booking.booking_id=passenger.booking_id WHERE booking.scheduler_id=$x and passenger.age>=18";
	$query3 = " SELECT first_name,last_name,age FROM booking LEFT OUTER JOIN passenger ON booking.booking_id=passenger.booking_id WHERE booking.scheduler_id=$x and passenger.age<18";

	
	if ($y == 3){
			$result = mysqli_query($databaseconnect,$query1);
			echo mysqli_error($databaseconnect);
		
		
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
	else if($y==2){
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
	
	

	}	
		
		
		

echo"</table>";


	
}	

?>

</form>
	
</body>



</html>