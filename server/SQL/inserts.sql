--INSERTS DE PAISES
INSERT INTO paises (nombre_pais) VALUES 
('Holanda'),
('Ecuador'),
('Alemania'),
('Estados Unidos'),
('Inglaterra'),
('Colombia'),
('Mexico'),
('España'),
('Argentina');

--INSERTS DE FLORES DE CORTE

INSERT INTO flores_corte (nombre_comun, genero_especie, etimologia, tem_conservacion, colores) VALUES
('Rosa', 'Rosa spp.', 'Llamada así en honor a la diosa romana de la belleza.', 18.00, 'rojo, rosa, blanco, amarillo'),
('Clavel', 'Dianthus caryophyllus', 'El nombre proviene del griego "dianthus", que significa "flor divina".', 14.00, 'rojo, rosa, blanco, amarillo'),
('Lirio', 'Lilium spp.', 'Proviene del latín "lilium", que significa "lirio".', 10.00, 'blanco, amarillo, naranja, rojo'),
('Tulipán', 'Tulipa spp.', 'Deriva del turco "tülbent", que significa "turbante".', 12.00, 'rojo, amarillo, rosa, púrpura'),
('Girasol', 'Helianthus annuus', 'Su nombre proviene del griego "helios" (sol) y "anthos" (flor).', 20.00, 'amarillo, marrón, naranja'),
('Margarita', 'Bellis perennis', 'Su nombre proviene del latín "bellus", que significa "hermoso".', 15.00, 'blanco, amarillo'),
('Freesia', 'Freesia spp.', 'Nombrada en honor al botánico alemán Friedrich Freese.', 15.00, 'amarillo, blanco, rosa, lavanda'),
('Hortensia', 'Hydrangea macrophylla', 'El nombre proviene del griego "hydor" (agua) y "angeion" (recipiente).', 20.00, 'azul, rosa, blanco, púrpura'),
('Crisantemo', 'Chrysanthemum morifolium', 'Proviene del griego "chrysos" (oro) y "anthemon" (flor).', 16.00, 'amarillo, blanco, rosa, púrpura');

--INSERTS DE COLORES

INSERT INTO colores (codigo_color, nombre, descripcion) VALUES
('ca1b1b', 'Rojo', 'Color rojo brillante, asociado con la pasión y el amor.'),
('c5388b ', 'Rosa', 'Color rosa claro, a menudo relacionado con la dulzura y la ternura.'),
('ffffff', 'Blanco', 'Color blanco puro, simboliza la paz y la pureza.'),
('fbf500', 'Amarillo', 'Color amarillo brillante, asociado con la alegría y la felicidad.'),
('ffa500', 'Naranja', 'Color naranja vibrante, a menudo asociado con la energía y el entusiasmo.'),
('800080', 'Púrpura', 'Color púrpura, a menudo relacionado con la realeza y la sofisticación.'),
('a52a2a', 'Marrón', 'Color marrón, que evoca la tierra y la estabilidad.'),
('0000ff', 'Azul', 'Color azul brillante, asociado con la calma y la serenidad.'),
('e6e6fa', 'Lavanda', 'Color lavanda, suave y relajante, asociado con la tranquilidad.'),
('008000', 'Verde', 'Color verde, asociado con la naturaleza y el crecimiento.');

--INSERTS DE SIGNIFICADOS

INSERT INTO significados (tipo, descripcion) VALUES
('sent', 'amor'),
('sent', 'pasión'),
('sent', 'alegría'),
('sent', 'dulzura'),
('sent', 'serenidad'),
('sent', 'pureza'),
('sent', 'entusiasmo'),
('sent', 'gratitud'),
('sent', 'esperanza'),
('sent', 'nostalgia'),
('ocas', 'aniversario'),
('ocas', 'cortejo'),
('ocas', 'cumpleaños'),
('ocas', 'felicitaciones'),
('ocas', 'dia de la madre'),
('ocas', 'funeral'),
('ocas', 'graduacion'),
('ocas', 'matrimonio'),
('ocas', 'consuelo');
--INSERTS DE SUBASTADORAS

INSERT INTO subastadoras (nombre_sub, id_pais) VALUES 
('VGB Flowers', (SELECT id_pais FROM paises WHERE nombre_pais = 'Holanda')),
('Royal FloraHolland', (SELECT id_pais FROM paises WHERE nombre_pais = 'Holanda')),
('Borst Bloembollen', (SELECT id_pais FROM paises WHERE nombre_pais = 'Holanda'));

