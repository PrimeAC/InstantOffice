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
    $sql_NumeroReserva = 'SELECT MAX(numero)+1 FROM Reserva';
    $sql_Reserva = "INSERT INTO Reserva VALUES ('$sql_NumeroReserva')";
    $query1 = $connection->prepare($sql_Reserva);
    $query1->execute();
    $query2 = $connection->prepare("INSERT INTO Estado VALUES ('$sql_NumeroReserva', '2016/1/10', 'pendente')");
    $query2->execute();
}

$table = $connection->query("SELECT * FROM Oferta");
drawTable($table);
?>
</body>
</html>