<?php
function creerSentier($nom, $description, $difficulte, $longueur_km, $db) {
    $sql = "INSERT INTO sentiers (nom, description, difficulte, longueur_km) VALUES (?, ?, ?, ?)";
    $stmt = $db->prepare($sql);
    $stmt->execute([$nom, $description, $difficulte, $longueur_km]);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    creerSentier($_POST['nom'], $_POST['description'], $_POST['difficulte'], $_POST['longueur_km'], $db);
}
?>
