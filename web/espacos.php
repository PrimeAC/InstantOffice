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
<form action="espacos.php" method="post">
    <h3>Remover Espacos de Trabalho</h3>
    <label for="morada_remove">Morada</label>
    <input id="morada_remove" name="morada_remove">
    <label for="codigo_remove">Codigo</label>
    <input id="codigo_remove" name="codigo_remove">
    <input type="submit" value="Submeter">
</form>
<br>
<form action="espacos.php" method="post">
    <h3>Adicionar Espacos de Trabalho</h3>
    <label for="morada_add">Morada</label>
    <input id="morada_add" name="morada_add">
    <label for="codigo_add">Codigo</label>
    <input id="codigo_add" name="codigo_add">
    <input type="submit" value="Submeter">
</form>
<br>
<br>

<?php
include 'DB.php';
include 'helpers.php';

if (isset($_REQUEST["morada_remove"]) and isset($_REQUEST["codigo_remove"])) {
    $sql = 'DELETE FROM Espaco WHERE morada = :morada AND codigo = :codigo';
    $query = $connection->prepare($sql);
    $query->execute(array('morada' => $_REQUEST["morada_remove"], 'codigo' => $_REQUEST["codigo_remove"]));
}
if (isset($_REQUEST["morada_add"]) and isset($_REQUEST["codigo_add"])) {
    $sql = 'INSERT INTO Espaco VALUES (:morada, :codigo)';
    $query = $connection->prepare($sql);
    $query->execute(array('morada' => $_REQUEST["morada_add"] , 'codigo' => $_REQUEST["codigo_add"]));
}

$table = $connection->query("SELECT * FROM Espaco");
drawTable($table);
?>
</body>
</html>