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
<form action="edificios.php" method="post">
    <h3>Remover edificio</h3>
    <label for="morada_remove">Morada</label>
    <input id="morada_remove" name="morada_remove">
</form>
<br>
<form action="edificios.php" method="post">
    <h3>Adicionar edificio</h3>
    <label for="morada_add">Morada</label>
    <input id="morada_add" name="morada_add">
</form>
<br>
<br>

<?php
include 'DB.php';
include 'helpers.php';

if (isset($_REQUEST["morada_remove"])) {
    $query = $connection->prepare('DELETE FROM Edificio WHERE morada = :morada');
    $query->execute(array('morada' => $_REQUEST["morada_remove"]));
}
if (isset($_REQUEST["morada_add"])) {
    $query = $connection->prepare('INSERT INTO Edificio VALUES (:morada)');
    $query->execute(array('morada' => $_REQUEST["morada_add"]));
}

$table = $connection->query("SELECT * FROM Edificio");
drawTable($table);
?>
</body>
</html>
