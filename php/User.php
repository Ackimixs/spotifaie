<?php
require_once ('database.php');
class User
{
    static function authentification($email, $mdp)
    {
        try {
            $db = Db::connectionDB();
            $request = 'SELECT * FROM "user" WHERE "user".mail = :email';
            $stmt = $db->prepare($request);
            $stmt->bindParam(':email', $email);
            $stmt->execute();
            $data = $stmt->fetch(PDO::FETCH_ASSOC);
        }
        catch (PDOException $exception){
            error_log($exception->getMessage());
            return false;
        }
        return ($data && password_verify($mdp, $data['motdepasse']));
    }
    //
    // Renvoie toutes les user
    //
    static function getUsers()
    {
        try {
            $db = Db::connectionDB();
            dbConnect();
            $request = 'SELECT * FROM "user"';
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
    // Renvoie un user en particulier
    //
    static function getUnUser($id)
    {
        try {
            $db = $db = Db::connectionDB();
            $request = 'SELECT * FROM "user"
                        WHERE "user".id_user = :id';
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id', $id);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
        catch (PDOException $exception){
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] ". 'Request error: ' . $exception->getMessage());
            return false;
        }
    }

    //
    // get un user avec son email
    //
    static function getUserByEmail($email) {
        try {
            $db = $db = Db::connectionDB();
            $request = 'SELECT * FROM "user"
                        WHERE "user".mail = :mail';
            $stmt = $db->prepare($request);
            $stmt->bindParam(':mail', $email);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
        catch (PDOException $exception){
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] ". 'Request error: ' . $exception->getMessage());
            return false;
        }
    }

    //
    // Renvoie les playlist d'un user
    //
    static function playlistUser($id)
    {
        try {
            $db = Db::connectionDB();
            $request = 'SELECT * FROM "user"
                        INNER JOIN user_playlist up on up.id_user = "user".id_user
                        INNER JOIN playlist p on p.id_playlist = up.id_playlist
                        WHERE "user".id_user = :id';
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
    // Modifie les parametres de l'utilisateur
    //
    /*static function modificationUser($id, $parametre, $valeur)
    {
        try {
            $db = Db::connectionDB();
            $request = 'UPDATE "user"
                    SET :parametre = :valeur
                    WHERE id_user = :iduser';
            $stmt = $db->prepare($request);
            $stmt->bindParam(':iduser', $id);
            $stmt->bindParam(':parametre', $parametre);
            $stmt->bindParam(':valeur', $valeur);
            $stmt->execute();
            $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        catch (PDOException $exception){
            error_log($exception->getMessage());
            return false;
        }
    }*/

    static function modificationGeneralUser($id_user, $nom, $prenom, $email, $password, $date) {
        try {
            $db = Db::connectionDB();
            $request = 'UPDATE "user"
                    SET nom_user = :nom, prenom_user = :prenom, mail = :email, motdepasse = :password, date_naissance = :date
                    WHERE id_user = :iduser RETURNING *';
            $stmt = $db->prepare($request);
            $stmt->bindParam(':iduser', $id_user);
            $stmt->bindParam(':nom', $nom);
            $stmt->bindParam(':prenom', $prenom);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':password', $password);
            $stmt->bindParam(':date', $date);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $exception) {
            error_log($exception->getMessage());
            return false;
        }
    }

    static function ajouterUnUser($email, $date_naissance, $nom, $prenom, $mdp) {
        try {
            $db = Db::connectionDB();
            $request = "INSERT INTO \"user\" (mail, date_naissance, nom_user, prenom_user, motdepasse, image_user)
                        VALUES(:email, :age, :nom, :prenom, :mdp, :image) RETURNING *";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':age', $date_naissance);
            $stmt->bindParam(':nom', $nom);
            $stmt->bindParam(':prenom', $prenom);
            $stmt->bindParam(':mdp', $mdp);
            $str = str_replace(' ', '', "photo/profile/" . $nom . $prenom . ".png");
            $stmt->bindParam(':image', $str);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
        catch (PDOException $exception){
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] ". 'Request error: ' . $exception->getMessage());
            return false;
        }
    }




    //
    // Historique
    //

    //
    // Ajoute une musique a l'historique de l'utilisateur
    //
    static function ajoutHistorique($iduser, $idmusique) {
        try {
            $db = Db::connectionDB();
            $request = "INSERT INTO historique (id_user, id_musique)
                        VALUES(:iduser, :idmus) RETURNING *";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':iduser', $iduser);
            $stmt->bindParam(':idmus', $idmusique);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
        catch (PDOException $exception){
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] ". 'Request error: ' . $exception->getMessage());
            return false;
        }
    }

    static function isInHistorique($id_user, $id_musique) {
        try {
            $db = Db::connectionDB();
            $request = "SELECT * FROM historique WHERE id_musique = :id_musique AND id_user = :id_user";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id_musique', $id_musique);
            $stmt->bindParam(':id_user', $id_user);
            $stmt->execute();
            $data = $stmt->fetch(PDO::FETCH_ASSOC);
        }
        catch (PDOException $exception){
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] ". 'Request error: ' . $exception->getMessage());
            return false;
        }
        return $data;
    }

    static function changeInHistorique($id_user, $id_musique, $date) {
        try {
            $db = Db::connectionDB();
            $request = "UPDATE historique SET date_ajout = :date WHERE id_user = :id_user AND id_musique = :id_musique RETURNING *";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id_musique', $id_musique);
            $stmt->bindParam(':id_user', $id_user);
            $stmt->bindParam(':date', $date);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }
        catch (PDOException $exception){
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] ". 'Request error: ' . $exception->getMessage());
            return false;
        }
    }

    //
    // Renvoie l'hitorique d'un utilisateur
    //
    static function historiqueUser($id) {
        try {
            $db = Db::connectionDB();
            $request = 'SELECT * FROM "user"
                    INNER JOIN historique h on h.id_user = "user".id_user
                    INNER JOIN musique m on m.id_musique = h.id_musique
                    WHERE "user".id_user = :id
                    ORDER BY h.date_ajout DESC
                    LIMIT 10';
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
    //
    //
    static function getLastHistorique($id_user) {
        try {
            $db = Db::connectionDB();
            $request = "SELECT * FROM historique WHERE id_user = :id_user ORDER BY date_ajout DESC LIMIT 1";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id_user', $id_user);
            $stmt->execute();
            $data = $stmt->fetch(PDO::FETCH_ASSOC);
        }
        catch (PDOException $exception){
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] ". 'Request error: ' . $exception->getMessage());
            return false;
        }
        return $data;
    }

    static function removeFromHistorique($id_user, $id_musique) {
        try {
            $db = Db::connectionDB();
            $request = "DELETE FROM historique WHERE id_user = :id_user AND id_musique = :id_musique";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id_user', $id_user);
            $stmt->bindParam(':id_musique', $id_musique);
            $stmt->execute();
        }
        catch (PDOException $exception){
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] ". 'Request error: ' . $exception->getMessage());
            return false;
        }
        return true;
    }


    //
    // File d'attente
    //
    static function addToFileAttente($id_user, $id_musique) {
        try {
            $db = Db::connectionDB();
            $request = "INSERT INTO file_attente (id_user, id_musique)
                        VALUES(:iduser, :idmus) RETURNING *";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':iduser', $id_user);
            $stmt->bindParam(':idmus', $id_musique);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $exception) {
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] " . 'Request error: ' . $exception->getMessage());
            return false;
        }
    }

