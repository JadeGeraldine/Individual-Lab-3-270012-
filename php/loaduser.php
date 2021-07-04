<?php
include_once("dbconnect.php");

$email = $_POST['email'];

$sqlloaduser = "SELECT * FROM tbl_user WHERE email='$email'";
$result = $conn->query($sqlloaduser);

if($result ->num_rows >0)
    {$response["user"] = array();
     while ($row = $result -> fetch_assoc())
        {$userList = array();
         $userList[name] = $row['name'];
         $userList[phone] = $row['phone'];
         array_push($response["user"], $userList);
        }
     echo json_encode($response);
    }
else
    {echo "failed";
    }
?>
