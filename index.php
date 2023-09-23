<?php

require_once './Include/SourceDonnees.inc.php';
require_once './Include/Securite.inc.php';

if (!isset($_REQUEST['action'])) {
    //require_once './Include/entete2.inc.php';
    require_once './identif.php';
} else {

    //if (estSessionUtilisateurOuverte()) {
        switch ($_REQUEST['action']) {
            case 0 :
                require_once './identif.php';
                break;
            case 1 :
                require_once './identif.php';
                break;
            case 5 :
                if (estSessionUtilisateurOuverte()) {
                require_once './Include/entete.inc.php';
                 }
                  else{
                  require_once './identif.php';
                  } 
                break;
            case 10 :
                if (estSessionUtilisateurOuverte()) {
                require_once './formRAPPORT_VISITE.html';
                 }
                  else{
                  require_once './identif.php';
                  } 
                break;
            case 20 :
                if (estSessionUtilisateurOuverte()) {
                require_once './formMEDICAMENT.php';
                 }
                  else{
                  require_once './identif.php';
                  } 
                break;
            case 21 :
                if (estSessionUtilisateurOuverte()) {
                require_once './formMEDICAMENT.php';
                 }
                  else{
                  require_once './identif.php';
                  } 
                break;
            case 22 :
                if (estSessionUtilisateurOuverte()) {
                require_once './formMEDICAMENT.php';
                }
                  else{
                  require_once './identif.php';
                  } 
                break;
            case 30 :
                if (estSessionUtilisateurOuverte()) {
                require_once './formPRATICIEN.php';
                 }
                  else{
                  require_once './identif.php';
                  } 
                break;
            case 40 :
                if (estSessionUtilisateurOuverte()) {
                require_once './formVISITEUR.html';
                 }
                  else{
                  require_once './identif.php';
                  } 
                break;
            default :
                echo 'cette page n\'existe pas' ;
        }
    }
//}
require_once './Include/pied.inc.php';
