<?php

// Start session
session_start();

// Check if user is logged in
if(!isset($_SESSION['username'])){
	header("location:Login.html");
	exit();
}

// Include database config and html files
require 'database.php';
require basename(__FILE__, '.php').".html";


// Check if submit button has been clicked (enter the name attribute of the first field in the form)
if (isset($_POST['name'])) {
	// Output the returned html
	echo(submit($db));
}

// Function to run if submit button has been clicked
function submit($db) {

	// Get form fields
	$name = $_POST['name'];
	$number = $_POST['number'];
	$type = $_POST['type'];
	$ccv = $_POST['ccv'];
	$expiration = $_POST['expiration'];

	// Query database
	$sql = "INSERT INTO Payment_Information (cardholderName, cardNumber,cardType,cvv,dateOfExpiry) VALUES('$name', '$number', '$type', '$ccv', '$expiration')";
	$result = $db->query($sql);

	// Return to home page
	$refresh =  "<META HTTP-EQUIV=REFRESH CONTENT='0; URL=index.php'>";

	// Alert user of success
	$alert =  "<script type=\"text/javascript\"> alert(\"Order processed.\"); </script>";

	// Create code to return
	$code = $refresh.$alert;

	// Return
	return $code;

}

// Close database connection
$db->close();

?>