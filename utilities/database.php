<?php
// namespace Utilities {

    class Database
    {
        /**
         * generic query
         *
         * Multi purpose query for calling stored procedures
         *
         * @param any $var Description
         * @return any
         * @throws mysqli_error
         **/
        public static function query($query)
        {
            $mysqli = new mysqli("localhost", "root", "root", "polling_system") or throw "Failed to connect to MySQL: " . mysqli_connect_error();

            $results = [];
            $result = $mysqli->query($query) or throw "Query Failed " . mysqli_connect_error();

            //insert returns true
            if(is_bool($result)){ 
                return $mysqli->insert_id; //get last id
            }

            if ($result) {
                while ($obj = $result->fetch_object()) {
                    $results[] = $obj;
                }
                $mysqli->close();
            }
            
            if (count($results) == 1) {
                return $results[0];
            } else if (count($results) > 0) {
                return $results;
            }
            return false;
        }
    }
// }
