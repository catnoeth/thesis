 <?php
 
// Create connection
$con=mysqli_connect("localhost","woofrthe_user","paperplate1","woofrthe_thesis");
// Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$username = $_POST['username'];
$password = $_POST['password'];
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$about = $_POST['about'];
$email = $_POST['email'];
$location = $_POST['location'];

    

    
    $query = "insert into user (username, password, firstname, lastname, about, email, location) values ('$username', '$password', '$firstname', '$lastname', '$about', '$email', '$location')";
    
    
    $result = mysqli_query($mysqli,$query);
    //echo $result;
    
    if(mysqli_query($con, $query)){
    $returnArray["message"] = "cool";
    echo json_encode($returnArray);
}
else{
    mysqli_error($con);
    $returnArray["message"] = "fail!";
    echo json_encode($returnArray);
}

mysqli_close($con)
   


 ?>