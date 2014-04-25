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

// Check if payment information is entered
$sql="SELECT cardNumber FROM Patient WHERE patientUsername='".$_SESSION['username']."'";
$result = $db->query($sql);
if(mysqli_fetch_assoc($result)=="") {
	header("location:PaymentInformation.php");
	exit();
}

// Check if submit button has been clicked (enter the name attribute of the first field in the form)
if (isset($_POST['medName1'])) {
	// Output the returned html
	echo(submit($db));
}

// Function to run if submit button has been clicked
function submit($db) {

	// Mediactions
	$count = 1;

	while(isset($_POST['medName'.$count])) {
		$medicine = $_POST['medName'.$count];
		$dosage = $_POST['dosage'.$count];
		$monthDuration = $_POST['monthDuration'.$count];
		$dayDuration = $_POST['dayDuration'.$count];
		$consultingDoctor = $_POST['consultingDoctor'.$count];
		$date = $_POST['date'.$count];
		$sql = "";
		$result = $db->query($sql);
		$count = $count + 1;
	}

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