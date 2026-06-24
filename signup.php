<?php
session_start();

if (isset($_SESSION['user_id'])) {
    header("Location: home.php");
    exit;
}

?>
<?php
$firstname = $lastname = $Email = $Password = $ConfirmPassword = $Phone_Nb =$Color= '';
include("./connect.php");
if (isset($_POST['firstname'])) {
    $firstname = trim($_POST['firstname']);
}
if (isset($_POST['lastname'])) {
    $lastname = trim($_POST['lastname']);
}
if(isset($_POST['Favorite_Color'])){
    $Color=trim($_POST['Favorite_Color']);
}
if (isset($_POST['Email'])) {
    $Email = trim(strtolower($_POST['Email']));
}
if (isset($_POST['Password'])) {
    $Password = trim($_POST['Password']);
    
}
if (isset($_POST['ConfirmPassword'])) {
    $ConfirmPassword = trim($_POST['ConfirmPassword']);

}
if (isset($_POST['Phone_Nb'])) {
    $Phone_Nb = trim(str_replace(' ', '', $_POST['Phone_Nb']));
}

if (isset($_POST['mohafaza'])) {
    $mohafaza = trim(str_replace(' ', '', $_POST['mohafaza']));
}
if (isset($_POST['kadaa'])) {
    $kadaa = trim(str_replace(' ', '', $_POST['kadaa']));
}
if (isset($_POST['city'])) {
    $city = trim(str_replace(' ', '', $_POST['city']));
}


$error_message = '';

if (empty($firstname) || empty($lastname) || empty($Email) || empty($Color) ||empty($Password) || empty($ConfirmPassword) || empty($Phone_Nb)|| empty($mohafaza) || empty($kadaa) || empty($city)) {
    $error_message = "All fields are required!";
} elseif (!preg_match('/^[a-zA-Z\s]+$/', $firstname) || !preg_match('/^[a-zA-Z\s]+$/', $lastname)) {
    $error_message = "First name and Last name should only contain alphabetic characters and spaces!";
} elseif (!preg_match('/^\+?[0-9]{8,15}$/', $Phone_Nb)) {
    $error_message = "Phone number must contain only numbers and optionally start with a '+' sign!";
} elseif (!preg_match('/^.{8,}/', $Password)) {
    $error_message = "Password must be at least 8 characters long!";
} elseif ($Password !== $ConfirmPassword) {
    $error_message = "Passwords do not match!";
} else {
    if(isset($_POST["sub_register"])){
        $sql = "SELECT * FROM account WHERE Email = '$Email'";
            $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {
            $error_message = "Email already taken! Try another email.";
        } 
        else {
            $Password = bin2hex(mhash(MHASH_GOST, $Password));
            $ConfirmPassword = bin2hex(mhash(MHASH_GOST, $ConfirmPassword));
            $sql = "INSERT INTO account (Firstname,Lastname,Password,ConfirmPassword,Email,role,Phone_Nb ,color, mohafaza_id, kadaa_id, city_id) 
                    VALUES ('$firstname', '$lastname', '$Password', '$ConfirmPassword','$Email', 'user' ,'$Phone_Nb','$Color', '$mohafaza', '$kadaa', '$city')";

            if (mysqli_query($conn, $sql)) {
                header("Location: login.php");
                exit;
            } else {
                $error_message = "Error: " . mysqli_error($conn);
            }
        }
    }
    
}


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tree Tech</title>
    <link rel="shortcut icon" href="images/logo.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/normalize.css"> 
    <link rel="shortcut icon" href="images/logo.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <style>
        /* Add your styling here (same as before) */
        
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', Arial, sans-serif;
    background-color: #f8f9fa;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0;
}

/* Form Styles */
.register-container {
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    width: 100%;
    max-width: 500px;
}

.form-title {
    font-size: 28px;
    color: #333;
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-size: 14px;
    color: #555;
    margin-bottom: 5px;
}