--INSERTS DE PRODUCTORES
INSERT INTO productores (nombre_prod, pagweb_prod, id_pais) VALUES 
('Dutch Flower Group', 'dutchflowergroup.com', (SELECT id_pais FROM paises WHERE nombre_pais = 'Holanda')),
('Flor Ecuador', 'florecuador.com', (SELECT id_pais FROM paises WHERE nombre_pais = 'Ecuador')),
('Kordes Roses', 'kordesroses.com', (SELECT id_pais FROM paises WHERE nombre_pais = 'Alemania'));

--INSERTS DE FLORISTERIAS

INSERT INTO floristerias (nombre_floristeria, pagweb_floristeria, telefono_floristeria, email_floristeria, id_pais) VALUES 
('Fleura Metz', 'fleura.com', '1234567890', 'info@fleura.com', (SELECT id_pais FROM paises WHERE nombre_pais = 'Estados Unidos')),
('Interflora', 'interflora.co.uk', '0987654321', 'contact@interflora.co.uk', (SELECT id_pais FROM paises WHERE nombre_pais = 'Inglaterra')),
('Floreria San Telmo', 'santelmo.com', '1122334455', 'info@santelmo.com', (SELECT id_pais FROM paises WHERE nombre_pais = 'Argentina')),
('Sunshine Bouquets', 'sunshinebouquets.com', '2233445566', 'info@sunshinebouquets.com', (SELECT id_pais FROM paises WHERE nombre_pais = 'Colombia')),
('Bouquet de Fleurs', 'bouquetdefleurs.mx', '3344556677', 'info@bouquetdefleurs.mx', (SELECT id_pais FROM paises WHERE nombre_pais = 'Mexico')),
('FloraQueen', 'floraqueen.com', '4455667788', 'info@floraqueen.com', (SELECT id_pais FROM paises WHERE nombre_pais = 'España'));

--INSERTS DE CONTRATOS

INSERT INTO contratos (id_sub, id_prod, fecha_contrato, clasificacion, porc_total_prod, cancelado, id_contrato_padre) VALUES
(3, 2, '2022-12-12', 'CC', 18.00, 'SI', NULL ), --Productor 2 con Subastador 3, cancelado
(1, 1, '2023-01-15', 'CB', 35.00, 'SI', NULL), -- Productor 1 con Subastador 1, cancelado
(2, 1, '2023-01-15', 'CA', 65.00, 'NO', NULL ), -- Productor 1 con Subastador 2, vencido
(2, 3, '2023-05-17', 'CG', 30.00, 'NO', NULL), -- Productor 3 que tiene contratos con v companias, vencido
(1, 3, '2023-12-29', 'CG', 15.00, 'NO', NULL), -- Productor 3 que tiene contratos con v companias, valido
(2, 1, '2024-01-15', 'CA', 60.00, 'NO', 3), -- Productor 1 con Subastador 2,  valido
(2, 2, '2024-01-16', 'KA', 100.00, 'NO', NULL), -- Productor 2 con Subastador 2, ofrece el 100% aca, valido
(3, 3, '2024-03-06', 'CG', 20.00, 'NO', NULL), -- Productor 3 que tiene contratos con v companias, valido
(2, 3, '2024-05-17', 'CG', 30.00, 'NO', 4) -- Productor 3 que tiene contratos con v companias, valido
;

--INSERTS DE PAGOS MULTAS REVISAR!!!!!!!

INSERT INTO pagos_multas (id_sub, id_prod, id_contrato, fecha_pago, monto_euros, tipo) VALUES
(3, 2, 1, '2022-12-12', 500.00, 'MEM'),
(1, 1, 2, '2023-01-15', 500.00, 'MEM'),
(2, 1, 3, '2023-01-15', 500.00, 'MEM' ),
(2, 3, 4, '2023-05-17', 500.00, 'MEM'),
(1, 3, 5, '2023-12-29', 500.00, 'MEM'),
(2, 1, 6, '2024-01-15', 500.00, 'MEM'),
(2, 2, 7, '2024-01-16', 500.00, 'MEM'),
(3, 3, 8, '2024-03-06', 500.00, 'MEM'),
(2, 3, 9, '2024-05-17', 500.00, 'MEM'),

