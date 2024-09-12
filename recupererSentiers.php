<?php
function recupererSentiersEtPointsInteret($db) {
    $sql = "SELECT s.nom AS sentier_nom, s.difficulte, p.nom AS point_nom, p.latitude, p.longitude, p.image_url, p.description
            FROM sentiers s 
            JOIN points_interet p ON s.id = p.sentier_id";
    $stmt = $db->query($sql);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

$sentiers = recupererSentiersEtPointsInteret($db);
echo json_encode($sentiers);
?>
