<?php 
require_once "conn.php";
header('Content-Type: application/json');

if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Validate username
    if(!empty(trim($_POST["fname"])) && !empty(trim($_POST["lname"])) && !empty(trim($_POST["email"])) && !empty(trim($_POST["adres"])) && !empty(trim($_POST["city"])) && !empty(trim($_POST["zip"])) && !empty(trim($_POST["order"]))) {
        
        try {
            $sql = "INSERT INTO orders (orderdata, voornaam, achternaam, adres, postcode, woonplaats, email) VALUES (:orderdata, :voornaam, :achternaam, :adres, :postcode, :woonplaats, :email);";

            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':voornaam', $firstname);
            $stmt->bindParam(':achternaam', $lastname);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':adres', $adres);
            $stmt->bindParam(':postcode', $zip);
            $stmt->bindParam(':woonplaats', $city);
            $stmt->bindParam(':orderdata', $order);

            $firstname = trim($_POST["fname"]);
            $lastname = trim($_POST["lname"]);
            $email = trim($_POST["email"]);
            $adres = trim($_POST["adres"]);
            $zip = trim($_POST["zip"]);
            $city = trim($_POST["city"]);
            $order = strval(trim($_POST["order"]));

            $stmt->execute();

            echo "{\"errored\": false}";
            unset($stmt);
            exit;

        } catch(PDOException $e) {
            echo "{\"errored\": true}";
        }
        unset($stmt);
    }
    
}

echo "{\"errored\": true}";

?>