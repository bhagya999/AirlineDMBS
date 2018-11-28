<!DOCTYPE html>
<head>
	<?php
		require 'databaseaccess.php';
	?>
	<title>
		Planes
	</title>

</head>

<body>
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
