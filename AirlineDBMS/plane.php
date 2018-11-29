<!DOCTYPE html>
<head>
	<?php
	session_start();
		require 'databaseaccess.php';
		if (!isset($_SESSION['id'])) {
	      header('location: welcome.php');
	    }
	    elseif($_SESSION['type']!="admin"){
	    	header('location: welcome.php');
	    }
	?>
	<title>
		Planes
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
	<h1>Aero Planes </h1>
	<table>
        <thead>
            <tr>
                <th>Plane ID</th>
                <th>Plane Name</th>
                <th>Plane Type ID</th>
                <th>Bought Year</th>
                <th>Last Maintained Date</th>
            </tr>
        </thead>
		<tbody align="center">
			<?php
			$database = new DbConnect();	
			$databaseconnect = $database->connect();
			$query = " SELECT * FROM plane";
			$result = mysqli_query($databaseconnect,$query);
			while($row = mysqli_fetch_array($result)){?>
				<tr>
                    <td><?php    echo $row["plane_id"];  ?></td>
                    <td><?php  echo $row["plane_name"];  ?></td>
                    <td><a href="aeroplane_types.php"><?php  echo $row["type_id"];   ?></a></td>
                    <td><?php  echo $row["bought_year"];  ?></td>
                    <td><?php  echo $row["last_maintained_date"];  ?></td>
            	</tr><?php
			}
		?>
        </tbody>
    </table>
	
	


</body>
