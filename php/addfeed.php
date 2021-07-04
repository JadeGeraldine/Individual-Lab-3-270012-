<?php
include_once("dbconnect.php");

$email= $_POST['email'];
$feedback = $_POST['feedback'];;

$sqlfeed = "INSERT INTO tbl_feed(email,feedback) VALUE('$email','$feedback')";
if ($conn->query($sqlfeed) === TRUE){
    echo "success";
    }
else{
    echo "failed";
    }
?>