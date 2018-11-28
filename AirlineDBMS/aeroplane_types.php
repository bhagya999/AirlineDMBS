<!DOCTYPE html>
<head>

	<?php
		require 'databaseaccess.php';
	?>
	<title>
		Aeroplane Types
	</title>
	<link href="css.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="navBar">
		<ul>
		  <li><a href="#home">Home</a></li>
		  <li><a class="active" href="">Aeroplane Types</a></li>
		  <li><a href="#contact">Contact</a></li>
		  <li style="float:right"><a href="#about">About</a></li>
		</ul>
	</div>
	<h1>Aero Plane Types <a href="logout.php"><button>Log Out</button></a></h1> 
	
	
	<table>
        <thead>
            <tr>
                <th>Type ID</th>
                <th>No of Seats</th>
                <th>Maximum Flight Duration</th>
                <th>Types of the engine</th>
                <th>No of Engines</th>
            </tr>
        </thead>
		<tbody align="center">
			<?php
			$database = new DbConnect();	
			$databaseconnect = $database->connect();
			$query = " SELECT * FROM aeroplane_type";
			$result = mysqli_query($databaseconnect,$query);
			while($row = mysqli_fetch_array($result)){?>
				<tr>
                    <td><?php    echo $row["type_id"];  ?></td>
                    <td><?php  echo $row["no_of_seats"];  ?></td>
                    <td><?php  echo $row["max_flight_duration"];   ?></td>
                    <td><?php  echo $row["type_of_engine"];  ?></td>
                    <td><?php  echo $row["number_of_engine"];  ?></td>
            	</tr><?php
			}
		?>
        </tbody>
    </table>
</body>