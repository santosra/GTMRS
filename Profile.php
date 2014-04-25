<?php
session_start();

if(!isset($_SESSION['username'])){
	header("location:Login.html");
	exit();
}

require 'database.php';
require basename(__FILE__, '.php').".html";


$patient="SELECT * FROM Patient WHERE patientUsername='".$_SESSION['username']."'";
$doctor="SELECT * FROM Doctor WHERE doctorUsername='".$_SESSION['username']."'";

if($db->query($patient)->num_rows==1) {
	echo("<script type='text/javascript'>$('#patientProfile').show();</script>");
}
if($db->query($doctor)->num_rows==1) {
	echo("<script type='text/javascript'>$('#doctorProfile').show();</script>");
}

// Check if user is patient
if (isset($_POST['firstNamePatient'])) {
	// Output the returned html
	echo(submitPatient($db));
}

// Check if user is doctor
if (isset($_POST['firstNameDoctor'])) {
	// Output the returned html
	echo(submitDoctor($db));
}

// Function to run for patients
function submitPatient($db) {

	// Get form fields
	$fName = $_POST['firstNamePatient'];
	$lName = $_POST['lastNamePatient'];
	$name = $fName." ".$lName; 
	$gender = $_POST['genderPatient'];
	$dob = $_POST['dobPatient'];
	$address = $_POST['addressPatient'];
	$hPhone = $_POST['homePhonePatient'];
	$wPhone = $_POST['workPhonePatient'];
	$eName = $_POST['emergencyNamePatient'];
	$ePhone = $_POST['emergencyPhonePatient'];
	$weight = $_POST['weightPatient'];
	$fHeight = $_POST['feetHeightPatient'];
	$iHeight = $_POST['inchHeightPatient'];
	$height = ($fHeight * 12) + $iHeight;
	$income = $_POST['incomePatient'];

	$allergy = $_POST['allergy1'];

	// Query database
	$sql = "UPDATE Patient SET name = '$name', dob = '$dob', gender = '$gender', address = '$address', workPhone = '$wPhone', homePhone = '$hPhone', emergencyName = '$eName', emergencyPhone = '$ePhone', weight = '$weight', height = '$height', annualIncome = '$income' WHERE patientUsername = '".$_SESSION['username']."'";
	$result = $db->query($sql);

	// Alergies
	$count = 1;

	while(isset($_POST['allergy'.$count])) {
		$allergy = $_POST['allergy'.$count];
		$sql = "INSERT INTO Patient_Allergies (patientUsername, allergy) VALUES ('".$_SESSION['username']."', '$allergy')";
		$result = $db->query($sql);
		$count = $count + 1;
	}

	// Return to home page
	$refresh =  "<META HTTP-EQUIV=REFRESH CONTENT='0; URL=index.php'>";

	// Alert user of success
	$alert =  "<script type=\"text/javascript\"> alert(\"Profile updated.\"); </script>";

	// Create code to return
	$code = $refresh.$alert;

	// Return
	return $code;
}





$db->close();

?>