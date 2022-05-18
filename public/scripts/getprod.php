<?php
require_once "conn.php";
header('Content-Type: application/json');

$sql = "SELECT * FROM products";

if($stmt = $pdo->prepare($sql)) {
    if ($stmt->execute()) {
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($result);
    } else {
        echo "ERROR";
    }
    unset($stmt);
} else {
    echo "ERROR";
}