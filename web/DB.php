<?php

if (getenv("DOCKER_DEV")) {
    $host = "localhost";
    $user = "admin";
    $password = "letmein";
    $dbname = "BDdev";
} else {
    $host = "db.ist.utl.pt";
    $user = "ist182064";        // -> substituir pelo nome de utilizador
    $password = "xxxxxxxxx";     // -> substituir pela password
    $dbname = $user;
}

$connection = new PDO("mysql:host=" . $host . ";dbname=" . $dbname, $user, $password, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));
$connection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);