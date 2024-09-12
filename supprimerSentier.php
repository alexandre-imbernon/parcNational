<?php
function supprimerSentier($id, $db) {
    $sql = "DELETE FROM sentiers WHERE id = ?";
    $stmt = $db->prepare($sql);
    $stmt->execute([$id]);
}
?>
