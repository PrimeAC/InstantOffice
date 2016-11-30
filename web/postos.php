<!DOCTYPE html>
<html>

<head>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        th, td {
            padding: 5px;
            text-align: left;
        }
    </style>
</head>

<body>
<form action="postos.php" method="post">
    <h3>Remover Postos de Trabalho</h3>
    <label for="morada_remove">Morada</label>
    <input id="morada_remove" name="morada_remove">
    <label for="codigo_remove">Codigo</label>
    <input id="codigo_remove" name="codigo_remove">
    <input type="submit" value="Submeter">
</form>
<br>
<form action="postos.php" method="post">
    <h3>Adicionar Postos de Trabalho</h3>
    <label for="morada_add">Morada</label>
    <input id="morada_add" name="morada_add">
    <label for="codigo_add1">Codigo</label>
    <input id="codigo_add1" name="codigo_add1">
    <label for="codigo_add2">Codigo Espaco</label>
    <input id="codigo_add2" name="codigo_add2">
    <input type="submit" value="Submeter">
</form>
<br>
<br>

<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include 'DB.php';
include 'helpers.php';

if (isset($_REQUEST["morada_remove"]) and isset($_REQUEST["codigo_remove"])) {
    $sql = 'DELETE FROM Alugavel WHERE morada = :morada AND codigo = :codigo';
    $query = $connection->prepare($sql);
    $query->execute(array('morada' => $_REQUEST["morada_remove"], 'codigo' => $_REQUEST["codigo_remove"]));
}
if (isset($_REQUEST["morada_add"]) and isset($_REQUEST["codigo_add1"])and isset($_REQUEST["codigo_add2"])) {
    $sql = 'INSERT INTO Posto VALUES (:morada, :codigo, :codigoEspaco)';
    $query = $connection->prepare($sql);
    $query->execute(array('morada' => $_REQUEST["morada_add"], 'codigo' => $_REQUEST["codigo_add1"],
        'codigoEspaco' => $_REQUEST["codigo_add2"]));
}

$table = $connection->query("SELECT * FROM Posto");
drawTable($table);
?>
</body>
</html>