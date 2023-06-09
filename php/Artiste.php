<?php
require_once ('database.php');
class Artiste
{
    //
    // Renvoie tous les artistes
    //
    static function getArtistes(){
        try {
            $db = Db::connectionDB();
            $request = 'SELECT * FROM artiste';
            $stmt = $db->prepare($request);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        catch (PDOException $exception){
                error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] ". 'Request error: ' . $exception->getMessage());
            return false;
        }
    }

    //
    // Renvoie un artiste en particulier avec ses musiques et ses albums
    //
    static function getUnArtiste($id)
    {
        try {
            $db = Db::connectionDB();
            $request = 'SELECT * FROM album
                        INNER JOIN artiste a on a.id_artiste = album.id_artiste
                        WHERE a.id_artiste = :id';
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id', $id);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        catch (PDOException $exception){
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] ". 'Request error: ' . $exception->getMessage());
            return false;
        }
    }

    //
    // Renvoie les artistes dont le titre contient les lettres de la recherche du user
    //
    static function rechercheArtistes($recherche)
    {
        try {
            $db = Db::connectionDB();
            $request = "
            SELECT * FROM artiste
            WHERE nom_artiste ILIKE CONCAT('%', :recherche::text, '%'); 
            ";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':recherche', $recherche);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if (empty($result) || $result[0]['id_artiste'] == ''){
                return 'Artiste introuvable.';
            }
            else {
                return $result;
            }
        }
        catch (PDOException $exception){
            error_log($exception->getMessage());
            return false;
        }
    }
}