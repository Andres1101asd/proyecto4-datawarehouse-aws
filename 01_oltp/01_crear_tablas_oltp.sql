-- Borrar tablas si existen para empezar de cero
DROP TABLE IF EXISTS detalle_pedido, pagos, envios, pedidos, inventario, empleados, tiendas, productos, clientes, subcategorias, categorias, proveedores, marcas, regiones, cargos CASCADE;

-- Crear las 15 tablas
CREATE TABLE clientes (cliente_id SERIAL PRIMARY KEY, nombre VARCHAR(100), email VARCHAR(100), ciudad VARCHAR(50), region VARCHAR(50), fecha_registro DATE, updated_at TIMESTAMP);
CREATE TABLE productos (producto_id SERIAL PRIMARY KEY, nombre VARCHAR(100), categoria_id INT, proveedor_id INT, precio DECIMAL(10,2), updated_at TIMESTAMP);
CREATE TABLE categorias (categoria_id SERIAL PRIMARY KEY, nombre VARCHAR(50));
CREATE TABLE subcategorias (subcategoria_id SERIAL PRIMARY KEY, categoria_id INT, nombre VARCHAR(50));
CREATE TABLE proveedores (proveedor_id SERIAL PRIMARY KEY, nombre VARCHAR(100), pais VARCHAR(50));
CREATE TABLE marcas (marca_id SERIAL PRIMARY KEY, nombre VARCHAR(50));
CREATE TABLE tiendas (tienda_id SERIAL PRIMARY KEY, nombre VARCHAR(100), region_id INT, ciudad VARCHAR(50));
CREATE TABLE regiones (region_id SERIAL PRIMARY KEY, nombre VARCHAR(50));
CREATE TABLE empleados (empleado_id SERIAL PRIMARY KEY, nombre VARCHAR(100), cargo_id INT, tienda_id INT);
CREATE TABLE cargos (cargo_id SERIAL PRIMARY KEY, nombre VARCHAR(50));
CREATE TABLE pedidos (pedido_id SERIAL PRIMARY KEY, cliente_id INT, fecha DATE, total DECIMAL(10,2), updated_at TIMESTAMP);
CREATE TABLE detalle_pedido (detalle_id SERIAL PRIMARY KEY, pedido_id INT, producto_id INT, cantidad INT, precio_unitario DECIMAL(10,2));
CREATE TABLE pagos (pago_id SERIAL PRIMARY KEY, pedido_id INT, metodo_pago VARCHAR(50), monto DECIMAL(10,2));
CREATE TABLE envios (envio_id SERIAL PRIMARY KEY, pedido_id INT, direccion VARCHAR(200), fecha_envio DATE);
CREATE TABLE inventario (inventario_id SERIAL PRIMARY KEY, producto_id INT, tienda_id INT, stock INT);