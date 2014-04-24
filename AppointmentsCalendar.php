<?php

// Start session
session_start();

// Check if user is logged in
if(!isset($_SESSION['username'])){
	header("location:Login.html");
}

// Include database config and html files
require 'database.php';
require basename(__FILE__, '.php').".html";


// Check if submit button has been clicked (enter the name attribute of the first field in the form)
if (isset($_POST['date'])) {
	// Output the returned html
	echo(submit($db));
}

// Function to run if submit button has been clicked
function submit($db) {

	// Get form fields
	$date = $_POST['date'];

	// Query database
	$username = "SELECT patientUsername From Appointments Where doctorUsername = '$_SESSION['username']' and date = '$date'";
	$time = "SELECT time From Appointments Where doctorUsername = '$_SESSION['username']' and date = '$date'";
	$username = $db->query($username);
	$time = $db->query($time);

	$code = $username.$time;

	// Return
	return $code;

}

// Close database connection
$db->close();

?>