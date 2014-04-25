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
if (isset($_POST['date'])) {
	// Output the returned html
	echo(submit($db));
}

// Function to run if submit button has been clicked
function submit($db) {

	// Get form fields
	$date = $_POST['date'];

	// Query database
	$sql = 'SELECT * From Appointments Where doctorUsername = "'.$_SESSION['username'].'" and date = "'.$date.' ORDER BY time"';
	$result = $db->query($sql);

	// Add script header
	$code = "<script type=\"text/javascript\">";

	// Add counter
	$count = $result->num_rows;

	// If any rows are returned
	if ($result) {
		// For each row returned
		while ($row = mysqli_fetch_assoc($result)) {
			// Get patient name
			$sql = 'SELECT * From Patient Where patientUsername = "'.$row['patientUsername'].'"';
			$name = mysqli_fetch_assoc($db->query($sql))['name'];

			// Create line
			$entry = "<tr> <th>".$count."</th> <th>".$name."</th> <th>".$row['time']."</th> </tr>";

			// Add line to output
			$code = $code.'$("#appointmentsTable > tbody").prepend("'.$entry.'");';

			// Decrement counter
			$count = $count - 1;
		}

	}

	// Add script closer
	$code = $code."</script>";

	// Return
	return $code;

}

// Close database connection
$db->close();

?>