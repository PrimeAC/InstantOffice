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
<form action="ofertas.php" method="post">
    <h3>Remover Oferta</h3>
    <label for="morada_remove">Morada</label>
    <input id="morada_remove" name="morada_remove">
    <label for="codigo_remove">Codigo</label>
    <input id="codigo_remove" name="codigo_remove">
    <label for="datai_remove">Data Inicio</label>
    <input id="datai_remove" name="datai_remove" placeholder="yyyy/mm/dd">
    <input type="submit" value="Submeter">
</form>
<br>
<form action="ofertas.php" method="post">
    <h3>Adicionar Oferta</h3>
    <label for="morada_add">Morada</label>
    <input id="morada_add" name="morada_add">
    <label for="codigo_add">Codigo</label>
    <input id="codigo_add" name="codigo_add">
    <label for="datai_add">Data Inicio</label>
    <input id="datai_add" name="datai_add" placeholder="yyyy/mm/dd">
    <label for="dataf_add">Data Fim</label>
    <input id="dataf_add" name="dataf_add" placeholder="yyyy/mm/dd">
    <label for="tarifa_add">Tarifa</label>
    <input id="tarifa_add" name="tarifa_add">
    <input type="submit" value="Submeter">
</form>
<br>
<br>

<?php

include 'DB.php';
include 'helpers.php';

if (isset($_REQUEST["morada_remove"], $_REQUEST["codigo_remove"], $_REQUEST["datai_remove"])) {
    $sql = 'DELETE FROM Oferta WHERE morada = :morada AND codigo = :codigo AND data_inicio = :data_inicio';
    $query = $connection->prepare($sql);
    $query->execute(array('morada' => $_REQUEST["morada_remove"], 'codigo' => $_REQUEST["codigo_remove"],
        'data_inicio' => $_REQUEST["datai_remove"]));
}
if (isset($_REQUEST["morada_add"], $_REQUEST["codigo_add"], $_REQUEST["datai_add"], $_REQUEST["dataf_add"],
    $_REQUEST["tarifa_add"])) {
    if ((strtotime($_REQUEST["datai_add"]) <= strtotime($_REQUEST["dataf_add"]))
        AND (strtotime(date_default_timezone_get()) <= strtotime($_REQUEST["datai_add"]))
    ) {
        $sql = 'INSERT INTO Oferta VALUES (:morada, :codigo, :data_inicio, :data_fim, :tarifa);';
        $query = $connection->prepare($sql);
        $query->execute(array(':morada' => $_REQUEST["morada_add"], ':codigo' => $_REQUEST["codigo_add"],
            ':data_inicio' => $_REQUEST["datai_add"], ':data_fim' => $_REQUEST["dataf_add"],
            ':tarifa' => $_REQUEST["tarifa_add"]));

    } else {
        echo "Data invalida";
    }
}

$table = $connection->query("SELECT * FROM Oferta");
drawTable($table);
?>

</body>

</html>
