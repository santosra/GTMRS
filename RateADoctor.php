<?php
session_start();

if(!isset($_SESSION['username'])){
	header("location:Login.html");
	exit();
}

require 'database.php';
require basename(__FILE__, '.php').".html";

/*$doctorUsername = $_POST['doctorName'];
$patientUsername = $_POST['username'];

//Determine if this patient has rated this Doctor
$sql = "SELECT * FROM Doctor_Rating WHERE doctorUsername='$doctorUsername' 
	and patientUsername='$patientUsername'";
$result = $db->query($sql);
$count = $result->num_rows;
if($count > 1) { //delete all tuples
	$sql = "DELETE * FROM Doctor_Rating WHERE doctorUsername='$doctorUsername' 
		and patientUsername='$patientUsername'";
	$db->query($sql);
}
if($count == 0) { //add tuple
	$rating = (int) $_POST['rating2'];
	$sql = "INSERT INTO Doctor_Rating(doctorUsername, patientUsername, rating)
		VALUES ($doctorUsername, $patientUsername, $rating)";
	$result = $db->query($sql);
}
else { //modify existing tuple
	$sql = "UPDATE Doctor_Rating SET rating = $rating
		WHERE doctorUsername=$doctorUsername and patientUsername=$patientUsername;";
	$result = $db->query($sql);
}
header("location:index.php");
	ob_end_flush();
	exit();*/

$db->close();

?>