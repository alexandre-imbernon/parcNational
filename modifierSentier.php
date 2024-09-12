<?php
function modifierSentier($id, $nom, $description, $difficulte, $longueur_km, $db) {
    $sql = "UPDATE sentiers SET nom = ?, description = ?, difficulte = ?, longueur_km = ? WHERE id = ?";
    $stmt = $db->prepare($sql);
    $stmt->execute([$nom, $description, $difficulte, $longueur_km, $id]);
}
?>
