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
            float: left;
        }
        table:last-of-type{
            float: right;
            margin-right: 40%;
        }
    </style>
</head>
<body>
<form action="reservas.php" method="post">
    <h3>Pagar Reserva</h3>
    <label for="reserva_pay">Numero de Reserva</label>
    <input id="reserva_pay" name="reserva_pay"><br>
    <input type="radio" name="payment" value="cartao" checked>Cartao de credito/debito<br>
    <input type="radio" name="payment" value="transferencia">Transferencia bancaria<br>
    <input type="radio" name="payment" value="dinheiro">Numerario<br>
    <input type="radio" name="payment" value="cheque">Cheque<br>
    <input type="radio" name="payment" value="paypal">PayPal<br>
    <input type="submit" value="Submeter">
</form>
<br>
<br>

<?php
include 'DB.php';
include 'helpers.php';

if (isset($_REQUEST["reserva_pay"])) {

    $sql = "SELECT estado FROM Estado WHERE numero = :reserva HAVING estado = 'aceite'";

    $connection->beginTransaction();

    $query = $connection->prepare($sql);
    $query->execute(array('reserva' => $_REQUEST["reserva_pay"]));

    $result = $query->fetchAll();

    if (count($result) != 0) {

        $pagamentos = array("cartao", "transferencia", "dinheiro", "cheque", "paypal");

        if(in_array($_REQUEST["payment"],$pagamentos)) {

            $sql = "INSERT INTO Paga VALUES (:reserva, NOW(), :pagamento)";

            $query = $connection->prepare($sql);
            $query->execute(array('reserva' => $_REQUEST["reserva_pay"], 'pagamento' => $_REQUEST["payment"]));
        }
    }
    $connection->commit();
}
echo('<h3>Reservas por pagar:</h3>');
$table = $connection->query("SELECT numero FROM Estado WHERE estado = 'aceite' AND numero NOT IN 
  (SELECT numero FROM Paga)");
drawTable($table);

$table = $connection->query("SELECT * FROM Paga");
drawTable($table);
?>
</body>
</html>