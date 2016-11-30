<?php

function drawTable(PDOStatement $table) {
    // get table columns
    $columnsArray = array_map(function ($elem) use ($table) {
        return $table->getColumnMeta($elem)["name"];
    }, range(0, $table->columnCount() - 1));

    echo "<table>";

    // print table columns as table headers
    echo "<tr>";
    foreach ($columnsArray as $column) {
        echo "<th>" . $column . "</th>";
    }
    echo "</tr>";

    // print all rows
    foreach ($table as $row) {
        echo "<tr>";
        foreach ($columnsArray as $column) {
            echo "<td>" . $row[$column] . "</td>";
        }
        echo "</tr>";
    }

    echo "</table>";
}