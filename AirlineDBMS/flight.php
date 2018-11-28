<!DOCTYPE html>
<head>
	<?php
		require 'databaseaccess.php';
	?>
	<title>
		Flights
	</title>

</head>

<body>
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
