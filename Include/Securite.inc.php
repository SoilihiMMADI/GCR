<?php
require_once './Include/SourceDonnees.inc.php';

session_start();

function valideInfosCompteUtilisateur($codeVisi, $mdp)
{
    $compte = existeCompteVisiteur($codeVisi, md5($mdp));
    return $compte;
}

function ouvreSessionUtilisateur($id)
{
    $_SESSION['utilId'] = $id;

    $infos = getInfosUtilisateur($id);

    $_SESSION['utiNom'] = $infos['VIS_NOM'];
    $_SESSION['utiPrenom'] = $infos['VIS_PRENOM'];
    $_SESSION['utiRole'] = $infos['TRA_ROLE'];
    $_SESSION['utiRegion'] = $infos['REG_NOM'];
}

function estSessionUtilisateurOuverte()
{
    return isset($_SESSION['utilId']);
}

function fermeSessionUtilisateur()
{
    session_destroy();
}

function articleValide($titre, $contenu)
{
}
