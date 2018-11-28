<!DOCTYPE html>
<head>
	<?php
		session_start();
		require 'databaseaccess.php';
	?>
	<title>
		Flight Scheduler
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
		  <li><a href="index.php">Home</a></li>
		  <li><a class="active" href="flightscheduler.php">Flight Scheduler</a></li>
		  <li style="float:right"><a class="logout" href="logout.php">Log Out</a></li>
		</ul>
	</div>
	<h1>Flight Scheduler </h1>
	<table>
        <thead>
            <tr>
                <th>Scheduler ID</th>
                <th>Flight ID</th>
                <th>Flight Date</th>
                <th>Flight Delay</th>
                <th>Plane ID</th>
                <th>Schedule</th>

            </tr>
        </thead>
		<tbody align="center">
			<?php
			
			$database = new DbConnect();	
			$databaseconnect = $database->connect();
			$query = " SELECT * FROM flight_scheduler";
			$result = mysqli_query($databaseconnect,$query);
			while($row = mysqli_fetch_array($result)){?>
				<tr>
					
                    <td><?php    echo $row["scheduler_id"];  ?></td>
                    <td><?php  echo $row["flight_id"];  ?></td>
                    <td><?php  echo $row["flight_date"];   ?></td>
                    <td><?php  echo $row["flight_delay"];  ?></td>
                    <td><?php  echo $row["plane_id"];  ?></td>
                    

    				<td><a class="button" href="/AirlineDMBS/AirlineDBMS/seatbooking.php?sid=<?php echo $row["scheduler_id"]?>">Schedule</a></td>
            	</tr><?php
			}
		?>
        </tbody>
    </table>
	
	


</body>
