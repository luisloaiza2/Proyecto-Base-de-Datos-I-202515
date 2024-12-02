ALTER TABLE subastadoras
	ADD CONSTRAINT fk_pais FOREIGN KEY(id_pais) REFERENCES paises(id_pais);

ALTER TABLE productores
	ADD CONSTRAINT fk_pais FOREIGN KEY(id_pais) REFERENCES paises(id_pais);

ALTER TABLE floristerias
	ADD CONSTRAINT fk_pais FOREIGN KEY(id_pais) REFERENCES paises(id_pais);

ALTER TABLE contratos
	ADD CONSTRAINT fk_sub FOREIGN KEY (id_sub) REFERENCES subastadoras(id_sub),
	ADD CONSTRAINT fk_prod FOREIGN KEY (id_prod) REFERENCES productores(id_prod);

ALTER TABLE pagos_multas
	ADD CONSTRAINT fk_contratos FOREIGN KEY (id_sub,id_prod,id_contrato) REFERENCES contratos(id_sub,id_prod,id_contrato);

ALTER TABLE afiliacion
	ADD CONSTRAINT fk_sub FOREIGN KEY (id_sub) REFERENCES subastadoras(id_sub),
	ADD CONSTRAINT fk_floristeria FOREIGN KEY(id_floristeria) REFERENCES floristerias(id_floristeria);

ALTER TABLE contactos_empleados 
	ADD CONSTRAINT fk_floristeria FOREIGN KEY (id_floristeria) REFERENCES floristerias(id_floristeria);

ALTER TABLE enlaces
	ADD CONSTRAINT fk_significado FOREIGN KEY (id_significado) REFERENCES significados(id_significado),
	ADD CONSTRAINT fk_flor_corte FOREIGN KEY (id_flor_corte) REFERENCES flores_corte(id_flor_corte),
	ADD CONSTRAINT fk_codigo_color FOREIGN KEY (codigo_color) REFERENCES colores(codigo_color);

ALTER TABLE catalogos_productores 
	ADD CONSTRAINT fk_productor FOREIGN KEY (id_productor) REFERENCES productores(id_prod),
	ADD CONSTRAINT fk_flor FOREIGN KEY (id_flor) REFERENCES flores_corte (id_flor_corte),
	ADD CONSTRAINT fk_color FOREIGN KEY (codigo_color) REFERENCES colores (codigo_color);

ALTER TABLE det_contratos
	ADD CONSTRAINT fk_contrato FOREIGN KEY (id_sub, id_prod, id_contrato) REFERENCES contratos(id_sub,id_prod,id_contrato),
	ADD CONSTRAINT fk_cat_prod FOREIGN KEY (id_prod, vbn) REFERENCES catalogos_productores(id_productor, vbn);	

ALTER TABLE facturas_subastas
	ADD CONSTRAINT fk_afiliacion FOREIGN KEY (id_sub, id_floristeria) REFERENCES afiliacion(id_sub, id_floristeria);

ALTER TABLE lotes_flor
	ADD CONSTRAINT fk_detcontrato FOREIGN KEY(id_sub,id_prod,id_contrato,vbn) REFERENCES det_contratos(id_sub,id_prod,id_contrato,vbn),
	ADD CONSTRAINT fk_facturasubasta FOREIGN KEY(num_factura) REFERENCES facturas_subastas(num_factura);

ALTER TABLE catalogos_floristerias
	ADD CONSTRAINT fk_floristeria FOREIGN KEY(id_floristeria) REFERENCES floristerias(id_floristeria),
	ADD CONSTRAINT fk_florcorte FOREIGN KEY(id_flor_corte) REFERENCES flores_corte(id_flor_corte),
	ADD CONSTRAINT fk_color FOREIGN KEY(codigo_color) REFERENCES colores(codigo_color);

ALTER TABLE historicos_precio
	ADD CONSTRAINT fk_catalogo_floristeria FOREIGN KEY (id_floristeria, id_catalogo) REFERENCES catalogos_floristerias(id_floristeria,id_catalogo);

ALTER TABLE bouquets
	ADD CONSTRAINT fk_catalogo FOREIGN KEY (id_floristeria, id_catalogo) REFERENCES catalogos_floristerias(id_floristeria,id_catalogo);