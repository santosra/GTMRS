<?php

ob_start();
session_start();

require 'database.php';

// Define $username and $password 
$username = $_POST['username'];
$password = $_POST['password'];

// Query database
$sql = "SELECT * FROM User WHERE username='$username' and password='$password'";
$result = $db->query($sql);

// Mysql_num_row is counting table row
$count = $result->num_rows;

// If result matched $username and $password, table row must be 1 row
if($count==1){

// Register $username, $password and redirect to file "login_success.php"
	$_SESSION['username'] = $username;
    $_SESSION['password'] = $password;

	header("location:index.php");
}
else {
	echo "<META HTTP-EQUIV=REFRESH CONTENT='0; URL=Login.html'>";
    echo "<script type=\"text/javascript\"> alert(\"Wrong Username or Password.\"); </script>";
}

ob_end_flush();
?>