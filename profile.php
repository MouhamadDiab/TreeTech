<?php
    session_start();
    if (isset($_SESSION['update_success']) && $_SESSION['update_success'] === true) {
        unset($_SESSION['update_success']);
    }
include("./connect.php");
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$id = $_SESSION['user_id'];
$firstname = $lastname = $email = $password = $confirmPassword = $phone_nb = $mohafaza = $kadaa = $city = '';
$error_message = '';

$sql = "SELECT * FROM account WHERE id = '$id'";
$result = mysqli_query($conn, $sql);


if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $firstname = $row['Firstname'];
    $lastname = $row['Lastname'];
    $email = $row['Email'];
    $phone_nb = $row['Phone_Nb'];
    $confirmPassword = $row['ConfirmPassword'];
    $password = $row['Password'];
    $mohafaza = $row['mohafaza_id'];
    $kadaa = $row['kadaa_id'];
    $city = $row['city_id'];
}

if (isset($_POST["sub_update"])) {
    $firstname = trim($_POST['firstname']);
    $lastname = trim($_POST['lastname']);
    $email = trim($_POST['Email']);
    $password = trim($_POST['Password']);
    $confirmPassword = trim($_POST['ConfirmPassword']);
    $phone_nb = trim($_POST['Phone_Nb']);
    $mohafaza = trim($_POST['mohafaza']);
    $kadaa = trim($_POST['kadaa']);
    $city = trim($_POST['city']);

    if (!preg_match('/^[a-zA-Z\s]+$/', $firstname) || !preg_match('/^[a-zA-Z\s]+$/', $lastname)) {
        $error_message = "First name and Last name should only contain alphabetic characters and spaces!";
    } elseif (!preg_match('/^\+?[0-9]{8,15}$/', $phone_nb)) {
        $error_message = "Phone number must contain only numbers and optionally start with a '+' sign!";
    } elseif (!preg_match('/^.{8,}$/', $password)) {
        $error_message = "Password must be at least 8 characters long!";
    } elseif ($password !== $confirmPassword) {
        $error_message = "Passwords do not match!";
    } else {
        $password = bin2hex(mhash(MHASH_GOST, $password));
        $confirmPassword = bin2hex(mhash(MHASH_GOST, $confirmPassword)); 

        $sql = "UPDATE account SET 
                    Firstname = '$firstname', 
                    Lastname = '$lastname', 
                    Email = '$email', 
                    Phone_Nb = '$phone_nb', 
                    Password = '$password', 
                    ConfirmPassword = '$confirmPassword',
                    mohafaza_id = '$mohafaza',
                    kadaa_id = '$kadaa',
                    city_id = '$city'
                WHERE id = '$id'";

        if (mysqli_query($conn, $sql)) {
            $_SESSION['update_success'] = true;
            header("Location: home.php");
            exit;
        } else {
            $error_message = "Error updating profile: " . mysqli_error($conn);
        }
    }
}


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <link rel="shortcut icon" href="images/logo.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #fff;
    color: #333;
}

.update-container {
position: relative;
    width: 100%;
    max-width: 600px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.update-form {
    display: flex;
    flex-direction: column;
}

.form-title {
    text-align: center;
    font-size: 24px;
    color: #f2a900;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

label {
    font-size: 14px;
    color: #333;
    margin-bottom: 5px;
}

input[type="text"],
input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 5px;
    transition: border-color 0.3s;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="password"]:focus {
    border-color: #f2a900;
    outline: none;
}

button[type="button"] {
    padding: 10px;
    font-size: 14px;
    background-color: #f2a900;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button[type="button"]:hover {
    background-color: #d88c00;
}

/* Submit Button */
.form-button {
    margin-top: 20px;
    padding: 10px;
    font-size: 14px;
    background-color: #000;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.form-button:hover {
    background-color: #444;
}

.error-message p {
    color: red;
    font-size: 14px;
    margin-top: 10px;
}

.Exit {
    position: absolute;
    top: 10px;
    right: 10px;
}

.Exit img {
    cursor: pointer;
}

#map {
    margin-top: 20px;
    border-radius: 10px;
}

