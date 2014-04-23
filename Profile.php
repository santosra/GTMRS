<?php
session_start();

if(!isset($_SESSION['username'])){
	header("location:Login.html");
}

require 'database.php';
require basename(__FILE__, '.php').".html";


// Put code here!


$db->close();

?>