<?php
$servername = "localhost";
$username   = "crimsonw_s270012";
$password   = "mwo0p=0jt,8p";
$dbname     = "crimsonw_artisanaldipsdb";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) 
    {die("Connection failed: " . $conn->connect_error);
    }
?>
