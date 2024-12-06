CREATE TABLE paises(	
	 id_pais SMALLINT DEFAULT nextval('seq_paises') CONSTRAINT pk_pais PRIMARY KEY,
 	 nombre_pais VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE flores_corte(
	id_flor_corte SMALLINT DEFAULT nextval('seq_flores_corte') CONSTRAINT pk_florcorte PRIMARY KEY,
	nombre_comun VARCHAR(40) NOT NULL UNIQUE,
	genero_especie VARCHAR(40) NOT NULL UNIQUE,
	etimologia VARCHAR(200) NOT NULL,
	tem_conservacion NUMERIC(4,2) NOT NULL,
	colores VARCHAR(200) NOT NULL
);

CREATE TABLE colores(
	codigo_color VARCHAR(6) CONSTRAINT pk_colores PRIMARY KEY,
	nombre VARCHAR(15) NOT NULL UNIQUE,
	descripcion VARCHAR(300) NOT NULL
);

CREATE TABLE significados(
	id_significado SMALLINT DEFAULT nextval('seq_significados') CONSTRAINT pk_significados PRIMARY KEY,
	tipo VARCHAR(4) NOT NULL,
	descripcion VARCHAR(300) NOT NULL,
	CONSTRAINT check_tipo CHECK(tipo in('ocas','sent'))
);

CREATE TABLE subastadoras(
	id_sub SMALLINT DEFAULT nextval('seq_subastadoras') CONSTRAINT pk_subastadoras PRIMARY KEY,
	nombre_sub VARCHAR(40) NOT NULL,
	id_pais SMALLINT NOT NULL
);

CREATE TABLE productores(
	id_prod SMALLINT DEFAULT nextval('seq_productores') CONSTRAINT pk_productores PRIMARY KEY,
	nombre_prod VARCHAR(40) NOT NULL UNIQUE,
	pagweb_prod VARCHAR(40) NOT NULL UNIQUE,
	id_pais SMALLINT NOT NULL
);

CREATE TABLE floristerias(
	id_floristeria SMALLINT DEFAULT nextval('seq_floristerias') CONSTRAINT pk_floristerias PRIMARY KEY,
	nombre_floristeria VARCHAR(40) NOT NULL UNIQUE,
	pagweb_floristeria VARCHAR(40) NOT NULL UNIQUE,
	telefono_floristeria VARCHAR(15) NOT NULL UNIQUE,
	email_floristeria VARCHAR(40) NOT NULL UNIQUE,
	id_pais SMALLINT NOT NULL
);

CREATE TABLE contratos(
	id_sub SMALLINT NOT NULL,
	id_prod SMALLINT NOT NULL,
	id_contrato SMALLINT DEFAULT nextval('seq_contratos') NOT NULL UNIQUE,
	fecha_contrato DATE NOT NULL,
	clasificacion VARCHAR(2) NOT NULL,
	porc_total_prod NUMERIC(5,2) NOT NULL,
	cancelado VARCHAR(2),
	id_contrato_padre SMALLINT references contratos(id_contrato),
	CONSTRAINT check_clasificacion CHECK (clasificacion in('CA','CB','CC','CG','KA')),
	CONSTRAINT check_cancelado CHECK (cancelado in ('SI','NO')),
	CONSTRAINT pk_contratos PRIMARY KEY (id_sub,id_prod,id_contrato),
	CONSTRAINT check_porcentaje CHECK (porc_total_prod>0 AND porc_total_prod<=100)
);

CREATE TABLE pagos_multas(
	id_sub SMALLINT NOT NULL,
	id_prod SMALLINT NOT NULL,
	id_contrato SMALLINT NOT NULL,
	id_pagos SMALLINT DEFAULT nextval('seq_pagos') NOT NULL,
	fecha_pago DATE NOT NULL,
	monto_euros FLOAT NOT NULL,
	tipo VARCHAR(3) NOT NULL,
	CONSTRAINT check_pagos CHECK(tipo in('MEM','MUL','COM')),
	CONSTRAINT pk_pagos PRIMARY KEY (id_sub,id_prod,id_contrato,id_pagos),
	CONSTRAINT check_monto CHECK(monto_euros>0)
);

CREATE TABLE afiliacion(
	id_sub SMALLINT NOT NULL,
	id_floristeria SMALLINT NOT NULL,
	CONSTRAINT pk_afiliacion PRIMARY KEY(id_sub, id_floristeria)
);

CREATE TABLE contactos_empleados(
	id_floristeria SMALLINT NOT NULL,
	id_representante SMALLINT DEFAULT nextval('seq_contactos_emp') NOT NULL,
	primer_nombre_rep VARCHAR(15) NOT NULL,
	primer_apellido VARCHAR(20) NOT NULL,
	seg_apellido VARCHAR(20) NOT NULL,
	doc_id_rep NUMERIC(10) NOT NULL UNIQUE,
	telef_rep VARCHAR(15) NOT NULL UNIQUE,
	CONSTRAINT pk_contacto_emp PRIMARY KEY (id_floristeria, id_representante)
);

CREATE TABLE enlaces(
	id_significado SMALLINT NOT NULL,
	id_enlace SMALLINT DEFAULT nextval('seq_enlace') NOT NULL,
	descripcion VARCHAR(300),
	id_flor_corte SMALLINT,
	codigo_color VARCHAR(6),
	CONSTRAINT pk_enlace PRIMARY KEY (id_significado, id_enlace)
);

CREATE TABLE catalogos_productores(
	id_productor SMALLINT NOT NULL,
	vbn SMALLINT DEFAULT nextval('seq_catalogoprod') NOT NULL,
	nombre_propio VARCHAR(40) NOT NULL UNIQUE,
	descripcion VARCHAR(300) NOT NULL,
	id_flor SMALLINT NOT NULL,
	codigo_color VARCHAR(6) NOT NULL,
	CONSTRAINT pk_catalogo_prod PRIMARY KEY (id_productor, vbn)
);

CREATE TABLE det_contratos( 
	id_sub SMALLINT NOT NULL,
	id_prod SMALLINT NOT NULL,
	id_contrato SMALLINT NOT NULL,
	vbn SMALLINT NOT NULL,
	CONSTRAINT pk_det_contratos PRIMARY KEY (id_sub,id_prod,id_contrato,vbn)
);

CREATE TABLE facturas_subastas(
	num_factura NUMERIC(12) CONSTRAINT pk_facturasub PRIMARY KEY,
	fecha_emision DATE NOT NULL,
	total FLOAT NOT NULL,
	id_sub SMALLINT NOT NULL,
	id_floristeria SMALLINT NOT NULL,
	envio VARCHAR(2),
	CONSTRAINT check_envio CHECK (envio in('SI','NO')),
	CONSTRAINT check_total_factura CHECK (total>0)
);

CREATE TABLE lotes_flor( 
	id_lote SMALLINT DEFAULT nextval('seq_lotes') CONSTRAINT pk_lote PRIMARY KEY,
	cantidad NUMERIC(3) NOT NULL,
	precio_inicial NUMERIC(6,2) NOT NULL,
	BI NUMERIC(3,2) NOT NULL,
	precio_final FLOAT NOT NULL,
	id_sub SMALLINT NOT NULL,
	id_prod SMALLINT NOT NULL,
	id_contrato SMALLINT NOT NULL,
	vbn SMALLINT NOT NULL,
	num_factura NUMERIC(12) NOT NULL,
	CONSTRAINT check_bi CHECK(BI >= 0.5 AND BI <=1),
	CONSTRAINT check_precio_inicial CHECK(precio_inicial>0),
	CONSTRAINT check_precio_final CHECK(precio_final>0)
);

CREATE TABLE catalogos_floristerias(
	id_floristeria SMALLINT NOT NULL,
	id_catalogo SMALLINT DEFAULT nextval('seq_catalogofloristeria') NOT NULL,
	nombre VARCHAR(40) NOT NULL UNIQUE,
	id_flor_corte SMALLINT NOT NULL,
	codigo_color VARCHAR(6) NOT NULL,
	CONSTRAINT pk_catalogo_floristeria PRIMARY KEY (id_floristeria, id_catalogo)
);

CREATE TABLE historicos_precio(
	id_floristeria SMALLINT NOT NULL,
	id_catalogo SMALLINT NOT NULL,
	fecha_inicio DATE NOT NULL,
	precio_unitario NUMERIC(5,2) NOT NULL,
	tamano_tallo NUMERIC(5,2),
	fecha_final DATE,
	CONSTRAINT pk_historico_precio PRIMARY KEY (id_floristeria,id_catalogo,fecha_inicio),
	CONSTRAINT check_precio_unitario_flor CHECK(precio_unitario>0),
	CONSTRAINT check_tamano_tallo CHECK(tamano_tallo>0)
);

CREATE TABLE bouquets(
	id_floristeria SMALLINT NOT NULL,
	id_catalogo SMALLINT NOT NULL,
	id_bouquet SMALLINT DEFAULT nextval('seq_bouquet') NOT NULL,
	cantidad NUMERIC(3) NOT NULL,
	descripcion VARCHAR(300),
	tamano_tallo NUMERIC(5,2),
	CONSTRAINT pk_bouquet PRIMARY KEY (id_floristeria, id_catalogo, id_bouquet),
	CONSTRAINT check_tamano_tallo CHECK(tamano_tallo>0),
	CONSTRAINT check_cantidad CHECK (cantidad>0)
);
