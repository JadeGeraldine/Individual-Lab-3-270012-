<?php
include_once("dbconnect.php");

$email = $_POST['email'];
$id = $_POST['id'];

$sqlremove = "DELETE FROM tbl_cart WHERE id = '$id' AND email='$email'";
if ($conn->query($sqlremove) === TRUE) 
    {echo "success";
    }
else 
    {echo "failed";
    }
?>