    static function isInFileAttente($id_user, $id_musique) {
        try {
            $db = Db::connectionDB();
            $request = "SELECT * FROM file_attente WHERE id_musique = :id_musique AND id_user = :id_user";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id_musique', $id_musique);
            $stmt->bindParam(':id_user', $id_user);
            $stmt->execute();
            $data = $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (PDOException $exception) {
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] " . 'Request error: ' . $exception->getMessage());
            return false;
        }
        return $data;
    }

    static function getFileAttente($id_user) {
        try {
            $db = Db::connectionDB();
            $request = "SELECT * FROM file_attente
                        INNER JOIN musique m on m.id_musique = file_attente.id_musique
                        INNER JOIN album a on a.id_album = m.id_album
                        INNER JOIN artiste a2 on a2.id_artiste = a.id_artiste
                        WHERE id_user = :id_user 
                        ORDER BY date_ajout";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id_user', $id_user);
            $stmt->execute();
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $exception) {
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] " . 'Request error: ' . $exception->getMessage());
            return false;
        }
        return $data;
    }

    static function removeFromFileAttente($id_user, $id_musique) {
        try {
            $db = Db::connectionDB();
            $request = "DELETE FROM file_attente WHERE id_user = :id_user AND id_musique = :id_musique";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id_user', $id_user);
            $stmt->bindParam(':id_musique', $id_musique);
            $stmt->execute();
        } catch (PDOException $exception) {
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] " . 'Request error: ' . $exception->getMessage());
            return false;
        }
        return true;
    }

    static function removeAllFileAttente($id_user) {
        try {
            $db= Db::connectionDB();
            $request = "DELETE FROM file_attente WHERE id_user = :id_user";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id_user', $id_user);
            $stmt->execute();
        } catch (PDOException $exception) {
            error_log("[" . basename(__FILE__) . "][" . __LINE__ . "] " . 'Request error: ' . $exception->getMessage());
            return false;
        }
        return true;
    }


    //
    // Like
    //
    static function addToLike($id_user, $id_musique) {
        $db = Db::connectionDB();
        $request = "INSERT INTO like_musique (id_musique, id_user) VALUES (:id_musique, :id_user) RETURNING *";
        $query = $db->prepare($request);
        $query->bindParam(':id_user', $id_user);
        $query->bindParam(':id_musique', $id_musique);
        $query->execute();
        return $query->fetch(PDO::FETCH_ASSOC);
    }

    static function getAllLike($id_user) {
        try {
            $db = Db::connectionDB();
            $request = "SELECT *
                        FROM like_musique
                        INNER JOIN musique ON musique.id_musique = like_musique.id_musique
                        INNER JOIN album a on a.id_album = musique.id_album
                        INNER JOIN artiste a2 on a2.id_artiste = musique.id_artiste_principale
                        WHERE id_user = :id_user
                        ORDER BY date_ajout DESC";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id_user', $id_user);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $exception) {
            error_log($exception->getMessage());
            return false;
        }
    }

    static function isLike($id_user, $id_musique) {
        try {
            $db = Db::connectionDB();
            $request = "SELECT * FROM like_musique WHERE id_user = :id_user AND id_musique = :id_musique";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id_user', $id_user);
            $stmt->bindParam(':id_musique', $id_musique);
            $stmt->execute();
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $exception) {
            error_log($exception->getMessage());
            return false;
        }
        return !empty($data);
    }

    static function removeFromLike($id_user, $id_musique) {
        try {
            $db = Db::connectionDB();
            $request = "DELETE FROM like_musique WHERE id_musique = :id_musique AND id_user = :id_user";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id_user', $id_user);
            $stmt->bindParam(':id_musique', $id_musique);
            $stmt->execute();
        } catch (PDOException $exception) {
            error_log($exception->getMessage());
            return false;
        }
        return true;
    }

    //
    // Prend une musqiue random dans la file d'attente du user
    //
    static function getRandomFileAttente($id_user) {
        try {
            $db = Db::connectionDB();
            $request = "SELECT * FROM file_attente WHERE id_user = :id_user ORDER BY RANDOM() LIMIT 1";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id_user', $id_user);
            $stmt->execute();
            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $exception) {
            error_log($exception->getMessage());
            return false;
        }
        return $data;
    }

    static function removeAllHistorique($id_user) {
        try {
            $db = Db::connectionDB();
            $request = "DELETE FROM historique WHERE id_user = :id_user";
            $stmt = $db->prepare($request);
            $stmt->bindParam(':id_user', $id_user);
            $stmt->execute();
        } catch (PDOException $exception) {
            error_log($exception->getMessage());
            return false;
        }
        return true;
    }
}