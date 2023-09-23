# GCR

School project GCR realized during my training in BTS SIO. [PHP,HTML,CSS,JavaScript,SQL]  
it's a simple project to learn how to use PHP, HTML, CSS, JavaScript, SQL

## Setup

git clone https://github.com/SoilihiMMADI/GCR.git

## Database

I use MySQL and phpMyAdmin  
The file with database function is Include/SourcesDonnees.inc.php  
Database file for phpMyAdmin is Database/gsb.sql

## Functionalities

### Login
first, you need to log in. logging in is done using the accounts in the "visiteur" table (you can modify the "VIS_PASS" field with a hashed md5 password).
"VIS_CODE" for "Utilisateur" and "VIS_PASS" (not hashed) for "Mot de passe".

### Pages
Once logged in, you can see the list of drugs and their details, and the list of practitioners and their details.
