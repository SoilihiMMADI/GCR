<?php
require_once './Include/SourceDonnees.inc.php';
require_once './Include/Bibliotheque01.inc.php';
require_once './Include/entete.inc.php';
?>	

<link rel="stylesheet" href="Styles/gcr.css.css">
   
<div id="droite">
    <div id="bas">
        <h1>Praticiens</h1>
            <form name="formListeRecherche" method="post">  
                
                <?php
                
                if (isset($_REQUEST["lstPrat"]))
                {
                    echo formSelectDepuisRecordset('Praticien : ', 'lstPrat', 'lstPrat', getListePraticiens(), 10, $_REQUEST['lstPrat']);
                }
                else
                {
                    echo formSelectDepuisRecordset('Praticien : ', 'lstPrat', 'lstPrat', getListePraticiens(), 10, 0);
                } 
                echo formBoutonSubmit('btnSubmit', 'btnSubmit', 'Ok', 20);
                
                ?>                                
            </form>
                
            <form id="formPraticien" name="formPraticien" method="post">	
                        
                <?php
                            
                if (isset($_REQUEST["lstPrat"])) 
                {
                    $numPraticien = getInfosPraticien($_REQUEST["lstPrat"]);

                    echo formInputText('NOM ', 'txtNom', 'txtNom', $numPraticien['PRA_NOM'], 50, 40, 10, true) . '<br/>';
                    echo formInputText('PRENOM ', 'txtPrenom', 'txtPrenom', $numPraticien['PRA_PRENOM'], 50, 40, 20, true) . '<br/>';
                    echo formInputText('ADRESSE ', 'txtAdresse', 'txtAdresse', $numPraticien['PRA_ADRESSE'], 50, 40, 30, true) . '<br/>';
                    echo formInputText('VILLE ', 'txtVille', 'txtVille', $numPraticien['PRA_VILLE'], 50, 40, 40, true) . '<br/>';
                    echo formInputText('COEF NOTORIETE ', 'txtCoeff', 'txtCoeff', $numPraticien['PRA_COEF'], 50, 40, 50, true) . '<br/>';
                    echo formInputText('LIEU D\'EXERCICE ', 'txtLieu', 'txtLieu', $numPraticien['TYP_LIEU'], 50, 40, 60, true);
                }
                
                ?>
            
            </form>
    </div>
</div>            

    