@media (max-width: 600px) {
    .update-container {
        width: 90%;
        padding: 15px;
    }
    .form-title {
        font-size: 20px;
    }
}
</style>
</head>
<body>
    <div class="update-container">
        <form name="updateProfile" method="post" class="update-form">
            <h1 class="form-title">Update Profile</h1>
            <div class="Exit"><a href="home.php"><img src="./images/Exit.ico" alt="Exit" width="40px" height="40px"></a></div>
            <div class="form-group">
                <label for="firstname">Firstname</label>
                <input type="text" id="firstname" name="firstname" value="<?php echo $firstname; ?>" required>
            </div>
            <div class="form-group">
                <label for="lastname">Lastname</label>
                <input type="text" id="lastname" name="lastname" value="<?php echo $lastname; ?>" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="Email" value="<?php echo $email; ?>" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="Password" value="" required>
            </div>
            <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="ConfirmPassword" value="" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="Phone_Nb" value="<?php echo $phone_nb; ?>" required>
            </div>

            <div class="form-group">
                Mohafaza
                <select name="mohafaza"  style="font-size: 20px; width:100%; padding: 5px; border-radius:5px ;" onchange="submit()" required>
                    <option></option>
                   <?php 
                        $newSql = "SELECT * FROM Mohafaza";
                        $newResult = mysqli_query($conn, $newSql); 

                        if(mysqli_num_rows($newResult)){
                            while($data1 = mysqli_fetch_assoc($newResult)){
                                if(isset($_POST["mohafaza"])){
                                    if($data1["id"] == $_POST["mohafaza"])
                                        echo "<option value='$data1[id]' Selected>". $data1["name"] .'</option>';
                                    else
                                        echo "<option value='$data1[id]'>". $data1["name"] .'</option>';
                                }
                                    
                                else{
                                    if($data1["id"] == $mohafaza){
                                        echo "<option value='$data1[id]' Selected>". $data1["name"] .'</option>';
                                    }
                                    else
                                        echo "<option value='$data1[id]'>". $data1["name"] .'</option>';
                                }
                            }

                        }
                    ?>
                </select>
            </div>


            <div class="form-group">
                Kadaa
                <select name="kadaa"style="font-size: 20px; width:100%; padding: 5px; border-radius:5px ;" onchange="submit()" required>
                    <option></option>
                    <?php 
                    $flag = 1;
                    if(isset($mohafaza))
                        $value =  $mohafaza;
                    if(isset($_POST["mohafaza"])) 
                        $value =  $_POST["mohafaza"];
                  
                    
                    
                        $newSql = "SELECT * FROM Kadaa WHERE Kadaa.mohafaza_id = ". $value;
                        $newResult = mysqli_query($conn, $newSql); 
                        if(mysqli_num_rows($result)){
                            while($data1 = mysqli_fetch_assoc($newResult)){
                                if(isset($_POST["mohafaza"]) ){
                                    if(isset($_POST["kadaa"])){
                                        if($data1["id"] == $_POST["kadaa"])
                                            echo "<option value='$data1[id]' Selected>". $data1["name"] .'</option>';
                                        else
                                            echo "<option value='$data1[id]'>". $data1["name"] .'</option>';
                                    }
                                    else
                                        echo "<option value='$data1[id]'>". $data1["name"] .'</option>';
                                
                                }                            
                                else{ 
                                    if($data1["id"] == $kadaa)
                                        echo "<option value='$data1[id]' Selected>". $data1["name"] .'</option>';
                                    else
                                        echo "<option value='$data1[id]'>". $data1["name"] .'</option>';
                                }
                            }
                        }
                                         
                    
                    ?>
                </select>
            </div>

            <div class="form-group">
                City
                <select name="city" style="font-size: 20px; width:100%; padding: 5px; border-radius:5px ;" onchange="submit()"  required>
                    <option></option>
                   
                   <?php 
                    
                        
                    if(isset($kadaa)){
                        $value =  $kadaa;    
                        
                    }
                    if(isset($_POST["kadaa"])){
                        $value =  $_POST["kadaa"];     

                    }
                       
                    
                    $newSql = "SELECT * FROM City WHERE City.akdeye_id = ". $value;
                    $newResult = mysqli_query($conn, $newSql); 
                    if(mysqli_num_rows($result)){
                        while($data1 = mysqli_fetch_assoc($newResult)){
                            if(isset($_POST["kadaa"]) ){
                                if(isset($_POST["city"])){
                                    if($data1["id"] == $_POST["city"])
                                        echo "<option value='$data1[id]' Selected>". $data1["name"] .'</option>';
                                    else
                                        echo "<option value='$data1[id]'>". $data1["name"] .'</option>';
                                }
                                else
                                    echo "<option value='$data1[id]'>". $data1["name"] .'</option>';
                            
                                }                            
                            else{ 
                                if($data1["id"] == $city)
                                    echo "<option value='$data1[id]' Selected>". $data1["name"] .'</option>';
                                else
                                    echo "<option value='$data1[id]'>". $data1["name"] .'</option>';
                            }
                        }
                    }
                    
            
                    
                        
                    ?>
                </select>
            </div>
    

            <input type="submit" value="Update" class="form-button" name="sub_update">
            <div class="error-message">
                <p><?php if ($error_message !== '') echo $error_message; ?></p>
            </div>
        </form>
    </div>
  
</body>
</html>

<?php
mysqli_close($conn);
?>