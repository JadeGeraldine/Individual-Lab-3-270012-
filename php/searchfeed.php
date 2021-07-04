<?php
include_once("dbconnect.php");
$email = $_POST['email'];

if (isset($email)) 
    {$sqlsearchfeed = "SELECT * FROM tbl_feed WHERE email LIKE '%$email%' ORDER BY datecomment DESC";
    } 
else
    {$sqlsearchfeed = "SELECT * FROM tbl_feed ORDER BY datecomment DESC";
    }

$result = $conn->query($sqlsearchfeed);

if($result ->num_rows >0)
    {$response["feed"] = array();
     while ($row = $result -> fetch_assoc())
        {$feedList = array();
         $feedList[feedid] = $row['feedid'];
         $feedList[email] = $row['email'];
         $feedList[feedback] = $row['feedback'];
         $feedList[datecomment] = $row['datecomment'];
         array_push($response["feed"], $feedList);
        }
     echo json_encode($response);
    }
else
    {echo "failed";
    }
?>
