<?php
include "./utilities/database.php";
session_start();

// Handle user login
try {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Handle form data
        $username = $_POST["username"];
        $password = $_POST["password"]; // Remember to hash this before comparing
        $encryptedPassword = md5($password); // This is a simple example, not secure enough for production

        $user = Database::query("CALL sp_login('$username', '$encryptedPassword')");
        if ($user) {
            http_response_code(200);

            $_SESSION['user_id'] = $user->id;

            echo json_encode([
                "success" => true,
                "user" => $user
            ]);
        } else {
            http_response_code(400);
            echo json_encode(["success" => false, "message" => "Invalid username or password."]);
        }
    }
} catch (Exception $ex) {
    error_log($ex);
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Something went wrong please contact the adminstrator"]);
}
