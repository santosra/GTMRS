<?php
session_start();

if(!isset($_SESSION['username'])){
	header("location:Login.html");
	exit();
}

require 'database.php';
require 'Home.html';

$patient="SELECT * FROM Patient WHERE patientUsername='".$_SESSION['username']."'";
$doctor="SELECT * FROM Doctor WHERE doctorUsername='".$_SESSION['username']."'";
$admin="SELECT * FROM Admin WHERE adminUsername='".$_SESSION['username']."'";

if($db->query($patient)->num_rows==1) {
	echo("<script type='text/javascript'>$('#patientHome').show();</script>");
}
if($db->query($doctor)->num_rows==1) {
	echo("<script type='text/javascript'>$('#doctorHome').show();</script>");
}
if($db->query($admin)->num_rows==1) {
	echo("<script type='text/javascript'>$('#adminHome').show();</script>");
}


$db->close();

?>