--(1, 1, 2, '2023-02-05', , 'COM'),  -- Productor 1 (CB) paga 1% de 175.00
--(2, 1, 3, '2024-02-05', , 'COM'), -- Productor 1 (CA) paga 0.5% de 65.00
--(2, 2, 7, '2024-02-05', , 'COM'),  -- Productor 2 (KA) paga 0.25% de 100.00
--(3, 3, 8, '2024-04-05', , 'COM'),   -- Productor 3 (CG) paga 5% de 20.00

(3, 2, 1, '2023-01-10', 100.00, 'MUL'), -- Multa por pago tardío (20% de ventas)
(1, 1, 2, '2023-02-10', 40.00, 'MUL'),  -- Multa por no pagar a tiempo (20% de ventas)
(2, 1, 3, '2024-02-10', 12.00, 'MUL'),  -- Multa por no pagar a tiempo (20% de ventas)
(2, 3, 4, '2023-06-10', 100.00, 'MUL'); -- Multa por no pagar a tiempo (20% de ventas)
;


--INSERTS DE AFILIACIONES

INSERT INTO afiliacion (id_sub, id_floristeria) VALUES
(1, 1), --Subastadora 1 con Floristeria 1
(1, 3), --Subastadora 1  con Floristeria 3
(1, 5), --Subastadora 1 con Floristeria 5
(2, 2), --Subastadora 2 con Floristeria 2
(2, 4), --Subastadora 2 con Floristeria 4
(2, 6), --Subastadora 2 con Floristeria 6
(3, 1), --Subastadora 3 con Floristeria 1
(3, 2), --Subastadora 3 con Floristeria 2
(3, 3), --Subastadora 3 con Floristeria 3
(3, 4) --Subastadora 3 con Floristeria 4 
;

--INSERTS DE CONTACTOS EMPLEADOS

INSERT INTO contactos_empleados (id_floristeria, primer_nombre_rep, primer_apellido, seg_apellido, doc_id_rep, telef_rep) VALUES
(1, 'Juan', 'Pérez', 'Gómez', 1234567890, '001234567890'),  -- USA
(2, 'María', 'López', 'Martínez', 2345678901, '004412345678'),  -- Inglaterra
(3, 'Carlos', 'Fernández', 'Sánchez', 3456789012, '01123456789'),  -- Argentina
(4, 'Ana', 'García', 'Ramírez', 4567890123, '005712345678'),  -- Colombia
(5, 'Luis', 'Hernández', 'Díaz', 5678901234, '005212345678'),  -- México
(6, 'Laura', 'Jiménez', 'Cruz', 6789012345, '003491234567'),  -- España
(2, 'Pedro', 'Morales', 'Vásquez', 7890123456, '004412345679'),  -- Inglaterra
(4, 'Sofía', 'Rojas', 'Torres', 8901234567, '005712345679'),  -- Colombia
(6, 'Javier', 'Salinas', 'Paredes', 9012345678, '034912345679'),  -- España
(1, 'Isabel', 'Mendoza', 'López', 9876543210, '001234567891');  -- USA

--INSERTS DE ENLACES


--INSERTS DE CATALOGOS PRODUCTORES REVISAR!!!!!!!

INSERT INTO catalogos_productores (id_productor, vbn, nombre_propio, descripcion, id_flor, codigo_color) VALUES
(1, 101705, 'Velvet Rose', 'Productor especializado en rosas y claveles.', 1, 'c5388b'), -- Rosa (Rosa)
(1, 100603, 'Sunny', 'Productor especializado en rosas y claveles.', 2, 'c5388b'), -- Clavel (Rosa)
(1, 102210, 'Daring Delight', 'Productor especializado en flores exóticas.', 7, 'fbf500'), -- Freesia (Amarillo)


(2, 102603, 'Luna', 'Ofrece una variedad de hortensias.', 8, '0000ff'), -- Hortensia (Azul)
(2, 102004, 'Celestial Bloom', 'Famoso por sus lirios y tulipanes.', 3, 'ffffff'), -- Lirio (Blanco)
(2, 102205, 'Scarlet', 'Famoso por sus lirios y tulipanes.', 4, 'fbf500'), -- Tulipán (Amarillo)

