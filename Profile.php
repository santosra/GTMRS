<?php
session_start();

if(!isset($_SESSION['username'])){
	header("location:Login.html");
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


$db->close();

?>