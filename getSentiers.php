<?php
// Connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "parcnational";

$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Requête pour récupérer les sentiers
$sql = "SELECT name, latitude, longitude, difficulte, longueur_km, image_url, description FROM sentiers_calanques";
$result = $conn->query($sql);

$sentiers = array();

if ($result->num_rows > 0) {
    // Récupérer chaque sentier et l'ajouter dans un tableau
    while($row = $result->fetch_assoc()) {
        $sentiers[] = $row;
    }
}

// Retourner les données en JSON
header('Content-Type: application/json');
echo json_encode($sentiers);

$conn->close();
?>
