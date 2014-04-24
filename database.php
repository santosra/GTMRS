<?php

// Database configuration
$db_host = "localhost"; // Host name
$db_port = "8889"; // Port number
$db_username = "root"; // Mysql username
$db_password = "root"; // Mysql password
$db_name = "GTMRS"; // Database name

// Connect to server and select databse.
$db = new mysqli("$db_host", "$db_username", "$db_password", "$db_name", "$db_port");

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

?>