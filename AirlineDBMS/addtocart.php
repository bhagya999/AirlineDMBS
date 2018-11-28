<?php
	session_start();
	if(isset($_GET['seatno']) & !empty($_GET['seatno'])){
		if(isset($_SESSION['cart']) & !empty($_SESSION['cart'])){
			$items = $_SESSION['cart'];
			$cartitems = explode(",", $items);
			if(in_array($_GET['seatno'], $cartitems)){
				header('location: addtocart.php?status=incart');
			}else{
				$items .= "," . $_GET['id'];
				$_SESSION['cart'] = $items;
				header('location: addtocart.php?status=success');
	
			}
		}else{
			$items = $_GET['seatno'];
			$_SESSION['cart'] = $items;
			header('location: addtocart.php?status=success');
		}
	}else{
		header('location: addtocart.php?status=failed');
	}

$itemslist = $_SESSION['cart'];
$seats = explode(",", $itemslist);

$total = '';
$i=1;
 foreach ($seats as $key=>$id) {
	$sql = "SELECT * FROM seat WHERE seat_no = $id";
	$res=mysqli_query($databaseconnect, $sql);
	$r = mysqli_fetch_assoc($res);
?>	  	
	<tr>
		<td><?php echo $i; ?></td>
		<td><a href="#">Remove</a> <?php echo $r['seat_no']; ?></td>
	</tr>
<?php 
	$total = $total + 1;
	$i++; 
	}
echo $total;




?>


