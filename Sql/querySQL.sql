SELECT * FROM Factura;
SELECT * FROM Factura, Clientes WHERE Clientes.nombre LIKE '_[aeiou]%';
SELECT fecha_medicion,SUM(CASE WHEN nombre='Residencial' THEN consumo_real_Watts ELSE 0 END) AS consumoResidencial,SUM(CASE WHEN nombre='Comercial' THEN consumo_real_Watts ELSE 0 END) AS consumoComercial FROM Medidores, TipoServicio GROUP BY fecha_medicion;
SELECT COUNT(*) as cuentoMedidores, SUM(consumo_real_Watts) as sumatoriaConsumo FROM Medidores WHERE fecha_medicion BETWEEN current_date AND current_date-40;
SELECT COUNT(*) AS facturasVencidas,SUM(monto_total) AS montoTotalVencimiento,(COUNT(*) / (SELECT COUNT(*) FROM Factura))*100 AS porcentajeVencidas FROM Factura WHERE Vencido='True' AND YEAR(fecha_factura) = YEAR(current_date);

