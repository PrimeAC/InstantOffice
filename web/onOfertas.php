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
        table {
            float:left;
            margin-left: 2%;
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

    $sql = "SELECT morada, codigo, data_inicio FROM Oferta WHERE morada= :reserva AND codigo= :codigo AND 
      data_inicio = :data_inicio";

    $query = $connection->prepare($sql);
    $query->execute(array('reserva' => $_REQUEST["reserva_add"], 'codigo' => $_REQUEST["codigo_add"],
        'data_inicio' => $_REQUEST["data_add"]));

    $result = $query->fetchAll();

    if (count($result) != 0) {

        $sql = "SELECT MAX(numero) FROM Reserva";

        $query = $connection->prepare($sql);
        $query->execute();

        $new_reserva = $query->fetch(PDO::FETCH_COLUMN) + 1;

        $query = $connection->prepare("INSERT INTO Reserva VALUE ($new_reserva)");
        $query->execute();

        $sql = "INSERT INTO Estado VALUES($new_reserva, NOW(), 'pendente')";

        $query = $connection->prepare($sql);
        $query->execute();
    }
}

$table = $connection->query("SELECT * FROM Oferta");
drawTable($table);
$table = $connection->query("SELECT * FROM Reserva");
drawTable($table);
$table = $connection->query("SELECT * FROM Estado");
drawTable($table);
?>
</body>
</html>