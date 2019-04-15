<?php 
	session_start();
 ?>
<?php 
	include 'dbconn.php';

	if (isset($_POST['payment'])) {

		$source			=$_POST['source'];

		$destination	=$_POST['destination'];

		$class			=$_POST['class'];

		$leave_date		=$_POST['leave_date'];

		$leave_time		=$_POST['leave_time'];

		if (strcmp($source, $destination) == 0) {

			echo "<script>alert('Location and destination cant be the same')</script>";

			header('Refresh: 0; url=index.php');
		} else {

			mysqli_query ($conn, "INSERT INTO transaction (source, destination, class, leave_date, leave_time)

					VALUES ('$source', '$destination', '$class', '$leave_date', '$leave_time')");

			echo "<script>alert('Booking Successful')</script>";

			header('Refresh: 0; url=index.php');
		}























	}
 ?>