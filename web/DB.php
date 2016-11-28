<?php

$host = "localhost";
$user = "admin";
$password = "letmein";
$dbname = "BDdev";

$connection = new PDO("mysql:host=" . $host . ";dbname=" . $dbname, $user, $password, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));