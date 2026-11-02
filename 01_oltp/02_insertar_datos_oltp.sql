-- 1. Insertar 100,000 pedidos
INSERT INTO pedidos (cliente_id, fecha, total, updated_at)
SELECT
    floor(random() * 100 + 1)::int,
    CURRENT_DATE - floor(random() * 365)::int,
    round((random() * 1000 + 10)::numeric, 2),
    NOW()
FROM generate_series(1, 100000);

-- 2. Insertar 100,000 detalles de pedido
INSERT INTO detalle_pedido (pedido_id, producto_id, cantidad, precio_unitario)
SELECT
    floor(random() * 100000 + 1)::int,
    floor(random() * 50 + 1)::int,
    floor(random() * 10 + 1)::int,
    round((random() * 500 + 5)::numeric, 2)
FROM generate_series(1, 100000);

-- 3. Insertar 100,000 pagos
INSERT INTO pagos (pedido_id, metodo_pago, monto)
SELECT
    floor(random() * 100000 + 1)::int,
    (ARRAY['Tarjeta', 'Efectivo', 'Transferencia', 'Yape', 'Plin'])[floor(random() * 5 + 1)],
    round((random() * 1000 + 10)::numeric, 2)
FROM generate_series(1, 100000);

-- 4. Insertar 100,000 inventarios
INSERT INTO inventario (producto_id, tienda_id, stock)
SELECT
    floor(random() * 50 + 1)::int,
    floor(random() * 10 + 1)::int,
    floor(random() * 500)::int
FROM generate_series(1, 100000);