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
<form action="totalEspaco.php" method="post">
    <h3>Total realizado por Espaco:</h3>
    <label for="morada_query">Morada do Edificio</label>
    <input id="morada_query" name="morada_query">
</form>
<br>
<br>

<?php
include 'DB.php';
include 'helpers.php';

if (isset($_REQUEST["morada_query"])) {
    $query = $connection->prepare('CALL test(:morada);');
    $query->execute(array('morada' => $_REQUEST["morada_query"]));
    drawTable($query);
    $query->closeCursor();
    unset($query);
    echo "<br><br>";

}

echo "<h3>Edificios:</h3>";
$table = $connection->query("SELECT * FROM Edificio");
drawTable($table);
$table->closeCursor();
?>
</body>
</html>
