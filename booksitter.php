 <?php
 
// Create connection
$con=mysqli_connect("localhost","woofrthe_user","paperplate1","woofrthe_thesis");
// Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

$sitter = $_POST['sitter'];
$petname = $_POST['petname'];
$species = $_POST['species'];
$start_date = $_POST['start_date'];
$end_date = $_POST['end_date'];

    

    
    $query = "insert into sittersessions (sitter, petname, species, start_date, end_date) values ('$sitter', '$petname', '$species', '$start_date', '$end_date')";
    
    
    $result = mysqli_query($mysqli,$query);
    //echo $result;
    
    if(mysqli_query($con, $query)){
    $returnArray["message"] = "booked sitter";
    echo json_encode($returnArray);
}
else{
    mysqli_error($con);
    $returnArray["message"] = "fail!";
    echo json_encode($returnArray);
}

mysqli_close($con)
   


 ?>