<?php
include_once("dbconnect.php");

$email = $_POST['email'];
$password = $_POST['password'];
$passha1 = sha1($password);


$sqlcheck = "SELECT * FROM tbl_user WHERE email = '$email'";
$resultcheck = $conn->query($sqlcheck);

if ($resultcheck->num_rows > 0)
    {echo $sqlpass = "UPDATE tbl_user SET password = '$passha1'  WHERE email = '$email'";
     if ($conn->query($sqlpass) === TRUE)
        {echo 'success';
        }
     else
        {echo 'failed';
        }
    }
else
    {echo 'failed';
    }
?>
