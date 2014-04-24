<?php

// Database configuration
$db_host = "127.3.58.2"; // Host name
$db_port = "3306"; // Port number
$db_username = "adminXa3ShrZ"; // Mysql username
$db_password = "vB7fW-PRX3Ss"; // Mysql password
$db_name = "gtmrs"; // Database name

// Connect to server and select databse.
$db = new mysqli("$db_host", "$db_username", "$db_password", "$db_name", "$db_port");

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

?>