<?php
$url = getenv("MYSQL_URL");

if ($url) {
    $db = parse_url($url);

    $host = $db["host"];
    $user = $db["user"];
    $pass = $db["pass"];
    $port = $db["port"];
    $name = ltrim($db["path"], "/");

    $conn = mysqli_connect($host, $user, $pass, $name, $port);
} else {
    // Local XAMPP
    $conn = mysqli_connect("127.0.0.1", "root", "", "treetech");
}

if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}
?>
