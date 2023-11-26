<?php
include "./utilities/database.php";
require './models/poll.php';
require './models/option.php';

session_start();
if (!isset($_SESSION['user_id'])) {
    $url = (empty($_SERVER['HTTPS']) ? 'http' : 'https') . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    header("Location: $url");
}

try {
    if ($_SERVER["REQUEST_METHOD"] == "GET") {
        // Check if the user has already voted (pseudo-code)
        $results = Database::query("CALL sp_get_polls()");

        if (is_array($results)) {
            $poll = new Poll();
            $poll->id = $results[0]->id;
            $poll->question = $results[0]->question;
            $poll->options = [];

            foreach ($results as $i) {
                $poll->options[] = [
                    'id' => $i->option_id,
                    'text' => $i->text
                ];
            }

            http_response_code(200);
            echo json_encode(["success" => true, 'poll' => $poll]);
        } else {
            http_response_code(404);
            echo json_encode(["success" => false, "message" => "User has already voted."]);
        }
    }
} catch (Exception $ex) {
    error_log($ex);
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Something went wron please contact the adminstrator"]);
}
