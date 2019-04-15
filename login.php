<?php 
	session_start ();
 ?>
<?php

	include 'dbconn.php';


if (isset($_POST['login'])) {
	
	$username = $_POST['name'];
 	$password = $_POST['password'];

 	$result=mysqli_query($conn, "SELECT * FROM customer WHERE name='$username' AND password='$password' ")
				or die ('cannot login' . mysql_error());


				$row=mysqli_fetch_array  ($result);
				$run_num_rows = mysqli_num_rows($result);

						if ($run_num_rows > 0 )
						{
							
 						 $_SESSION['id'] = $row['customerid'];
 						 $_SESSION['name'] = $row['name'];

							header ("location:login_true.php");
						}

						else
						{
							echo "<script>alert('Unknown Credentials')</script>";
							header('Refresh: 0; url=login_page.php');
						}


} 
?>
