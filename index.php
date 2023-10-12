<?php

require "conexion.php";
require "fpdf/fpdf.php";
require "helpers/NumeroALetras.php";

define('MONEDA', 'S/.');
define('MONEDA_LETRA', 'soles');
define('MONEDA_DECIMAL', 'centimos');


$idVenta = isset($_GET['id']) ? $mysqli->real_escape_string($_GET['id']) : 1;
$sqlVenta = "SELECT folio, total, DATE_FORMAT(fecha,'%d/%m/%Y') AS fecha_venta, DATE_FORMAT(fecha,'%H:%i') AS hora
FROM ventas WHERE id = $idVenta LIMIT 1";

$resultado = $mysqli->query($sqlVenta);
$row_venta = $resultado->fetch_assoc();
$total = number_format($row_venta['total'], 2, '.', ',');

$sqlDetalle = "SELECT nombre, cantidad, precio FROM detalle_venta WHERE id_venta =$idVenta";
$resultadoDetalle = $mysqli->query($sqlDetalle);

$pdf = new FPDF('P', 'mm', array(80, 200));
$pdf->AddPage();
$pdf->SetMargins(5, 5, 5);
$pdf->SetFont('Arial', 'B', 9);

$pdf->Image('images/wind.png', 15, 2, 45);
$pdf->Ln(30);
$pdf->MultiCell(70, 5, 'MINIMARKET WIND', 0, 'C');

$pdf->Ln(2);

$pdf->SetFont('Arial', 'B', 8);
$pdf->Cell(20, 5, 'Folio ticket: ', 0, 0, 'L');
$pdf->SetFont('Arial', '', 8);
$pdf->Cell(20, 5, $row_venta['folio'], 0, 1, 'L');

$pdf->Cell(70, 2, '--------------------------------------------------------------------------', 0, 1, 'L');

$pdf->Cell(10, 4, 'Cant.', 0, 0, 'L');
$pdf->Cell(30, 4, mb_convert_encoding('Descripción', 'ISO-8859-1', 'UTF-8'), 0, 0, 'L');
$pdf->Cell(15, 4, 'Precio', 0, 0, 'L');
$pdf->Cell(15, 4, 'Importe', 0, 1, 'L');

$pdf->Cell(70, 2, '--------------------------------------------------------------------------', 0, 1, 'L');

$totalProducto = 0;
$pdf->SetFont('Arial', '', 7);

while ($row_producto = $resultadoDetalle->fetch_assoc()) {
    $importe = $row_producto['cantidad'] * $row_producto['precio'];
    $importe = number_format($importe, 2, '.', ',');
    $totalProducto += $row_producto['cantidad'];

    $pdf->Cell(10, 4, $row_producto['cantidad'], 0, 0, 'L');

    $yInicio = $pdf->GetY();
    $pdf->MultiCell(30, 4, mb_convert_encoding($row_producto['nombre'], 'ISO-8859-1', 'UTF-8'), 0, 'L');
    $yFin = $pdf->GetY();

    $pdf->SetXY(45, $yInicio);

    $pdf->Cell(15, 4, MONEDA . ' ' . $row_producto['precio'], 0, 0, 'L');
    $pdf->Cell(15, 4, MONEDA . ' ' . $importe, 0, 1, 'L');

    $pdf->SetY($yFin);
}

$pdf->Ln();

$pdf->Cell(70, 4, mb_convert_encoding('Número de productos: ', 'ISO-8859-1', 'UTF-8') . $totalProducto, 0, 1, 'L');

$pdf->SetFont('Arial', 'B', 8);
$pdf->Cell(70, 5, 'Total: ' . MONEDA . ' ' . $total, 0, 1, 'R');

$pdf->Ln(2);

$pdf->SetFont('Arial', '', 8);
$pdf->MultiCell(70, 4, 'Son: ' . strtolower(NumeroALetras::convertir($total, MONEDA_LETRA, MONEDA_DECIMAL)), 0, 'L');

$pdf->Ln();

$pdf->Cell(35, 5, 'Fecha: ' . $row_venta['fecha_venta'], 0, 0, 'C');
$pdf->Cell(35, 5, 'Hora: ' . $row_venta['hora'], 0, 1, 'C');

$pdf->Ln();

$pdf->MultiCell(70, 5, 'AGRADECEMOS SU PREFERENCIA, VUELVA PRONTO!!!', 0, 'C');

$pdf->Output();
