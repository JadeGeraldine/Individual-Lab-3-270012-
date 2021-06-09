<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '/home8/crimsonw/public_html/s270012/ArtisanalDips/php/PHPMailer/Exception.php';
require '/home8/crimsonw/public_html/s270012/ArtisanalDips/php/PHPMailer/PHPMailer.php';
require '/home8/crimsonw/public_html/s270012/ArtisanalDips/php/PHPMailer/SMTP.php';

include_once("dbconnect.php");

$email= $_POST['email'];
$password = $_POST['password'];
$passha1 = sha1($password);
$otp = rand(1000,9999);
$rating = "0";
$credit = "0";
$status = "active";

$sqlregister = "INSERT INTO tbl_user(email,password,otp,rating,credit,status) VALUE('$email','$passha1','$otp','$rating','$credit','$status')";
if ($conn->query($sqlregister) === TRUE){
    echo "success";
    sendEmail($otp,$email);
    }
else{
    echo "failed";
    }
    
function sendEmail($otp,$email)
    {$mail = new PHPMailer(true);
     $mail->SMTPDebug = 0;                                       //Disable verbose debug output
     $mail->isSMTP();                                            //Send using SMTP
     $mail->Host       = 'mail.crimsonwebs.com';                 //Set the SMTP server to send through
     $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
     $mail->Username   = 'artisanaldips@crimsonwebs.com';        //SMTP username
     $mail->Password   = 'mwo0p=0jt,8p';                         //SMTP password
     $mail->SMTPSecure = 'TLS';         
     $mail->Port       = 587;
    
     $from = "artisanaldips@crimsonwebs.com";
     $to = $email;
     $subject = "From Artisanal Dips. Account Verification.";
     $message = "<p>Thank you for registering with Artisanal Dips. We hope to give you the best.<br><br><a href='https://crimsonwebs.com/s270012/ArtisanalDips/php/verify.php?email=".$email."&key=".$otp."'>Click here to verify your account</a>";
    
     $mail->setFrom($from,"ArtisanalDips");
     $mail->addAddress($to);
    
     $mail->isHTML(true);                    //Set email format to HTML
     $mail->Subject = $subject;
     $mail->Body    = $message;
     $mail->send();
    }
?>
