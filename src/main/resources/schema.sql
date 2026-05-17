-- Estructura de la base de datos Recycleware
DROP TABLE IF EXISTS mensajes_contacto;
DROP TABLE IF EXISTS solicitudes;
DROP TABLE IF EXISTS donaciones;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS estados_solicitud;
DROP TABLE IF EXISTS estados_producto;
DROP TABLE IF EXISTS disponibilidad_producto;
DROP TABLE IF EXISTS estados_donacion;
DROP TABLE IF EXISTS categorias_producto;
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
    id              INT         NOT NULL AUTO_INCREMENT,
    nombre          VARCHAR(80) NOT NULL,
    dni             VARCHAR(9)  NOT NULL UNIQUE,
    telefono        VARCHAR(15) NOT NULL,
    correo          VARCHAR(80) NOT NULL UNIQUE,
    contrasenia     VARCHAR(80) NOT NULL,
    direccion       VARCHAR(80) NOT NULL,
    localidad       VARCHAR(80) NOT NULL,
    codigo_postal   VARCHAR(10) NOT NULL,
    razon_social    VARCHAR(80) DEFAULT NULL,
    nombre_contacto VARCHAR(80) DEFAULT NULL,
    rol             VARCHAR(20) NOT NULL DEFAULT 'PARTICULAR',
    estado          VARCHAR(20) NOT NULL DEFAULT 'PENDIENTE',
    PRIMARY KEY (id)
);

CREATE TABLE categorias_producto (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE estados_producto (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE disponibilidad_producto (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE estados_solicitud (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
);



CREATE TABLE productos (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    id_estado INT NOT NULL,
    id_disponibilidad INT NOT NULL,
    descripcion TEXT NOT NULL,
    imagen_url VARCHAR(500) NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES categorias_producto(id),
    FOREIGN KEY (id_estado) REFERENCES estados_producto(id),
    FOREIGN KEY (id_disponibilidad) REFERENCES disponibilidad_producto(id)
);

CREATE TABLE estados_donacion (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE donaciones (
    id INT NOT NULL AUTO_INCREMENT,
    id_donante INT,
    id_estado INT NOT NULL DEFAULT 1,
    fecha_donacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cantidad_productos INT DEFAULT 1,
    descripcion TEXT NOT NULL,
    peso FLOAT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_donante) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (id_estado) REFERENCES estados_donacion(id)
);

CREATE TABLE solicitudes (
    id INT NOT NULL AUTO_INCREMENT,
    id_solicitante INT NOT NULL,
    id_producto INT NOT NULL,
    motivo TEXT NOT NULL,
    id_estado INT NOT NULL DEFAULT 1,
    fecha_solicitud TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (id_solicitante) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES productos(id),
    FOREIGN KEY (id_estado) REFERENCES estados_solicitud(id)
);

CREATE TABLE mensajes_contacto (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    mensaje TEXT NOT NULL,
    id_usuario INT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE resenas (
    id INT NOT NULL AUTO_INCREMENT,
    texto TEXT NOT NULL,
    autor VARCHAR(80) NOT NULL,
    rol VARCHAR(45) NOT NULL,
    estrellas INT DEFAULT 5,
    activa BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id)
);