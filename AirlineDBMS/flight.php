<!DOCTYPE html>
<head>
	<?php
	session_start();
		require 'databaseaccess.php';
		if (!isset($_SESSION['id'])) {
	      header('location: welcome.php');
			// echo $_SESSION['type'];
	    }
	    elseif($_SESSION['type']!="admin"){
	    	header('location: welcome.php');
	    	// echo "111";
	    }
	?>
	<title>
		Flights
	</title>
	<link href="css.css" rel="stylesheet" type="text/css">

</head>

<body>
	<div class="navBar">
		<ul>
		  
		  <li><a href="aeroplane_types.php">Aeroplane Types</a></li>
		  <li><a class="active" href="flight.php">Flights</a></li>
		  <li><a href="scheduler_add.php">Update scheduler</a></li>
		  <li><a href="1.php">Report 1</a></li>
		  <li><a href="2.php">Report 2</a></li>
		  <li><a href="3.php">Report 3</a></li>
		  <li><a href="4.php">Report 4</a></li>
		  <li><a href="5.php">Report 5</a></li>
		  <li style="float:right"><a class="logout" href="logout.php">Log Out</a></li>
		</ul>
	</div>
	<h1>Flights </h1>
	<table>
        <thead>
            <tr>
                <th>Flight ID</th>
                <th>Flight Day</th>
                <th>Flight Time</th>
                <th>Route ID</th>
            </tr>
        </thead>
		<tbody align="center">
			<?php
			$database = new DbConnect();	
			$databaseconnect = $database->connect();
			$query = " SELECT * FROM flight";
			$result = mysqli_query($databaseconnect,$query);
			while($row = mysqli_fetch_array($result)){?>
				<tr>
                    <td><?php    echo $row["flight_id"];  ?></td>
                    <td><?php  echo $row["flight_day"];  ?></td>
                    <td><?php  echo $row["flight_time"];   ?></td>
                    <td><?php  echo $row["route_id"];  ?></td>
            	</tr><?php
			}
		?>
        </tbody>
    </table>
	
	


</body>
