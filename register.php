<?php
include "./utilities/database.php";
try {
    // Handle user registration
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Handle form data
        $first_name = $_POST["first_name"];
        $last_name = $_POST["last_name"];
        $username = $_POST["username"];
        $password = $_POST["password"]; // Remember to hash this before storing

        $result = Database::query("CALL sp_check_if_user_exists('$username')");
        $isEmailValid = preg_match('/^[^\s@]+@[^\s@]+\.[^\s@]+$/', $username);
        // Validate input and password criteria
        if (!$result->user_exists && strlen($password) >= 8 && preg_match('/[A-Z]/', $password) && preg_match('/[^A-Za-z0-9]/', $password) && $isEmailValid) {
            // Encrypt the password (you should use password_hash() in production)
            $encryptedPassword = md5($password); // This is a simple example, not secure enough for production

            // Save user data into the database (pseudo-code)
            $last_id = Database::query("CALL sp_register('$first_name', '$last_name', '$username', '$encryptedPassword')");
            http_response_code(201);
            echo json_encode(["success" => true, 'id' => $last_id]);
        } else {
            http_response_code(400);
            echo json_encode(["success" => false, "message" => "Invalid input or username already exists."]);
        }
    }
} catch (Exception $ex) {
    error_log($ex);
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Something went wron please contact the adminstrator"]);
}
