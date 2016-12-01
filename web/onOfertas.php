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
<form action="onOfertas.php" method="post">
    <h3>Adicionar uma reserva</h3>
    <label for="reserva_add">Morada</label>
    <input id="reserva_add" name="reserva_add">
    <label for="codigo_add">Codigo</label>
    <input id="codigo_add" name="codigo_add">
    <label for="data_add">Data inicio</label>
    <input id="data_add" name="data_add">
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
if (isset($_REQUEST["reserva_add"],$_REQUEST["codigo_add"],$_REQUEST["data_add"])){
    $sql = "SELECT morada, codigo, data_inicio FROM Oferta WHERE morada='B' AND codigo=2000 AND Oferta.data_inicio = '2016/1/10'";
    $query = $connection->prepare($sql);
    echo(is_null($query));
    $query->execute();
}

$table = $connection->query("SELECT * FROM Reserva");
drawTable($table);
?>
</body>
</html>