(3, 102706, 'Berry Blush', 'Experto en girasoles y margaritas.', 5, 'ffa500'), -- Girasol (Naranja)
(3, 102412, 'Sunshine Sorbet', 'Experto en girasoles y margaritas.', 6, 'ffffff'), -- Margarita (Blanco)
(3, 101402, 'Mellow Yellow', 'Conocido por su crisantemo de calidad.', 9, '800080'); -- Crisantemo (Púrpura)

--INSERTS DE DETALLES CONTRATOS

--INSERTS DE FACTURAS SUBASTAS

INSERT INTO facturas_subastas (num_factura, fecha_emision, total, id_sub, id_floristeria, envio) VALUES
(20241016, '2024-03-15', 175.00, 3 , 1, 'SI'), --Factura Subastadora 3 a Floristeria 1
(20241017, '2024-04-01', 90.50, 1, 3, 'NO'), --Factura Subastadora 1 a Floristeria 3
(20241018, '2024-05-10', 120.00, 1, 5 , 'SI'), --Factura Subastadora 1 a Floristeria 5
(20241019, '2024-05-17', 65.25, 2, 2, 'NO'), --Factura Subastadora 2 a Floristeria 2
(20241020, '2024-06-01', 110.75, 3, 4 , 'SI'), --Factura Subastadora 3 a Floristeria 4

(20241021, '2024-06-03', 140.00, 1, 5, 'NO'), --Factura Subastadora 1 a Floristeria 5
(20241022, '2024-06-18', 85.00, 2, 2, 'SI'), --Factura Subastadora 2 a Floristeria 2
(20241023, '2024-06-27', 200.00, 1, 1 , 'NO'), --Factura Subastadora 1 a Floristeria 1
(20241024, '2024-06-29', 150.50, 3, 4 , 'SI'), --Factura Subastadora 3 a Floristeria 4
(20241025, '2024-07-02', 175.75, 3, 3, 'NO'), --Factura Subastadora 3 a Floristeria 3

(20241026, '2024-07-19', 90.00, 2, 6 , 'SI'), --Factura Subastadora 2 a Floristeria 6
(20241027, '2024-07-22', 130.25, 1, 1 , 'NO'), --Factura Subastadora 1 a Floristeria 1
(20241028, '2024-07-27', 220.00, 2, 4 , 'SI'), --Factura Subastadora 2 a Floristeria 4
(20241029, '2024-07-30', 140.50, 1, 3 , 'NO'), --Factura Subastadora 1 a Floristeria 3
(20241030, '2024-08-24', 75.75, 3, 2, 'SI'), --Factura Subastadora 3 a Floristeria 2

(20241031, '2024-08-25', 110.60, 3, 3, 'NO'), --Factura Subastadora 3 a Floristeria 3
(20241032, '2024-09-26', 160.80, 2, 4 , 'SI'), --Factura Subastadora 2 a Floristeria 4
(20241033, '2024-10-19', 95.00, 3, 2, 'NO'), --Factura Subastadora 3 a Floristeria 2
(20241034, '2024-11-30', 125.00, 2, 6, 'SI'), --Factura Subastadora 2 a Floristeria 6
(20241035, '2024-12-02', 180.25, 3, 1 , 'NO') --Factura Subastadora 3 a Floristeria 1
;

--INSERTS DE LOTES FLORES

--INSERTS DE CATALOGOS FLORISTERIAS

INSERT INTO catalogos_floristerias (id_floristeria, nombre, id_flor_corte, codigo_color) VALUES
(1, 'Arreglo Floral Tropical', 401, '008000'),  -- Verde
(1, 'Bouquet Primavera', 101, 'FF0000'),  -- Rojo
(2, 'Ramo de Rosas', 102, 'FFC0CB'),      -- Rosa
(3, 'Arreglo de Girasoles', 201, 'FFFF00'),  -- Amarillo
(3, 'Bouquet de Freesias', 502, '0000FF'),    -- Azul
(4, 'Centro de Mesa', 202, 'FFA500'),     -- Naranja
(4, 'Ramo de Hortensias', 402, 'E6E6FA'),     -- Lavanda
(5, 'Ramo de Lirios', 301, '800080'),     -- Púrpura
(5, 'Ramo de Claveles', 501, 'A52A2A'),      -- Marrón
(6, 'Bouquet de Margaritas', 302, 'FFFFFF'); -- Blanco

--INSERTS DE HISTORICOS PRECIOS 

--INSERTS DE BOUQUETS

