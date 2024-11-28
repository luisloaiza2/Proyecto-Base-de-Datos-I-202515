CREATE table flores_corte(
id_flor_corte integer PRIMARY KEY,
nombre_comun_flor VARCHAR(255) NOT NULL,
genero_especie_flor VARCHAR(255) NOT NULL,
etimologia_flor VARCHAR(255) NOT NULL,
temperatura_conservacion_flor_celsius real NOT NULL,
colores_flor VARCHAR(255) NOT NULL
);

CREATE table paises(
id_pais integer PRIMARY KEY,
nombre_pais VARCHAR(255) NOT NULL UNIQUE
);

CREATE table color(
codigo_color VARCHAR(6) PRIMARY KEY,
nombre_color VARCHAR(30) NOT NULL,
descripcion_color VARCHAR(255) NOT NULL
);

CREATE table significados(
id_significado integer PRIMARY KEY,
tipo_significado VARCHAR(12) NOT NULL CHECK(tipo_significado = 'ocasion' or tipo_significado = 'sentimiento'),
descripcion_significado VARCHAR(255) NOT NULL
);




