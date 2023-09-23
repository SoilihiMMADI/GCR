<?php
require_once './Include/Bibliotheque01.inc.php';
require_once './Include/Securite.inc.php';

if (!isset($_REQUEST['action']) || !estSessionUtilisateurOuverte() && isset($_REQUEST['action']) && !isset($_POST['btnSubmit'])) {
    require_once './Include/entete2.inc.php';?>

    <form name="frmIdentification" id="frmIdentification" method="post" action="index.php">
        <fieldset>
            <legend>Identifiez-vous</legend>
            <?php
            echo formInputText("Utilisateur", "txtUti", "txtUti", "", 50, 40, 10, false, true);
            echo formInputPassword("Mot de passe", "pwMDP", "pwMDP", "", 50, 40, 20, true);
            echo formBoutonSubmit("btnSubmit", "btnSubmit", "Valider", 30);
            echo formInputHidden('action', 'action', 1)
            ?>
        </fieldset>
    </form><?php
} else {

    switch ($_REQUEST['action']) {

        case 1:
            //if (isset($_POST['btnSubmit'])) {
                if (valideInfosCompteUtilisateur($_POST['txtUti'], $_POST['pwMDP'])) {
                    header('Location: ./index.php?action=5');
                    ouvreSessionUtilisateur($_POST['txtUti']);
                    exit();
                } else {
                    require_once './Include/entete2.inc.php';
                    ?>
                    <form name="frmIdentification" id="frmIdentification" method="post" action="index.php">
                        <fieldset>
                            <legend>Identifiez-vous</legend>
                            <?php
                            echo formInputText("Utilisateur", "txtUti", "txtUti", $_POST['txtUti'], 50, 40, 10, false, true);
                            echo formInputPassword("Mot de passe", "pwMDP", "pwMDP", "", 50, 40, 20, true);
                            echo formBoutonSubmit("btnSubmit", "btnSubmit", "Valider", 30);
                            echo formInputHidden('action', 'action', 1)
                            ?>
                        </fieldset>
                    </form>
                    <p class="erreur">Utilisateur et/ou mot de passe invalide(s)</p>
                    <?php
                //}
            }
            break;
        case 0 :
            fermeSessionUtilisateur();
            header('Location: ./index.php');
            exit();
            break;
    }
}
?>