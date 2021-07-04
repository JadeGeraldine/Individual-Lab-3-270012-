<?php
include_once("dbconnect.php");

$email = $_POST['email'];

$sqlloadcart = "SELECT * FROM tbl_cart INNER JOIN tbl_item ON tbl_cart.id = tbl_item.id WHERE tbl_cart.email = '$email'";

$result = $conn->query($sqlloadcart);

if ($result->num_rows > 0) 
    {$response["cart"] = array();
     while ($row = $result->fetch_assoc()) 
        {$itemList[id] = $row['id'];
         $itemList[image] = $row['image'];
         $itemList[name] = $row['name'];
         $itemList[price] = $row['price'];
         $itemList[quantity] = $row['quantity'];
         array_push($response["cart"], $itemList);
        }
     echo json_encode($response);
    } 
else 
    {echo "failed";
    }
?>