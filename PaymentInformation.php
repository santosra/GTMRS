<?php
session_start();

if(!isset($_SESSION['username'])){
	header("location:Login.html");
}

require 'database.php';
require basename(__FILE__, '.php').".html";


// Check if submit button has been clicked
if (isset($_POST['submit']) {
	submit();
}

// Function to run of submit button has been clicked
function submit() {

	// Get form fields
	$name = $_POST['name'];
	$number = $_POST['number'];
	$type = $_POST['type'];
	$ccv = $_POST['ccv'];
	$expiration = $_POST['expiration'];


	// Query database
	$sql = "INSERT INTO Payment_Information (cardholderName, cardNumber,cardType,cvv,dateOfExpiry) VALUES($name, $number, $type, $ccv, $expiration)";
	$result = $db->query($sql);

	// Return to order page
	header("location:index.php");

	//Alert user of success
	echo "<script type=\"text/javascript\"> alert(\"Order processed.\"); </script>";

}


$db->close();

?>