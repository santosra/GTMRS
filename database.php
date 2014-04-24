<?php

// Database configuration
$db_host = "127.11.142.2"; // Host name
$db_port = "3306"; // Port number
$db_username = "adminIbvwfLd"; // Mysql username
$db_password = "uruasduzqFn_"; // Mysql password
$db_name = "GTMRS"; // Database name

// Connect to server and select databse.
$db = new mysqli("$db_host", "$db_username", "$db_password", "$db_name", "$db_port");

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

?>