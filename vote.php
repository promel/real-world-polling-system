<?php
include "./utilities/database.php";

session_start();

if (!isset($_SESSION['user_id'])) {
    $url = (empty($_SERVER['HTTPS']) ? 'http' : 'https') . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    header("Location: $url");
}

try {
    // if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Handle form data
        $option_id = $_POST["option_id"] = 6;
        $poll_id = $_POST["poll_id"] = 1;
        $user_id = $_SESSION['user_id'] = 14;

        // Check if the user has already voted (pseudo-code)
        $result = Database::query("CALL sp_has_user_voted('$user_id','$option_id','$poll_id')");

        if (!$result->has_voted) {
            // Save vote into the database (pseudo-code)
            Database::query("CALL sp_save_vote('$user_id','$option_id','$poll_id')");
            http_response_code(201);
            echo json_encode(["success" => true]);
        } else {
            http_response_code(400);
            echo json_encode(["success" => false, "message" => "User has already voted."]);
        }
    // }
} catch (Exception $ex) {
    error_log($ex);
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Something went wrong please contact the adminstrator"]);
}