.form-group input {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

.form-group input:focus {
    border-color: #ffc107;
    outline: none;
    box-shadow: 0 0 5px rgba(255, 193, 7, 0.5);
}

.form-button {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    color: white;
    background-color: #ffc107;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.form-button:hover {
    background-color: #e0a800;
}

.form-footer {
    text-align: center;
    font-size: 14px;
    color: #555;
    margin-top: 15px;
}

.form-footer a {
    color: #007BFF;
    text-decoration: none;
}

.form-footer a:hover {
    text-decoration: underline;
}

.error-message {
    color: red;
    font-size: 14px;
    text-align: center;
    margin-top: 10px;
}
        #map { margin-top: 20px; height: 300px; border-radius: 10px; }
    </style>
</head>


<body>
<a href="./index.php" style="top:50px;left:50px;position:absolute">
<span class="link icon"><i class="fa-solid fa-arrow-left"></i></span> </a>
    <div class="register-container">
        <form name="signup" method="post">
            <h1 class="form-title">Sign Up</h1>
            <div class="form-group">
                <label for="firstname">Firstname</label>
                <input type="text" id="firstname" name="firstname" value="<?php echo $firstname;?>" required>
            </div>
            <div class="form-group">
                <label for="lastname">Lastname</label>
                <input type="text" id="lastname" name="lastname" value="<?php echo $lastname;?>" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="Email" value="<?php echo $Email;?>" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="Password" value="<?php echo $Password;?>" required>
            </div>
            <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="ConfirmPassword" value="<?php echo $ConfirmPassword;?>" required>
            </div>
            <div class="form-group">
            <label for="color">Favorite Color:</label>
            <input type="text" id="color" name="Favorite_Color" value="<?php echo $Color;?>"required>
        </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="Phone_Nb" value="<?php echo $Phone_Nb;?>" required>
            </div>
            <div class="form-group">
                <label for="mohafaza">Mohafaza</label>
                <select name="mohafaza" id="mohafaza" style="font-size: 20px; width:100%; padding: 5px; border-radius:5px ;" onchange="submit()">
                    <option></option>
                   <?php 
                        $sql = "SELECT * FROM Mohafaza";
                        $result = mysqli_query($conn, $sql); 
                        if(mysqli_num_rows($result)){
                            while($data = mysqli_fetch_assoc($result)){
                                if(isset($_POST["mohafaza"])){
                                    if($data["id"] == $_POST["mohafaza"])
                                        echo "<option value='$data[id]' Selected>". $data["name"] .'</option>';
                                    else
                                        echo "<option value='$data[id]'>". $data["name"] .'</option>';
                                }
                                    
                                else
                                    echo "<option value='$data[id]'>". $data["name"] .'</option>';
                            }

                        }
                    ?>
                </select>
            </div>


            <div class="form-group">
                <label for="kadaa">Kadaa</label>
                <select name="kadaa" id="kadaa"style="font-size: 20px; width:100%; padding: 5px; border-radius:5px ;" onchange="submit()">
                    <option></option>
                    <?php 
                        if(isset($_POST["mohafaza"]) ){
                            $sql = "SELECT * FROM Kadaa WHERE Kadaa.mohafaza_id = ". $_POST["mohafaza"];
                            $result = mysqli_query($conn, $sql); 
                            if(mysqli_num_rows($result)){
                                while($data = mysqli_fetch_assoc($result)){
                                    if(isset($_POST["kadaa"])){
                                        if($data["id"] == $_POST["kadaa"])
                                            echo "<option value='$data[id]' Selected>". $data["name"] .'</option>';
                                        else
                                            echo "<option value='$data[id]'>". $data["name"] .'</option>';
                                    }
                                    else
                                        echo "<option value='$data[id]'>". $data["name"] .'</option>';
                                }

                            }
                        }
                       
                    ?>
                </select>
            </div>

            <div class="form-group">
                <label for="city">City</label>
                <select name="city" id="city"style="font-size: 20px; width:100%; padding: 5px; border-radius:5px ;" onchange="submit()">
                    <option></option>
                   
                   <?php 
                        if(isset($_POST["kadaa"]) ){
                            $sql = "SELECT * FROM City WHERE City.akdeye_id = ". $_POST["kadaa"];
                            $result = mysqli_query($conn, $sql); 
                            if(mysqli_num_rows($result)){
                                while($data = mysqli_fetch_assoc($result)){
                                    if(isset($_POST["city"])){
                                         if($data["id"] == $_POST["city"])
                                            echo "<option value='$data[id]' Selected>". $data["name"] .'</option>';
                                        else
                                            echo "<option value='$data[id]'>". $data["name"] .'</option>';
                                    }
                                    else
                                        echo "<option value='$data[id]'>". $data["name"] .'</option>';
                                }

                            }
                        }
                       
                    ?>
                </select>
            </div>



            <div class="form-group">
                <input type="submit" value="Register" class="form-button" name="sub_register">
            </div>
            <div class="form-footer">
                <p>Already have an account? <a href="./login.php">Login</a></p>
            </div>
            <div class="error-message">
                <p><?php if ($error_message !== '') {
                        echo $error_message;
                    } ?></p>
            </div>
        </form>
    </div>
    
</body>

</html>

<?php
mysqli_close($conn);

?>