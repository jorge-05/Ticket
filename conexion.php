<?php

$mysqli = new mysqli("localhost", "root", "", "mi_tienda");

if ($mysqli->connect_errno) {
    echo "Error de conexión";
    exit;
}
