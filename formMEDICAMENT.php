<?php
require_once './Include/SourceDonnees.inc.php';
require_once './Include/Bibliotheque01.inc.php';
require_once './Include/entete.inc.php';
?>
<link rel="stylesheet" href="Styles/gcr.css">
<div id="droite">
    <div id="bas">
        <h1> Pharmacopée </h1>
        <?php
        switch ($_REQUEST['action']) {
            case 20 :
                ?>
                <form name="formChoixFamilleMedicaments" method="post" action="index.php">
                    <?php
                    $famSelect = (isset($_REQUEST['lstFamMed']) ? $_REQUEST['lstFamMed'] : 1);
                    echo formSelectDepuisRecordset('Famille : ', 'lstFamMed', 'lstFamMed', getListeFamilleMedicaments(), 10, $famSelect);
                    echo formBoutonSubmit('btnSubmit', 'btnSubmit', 'OK', 5) . '<br/>';
                    echo formInputHidden('action', 'action', 21);
                    ?>
                </form>
                <?php
                break;
            case 21 :
                ?>
                <form name="formChoixFamilleMedicaments" method="post" action="index.php">
                    <?php
                    $famSelect = (isset($_REQUEST['lstFamMed']) ? $_REQUEST['lstFamMed'] : 1);
                    echo formSelectDepuisRecordset('Famille : ', 'lstFamMed', 'lstFamMed', getListeFamilleMedicaments(), 10, $famSelect);
                    echo formBoutonSubmit('btnSubmit', 'btnSubmit', 'OK', 5) . '<br/>';
                    echo formInputHidden('action', 'action', 21);
                    ?>
                </form>
                <form name="formChoixMedicaments" method="post" action="index.php">        
                    <?php
                    $medicSelect = (isset($_REQUEST['lstMed']) ? $_REQUEST['lstMed'] : 1);
                    echo formSelectDepuisRecordset('Médicament : ', 'lstMed', 'lstMed', getListeMedicaments($_REQUEST['lstFamMed']), 20, $medicSelect);
                    echo formBoutonSubmit('btnSubmit2', 'btnSubmit2', 'OK', 15) . '<br/>';
                    echo formInputHidden('action', 'action', 22);
                    echo formInputHidden('choixFam', 'choixFam', $_REQUEST['lstFamMed']);
                    ?>
                </form>
                <?php
                break;
            case 22 :
                ?>
                <form name="formChoixFamilleMedicaments" method="post" action="index.php">
                    <?php
                    $famSelect = (isset($_REQUEST['choixFam']) ? $_REQUEST['choixFam'] : 1);
                    echo formSelectDepuisRecordset('Famille : ', 'lstFamMed', 'lstFamMed', getListeFamilleMedicaments(), 10, $famSelect);
                    echo formBoutonSubmit('btnSubmit', 'btnSubmit', 'OK', 5) . '<br/>';
                    echo formInputHidden('action', 'action', 21);
                    ?>
                </form>
                <form name="formChoixMedicaments" method="post" action="index.php">        
                    <?php
                    $medicSelect = (isset($_REQUEST['lstMed']) ? $_REQUEST['lstMed'] : 1);
                    echo formSelectDepuisRecordset('Médicament : ', 'lstMed', 'lstMed', getListeMedicaments($famSelect), 20, $_REQUEST['lstMed']);
                    echo formBoutonSubmit('btnSubmit2', 'btnSubmit2', 'OK', 15) . '<br/>';
                    echo formInputHidden('action', 'action', 22);
                    echo formInputHidden('choixFam', 'choixFam', $famSelect);                    
                    ?>
                </form>
                <form id="formMedicament" name="formMedicament" method="post">
                    <?php
                    if (isset($_REQUEST['lstMed'])) {
                        $codeMedicament = getInfosMedicament($_REQUEST['lstMed']);
                        echo formInputText('NOM COMMERCIAL ', 'txtNom', 'txtNom', $codeMedicament['MED_NOM'], 50, 40, 30, true) . '<br/>';
                        echo formTextArea('COMPOSITION ', 'txtCompo', 'txtCompo', $codeMedicament['MED_COMPO'], 50, 5, 50, 40, true) . '<br/>';
                        echo formTextArea('EFFETS ', 'txtEffet', 'txtEffet', $codeMedicament['MED_EFFETS'], 50, 5, 50, 50, true) . '<br/>';
                        echo formTextArea('CONTRE INDIC ', 'txtContreIndic', 'txtContreIndic', $codeMedicament['MED_CONTREINDIC'], 50, 5, 50, 60, true) . '<br/>';
                        echo formInputText('LABORATOIRE ', 'txtLabo', 'txtLabo', $codeMedicament['LAB_NOM'], 50, 40, 70, true);
                    }
                    ?>
                </form>
            </div>
        </div>
        <?php
        break;
}
?>




