<?php
class DbConnect{
	public function connect(){
		$database= @mysqli_connect("localhost","root","","airlinedbms") or die ("SORRY!!! Server Problem");
		return $database;
	}
}


?>