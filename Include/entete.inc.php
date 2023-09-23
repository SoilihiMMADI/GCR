<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="Styles/gcr.css">
    <title>GSB : Suivi de la Visite médicale </title>
</head>

<body>
    <div id="haut">
        <h1><img src="Images/logo.jpg" />Gestion des visites</h1>
    </div>

    <div id="gauche">
        <p id="infosUtil"><?php
                            echo $_SESSION['utiNom'] . ' ';
                            echo $_SESSION['utiPrenom'] . '</br>';
                            echo $_SESSION['utiRole'] . '</br>';
                            echo 'Région ' . $_SESSION['utiRegion'];
                            ?>
        </p>
        <h2>Outils</h2>
        <ul>
            <li>Comptes-Rendus</li>
            <ul>
                <li><!--<a href="index.php?action=10" >-->Nouveaux<!--</a>--></li>
                <li>Consulter</li>
            </ul>
            <li>Consulter</li>
            <ul>
                <li><a href="index.php?action=20">Médicaments</a></li>
                <li><a href="index.php?action=30">Praticiens</a></li>
                <li><!--<a href="index.php?action=40" >-->Autres visiteurs<!--</a>--></li>
            </ul>
        </ul>
        <ul>
            <li><a href="index.php?action=0">Fermer la session</a></li>
        </ul>
    </div>