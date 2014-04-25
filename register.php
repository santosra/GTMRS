<?php

ob_start();
session_start();

require 'database.php';

// Define variables 
$username = $_POST['username'];
$password = $_POST['password'];
$confirmPassword = $_POST['confirmPassword'];
$userType = $_POST['userType'];


// Check if password and confirm password match
if($password != $confirmPassword) {
	echo "<META HTTP-EQUIV=REFRESH CONTENT='0; URL=NewUserRegistration.html'>";
	echo "<script type=\"text/javascript\"> alert(\"Passwords do not match.\"); </script>";
	ob_end_flush();
	exit();
}

// Put username and password in User table
$sql = "INSERT INTO User (username, password) VALUES('$username', '$password')";

if($db->query($sql)) {

	// Put username in correct table for the user type
	if($userType == "Doctor") {
		$sql = "INSERT INTO Doctor (doctorUsername) VALUES('$username')";
	} else if($userType == "Patient") {
		$sql = "INSERT INTO Patient (patientUsername) VALUES('$username')";
	} else {
		$sql = "INSERT INTO Admin (adminUsername) VALUES('$username')";
	}
	
	$result = $db->query($sql);

	header("location:index.php");
	
} else {
	echo "<META HTTP-EQUIV=REFRESH CONTENT='0; URL=NewUserRegistration.html'>";
    echo "<script type=\"text/javascript\"> alert(\"Username already taken.\"); </script>";
}

ob_end_flush();
?>