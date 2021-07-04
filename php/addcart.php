<?php
include_once("dbconnect.php");

$email = $_POST['email'];
$id = $_POST['id'];

$sqlcheck = "SELECT * FROM tbl_cart WHERE id = '$id' AND email = '$email'";
$resultcheck = $conn->query($sqlcheck);

if ($resultcheck->num_rows == 0) 
    {echo $sqladdcart = "INSERT INTO tbl_cart (email, id, quantity) VALUES ('$email','$id','1')";
     if ($conn->query($sqladdcart) === TRUE) 
        {echo "success";
        }
     else 
        {echo "failed";
        }
    }
else
    {echo $sqlupdatecart = "UPDATE tbl_cart SET quantity = quantity+1 WHERE id = '$id' AND email = '$email'";
     if ($conn->query($sqlupdatecart) === TRUE) 
        {echo "success";
        }
     else 
        {echo "failed";
        }
    }
?>