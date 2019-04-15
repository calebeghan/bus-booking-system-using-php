<?php

	include('dbconn.php');

	if (isset($_POST['signup']))

{

	$username=$_POST['name'];

	$email=$_POST['email'];

	$password=$_POST['password'];

	

	$check = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM `customer` WHERE `email` = '$email'"));

		if($check == 1)

			{

				echo "<script>alert('EMAIL ALREADY EXIST')</script>";

			}



			else

				{

					mysqli_query ($conn, "INSERT INTO customer (name, email, password)

					VALUES ('$username', '$email', '$password')");

					//or die(mysqli_error());	

				}

						echo "<script>alert('ACCOUNT CREATED..YOU CAN LOGIN NOW')</script>";
						header('Refresh: 0; url=index.php');

}

?>

