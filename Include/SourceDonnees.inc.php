<?php

function SGBDConnect()
{
    try {

        $connexion = new PDO('mysql:host=localhost;dbname=gsb', 'root', '');
        $connexion->query('SET NAMES UTF8');
        $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        echo 'Erreur !: ' . $e->getMessage() . '<br />';
        exit();
    }
    return $connexion;
}

function getListePraticiens()
{

    try {

        $requete = 'SELECT PRA_NUM, concat(PRA_NOM, " ", PRA_PRENOM) As NomPrenom '

            . 'FROM PRATICIEN '

            . 'ORDER BY PRA_NOM';

        $resultat = SGBDConnect()->query($requete);
    } catch (PDOException $e) {

        echo 'Erreur !: ' . $e->getMessage() . '<br />';

        exit();
    }

    return $resultat;
}

function getInfosPraticien($numPrat)
{
    $connexion = SGBDConnect();

    $requete = 'SELECT PRA_NOM, PRA_PRENOM, PRA_ADRESSE, PRA_VILLE, PRA_COEF, TYP_LIEU '
        . 'FROM praticien '
        . 'inner join type_praticien  '
        . 'ON PRA_TYPE = TYP_CODE '
        . 'WHERE PRA_NUM = ' . $numPrat;

    $resultat = $connexion->query($requete);
    $resultat->setFetchMode(PDO::FETCH_ASSOC);
    $ligne = $resultat->fetch(PDO::FETCH_ASSOC);

    return $ligne;
}

function getListeFamilleMedicaments()
{

    try {

        $requete = 'SELECT FAM_CODE, FAM_LIBELLE '

            . 'FROM FAMILLE '

            . 'ORDER BY FAM_LIBELLE';

        $resultat = SGBDConnect()->query($requete);
    } catch (PDOException $e) {

        echo 'Erreur !: ' . $e->getMessage() . '<br />';

        exit();
    }

    return $resultat;
}

function getListeMedicaments($codeFam)
{

    try {

        $requete = 'SELECT MED_CODE, MED_NOM '

            . 'FROM MEDICAMENT '
            . 'WHERE MED_FAMILLE = "' . $codeFam . '"'
            . 'ORDER BY MED_NOM';

        $resultat = SGBDConnect()->query($requete);
    } catch (PDOException $e) {

        echo 'Erreur !: ' . $e->getMessage() . '<br />';

        exit();
    }

    return $resultat;
}

function getInfosMedicament($codeMed)
{
    $connexion = SGBDConnect();

    $requete = 'SELECT MED_NOM, MED_COMPO, MED_EFFETS, MED_CONTREINDIC, LAB_NOM '
        . 'FROM MEDICAMENT '
        . 'INNER JOIN LABORATOIRE '
        . 'ON MED_LABO = LAB_CODE '
        . 'WHERE MED_CODE = "' . $codeMed . '"';

    $resultat = $connexion->query($requete);
    $resultat->setFetchMode(PDO::FETCH_ASSOC);
    $ligne = $resultat->fetch(PDO::FETCH_ASSOC);

    return $ligne;
}

function existeCompteVisiteur($id, $mdp)
{
    $connexion = SGBDConnect();

    $requete = 'SELECT VIS_CODE, VIS_PASSE'
        . ' FROM visiteur'
        . ' WHERE VIS_CODE = "' . $id . '"'
        . ' AND VIS_PASSE = "' . $mdp . '"';

    $resultat = $connexion->query($requete);

    return ($resultat->rowCount() == 1);
}

function getInfosUtilisateur($id)
{
    $connexion = SGBDConnect();

    $requete = 'SELECT VIS_CODE, VIS_NOM, VIS_PRENOM, TRA_ROLE, REG_NOM'
        . ' FROM VISITEUR INNER JOIN TRAVAIL'
        . ' ON VIS_CODE = TRA_VIS INNER JOIN REGION'
        . ' ON TRA_REG = REG_CODE'
        . ' WHERE VIS_CODE = "' . $id . '"';

    $resultat = $connexion->query($requete);
    $resultat->setFetchMode(PDO::FETCH_ASSOC);
    $ligne = $resultat->fetch(PDO::FETCH_ASSOC);

    return $ligne;
}
