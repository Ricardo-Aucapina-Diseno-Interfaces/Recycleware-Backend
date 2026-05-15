
----------------------------------------------------------------------
----------------------Definición de tablas----------------------------
----------------------------------------------------------------------

-- Categorías
INSERT INTO categorias_producto (nombre) VALUES ('Periféricos');
INSERT INTO categorias_producto (nombre) VALUES ('Portátiles');
INSERT INTO categorias_producto (nombre) VALUES ('Sobremesa');
INSERT INTO categorias_producto (nombre) VALUES ('Componentes');
INSERT INTO categorias_producto (nombre) VALUES ('Monitores');

-- Estados de los productos físicos
INSERT INTO estados_producto (nombre) VALUES ('Excelente');
INSERT INTO estados_producto (nombre) VALUES ('Funcional');
INSERT INTO estados_producto (nombre) VALUES ('Dañado');
INSERT INTO estados_producto (nombre) VALUES ('Para Piezas');

-- Disponibilidad de producto
INSERT INTO disponibilidad_producto (nombre) VALUES ('Disponible');
INSERT INTO disponibilidad_producto (nombre) VALUES ('Reservado');

-- Estados de la gestión de solicitudes
INSERT INTO estados_solicitud (nombre) VALUES ('Pendiente');
INSERT INTO estados_solicitud (nombre) VALUES ('En Revisión');
INSERT INTO estados_solicitud (nombre) VALUES ('Aprobada');
INSERT INTO estados_solicitud (nombre) VALUES ('Denegada');
INSERT INTO estados_solicitud (nombre) VALUES ('Entregada');

-- Estados de donaciones
INSERT INTO estados_donacion (id, nombre) VALUES (1, 'Pendiente');
INSERT INTO estados_donacion (id, nombre) VALUES (2, 'En Recogida');
INSERT INTO estados_donacion (id, nombre) VALUES (3, 'Recibido');
INSERT INTO estados_donacion (id, nombre) VALUES (4, 'Procesado');

----------------------------------------------------------------------
--------------------------Datos iniciales para Recycleware------------
----------------------------------------------------------------------


-- Usuarios de prueba (contraseña: 1234 para todos los usuarios (hasheada))
INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, rol, estado)
VALUES ('Admin', '12345678X', '600111222', 'admin@recycleware.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle Falsa 123', 'Alicante', '03001', 'ADMIN', 'ACTIVO');

INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, rol, estado)
VALUES ('Bela', '12345645X', '600111222', 'bela@particular.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle Balmis 45', 'Alicante', '03001', 'PARTICULAR', 'ACTIVO');

INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, razon_social, nombre_contacto, rol, estado)
VALUES ('Empresa Bela', '72345635X', '600111222', 'bela@empresa.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle empresa 10', 'Alicante', '03001', 'Empresa de Bela', 'Ree', 'EMPRESA', 'PENDIENTE');

INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, rol, estado)
VALUES ('Bela', '19345675X', '600111222', 'bela@admin.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle Balmis 45', 'Alicante', '03001', 'ADMIN', 'ACTIVO');


-- Datos Usuario Finales

--Bela
INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, razon_social, nombre_contacto, rol, estado)
VALUES ('Bela Emp', '12345222X', '600111223', 'bela.emp@empresa.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle empresa 10', 'Alicante', '03001', 'BelaWare SL', 'Bela Sim', 'EMPRESA', 'ACTIVO');

--Luis
INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, rol, estado)
VALUES ('Luis Part', '124445645X', '600111222', 'luis.part@particular.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle Balmis 45', 'Alicante', '03001', 'PARTICULAR', 'INACTIVO');

INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, razon_social, nombre_contacto, rol, estado)
VALUES ('Gines Emp', '12112222X', '600111223', 'Gines.emp@empresa.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle empresa 10', 'Alicante', '03001', 'Gines SL', 'Luis Ginés', 'EMPRESA', 'ACTIVO');

--Ricardo
INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, rol, estado)
VALUES ('Ricardo Part', '12345678A', '600111222', 'ricardo.part@particular.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle Balmis 45', 'Alicante', '03001', 'PARTICULAR', 'ACTIVO');

INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, razon_social, nombre_contacto, rol, estado)
VALUES ('Ricardo Emp', '12345222F', '600111223', 'ricardo.emp@empresa.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle empresa 10', 'Alicante', '03001', 'Piolaware SL', 'Ricardo', 'EMPRESA', 'PENDIENTE');

--Aaron
INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, rol, estado)
VALUES ('Aaron Part', '12348765J', '600111222', 'aaron.part@particular.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle Balmis 45', 'Alicante', '03001', 'PARTICULAR', 'ACTIVO');

INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, razon_social, nombre_contacto, rol, estado)
VALUES ('Aaron Emp', '43345909X', '600111223', 'aaron.emp@empresa.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle empresa 10', 'Alicante', '03001', 'Aaronsoft SL', 'Aaron', 'EMPRESA', 'ACTIVO');

-- Empresas extra

INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, razon_social, nombre_contacto, rol, estado)
VALUES ('SoftAlacant', '43345902E', '600111223', 'soft.alacant@empresa.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle empresa 10', 'Alicante', '03001', 'SoftAlacant SL', 'Alfonso C', 'EMPRESA', 'INACTIVO');

INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, razon_social, nombre_contacto, rol, estado)
VALUES ('Doctorbalmis', '43445905S', '600222223', 'balmis@empresa.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle empresa 10', 'Alicante', '03001', 'IES Doctorbalmis', 'Javier Catalá', 'EMPRESA', 'ACTIVO');






------------------------------------------------------
-- Productos------------------------------------------
------------------------------------------------------
    
    -- Periféricos
INSERT INTO productos(nombre, id_categoria, id_estado, id_disponibilidad, descripcion, imagen_url)
VALUES ('Ratón Mars', 1, 2, 1, 'Ratón gastado con dos botones laterales y boton de cambio de DPI', '/api/images/6');

INSERT INTO productos(nombre, id_categoria, id_estado, id_disponibilidad, descripcion, imagen_url)
VALUES ('Ratón inalambrico Logitec', 1, 2, 1, 'Ratón inalambrico con usb independiente con 2 botones laterales y poco rango de conexión', '/api/images/5');

    
    -- Sobremesa
INSERT INTO productos(nombre, id_categoria, id_estado, id_disponibilidad, descripcion, imagen_url)
VALUES ('Torre Artec netanya', 3, 1, 1, 'Core I5 8RAM 1TB hhd y lector de Dvd', '/api/images/0');

    
    -- Componentes
INSERT INTO productos(nombre, id_categoria, id_estado, id_disponibilidad, descripcion, imagen_url)
VALUES ('Procesador Intel i7-6700K', 4, 1, 2, 'Procesador con apenas uso', '/api/images/7');

INSERT INTO productos(nombre, id_categoria, id_estado, id_disponibilidad, descripcion, imagen_url)
VALUES ('GPU Sapphire Radeon HD 5570', 4, 2, 1, 'Tarjeta gráfica con varios años de uso pero todavía funcional ni indicios de estropearse', '/api/images/7');

    
    -- Monitores
INSERT INTO productos(nombre, id_categoria, id_estado, id_disponibilidad, descripcion, imagen_url)
VALUES ('Monitor Dell P2212', 5, 1, 1, 'Monitor Dell de una oficinia que pese al uso esta en buen estado todavía', '/api/images/2');

INSERT INTO productos(nombre, id_categoria, id_estado, id_disponibilidad, descripcion, imagen_url)
VALUES ('Monitor VSDISPLAY LCD', 5, 3, 1, 'Monitor con 3 franjas verticales negras pero todavia funcional', '/api/images/1');

    
    -- Portatiles
INSERT INTO productos(nombre, id_categoria, id_estado, id_disponibilidad, descripcion, imagen_url)
VALUES ('Dell Inspiron', 2, 3, 1, '8Gb Ram 120Gb Hdd. Pantalla dañada por un golpe pero el resto del dispositivo funciona correctamente', '/api/images/3');

INSERT INTO productos(nombre, id_categoria, id_estado, id_disponibilidad, descripcion, imagen_url)
VALUES ('Lenovo G500s', 2, 1, 1, '8Gb Ram 320Gb Hdd y webcam integrada', '/api/images/4');



-- Donaciones de prueba

INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (1, 1, 5, 'Lote de monitores antiguos', 15.5);
INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (3, 2, 2, 'Servidor de rack para desguace', 40.0);
INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (1, 3, 10, 'Caja con teclados y ratones varios', 5.0);
INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (null, 3, 10, 'Caja con teclados y ratones varios', 5.0);

-- Donación para el usuario 2 (Recycleware SL - Rol: EMPRESA)
INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (2, 3, 50, 'Donación de prueba Empresa A', 10.0);

-- Donación para el usuario 5 (Bela - Rol: EMPRESA)
INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (5, 3, 30, 'Donación de prueba Empresa B', 5.0);

-- Donacoipnes finales

-- Bela recibidas
INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (2, 3, 50, 'Donación de sets de ordenador con torres, ratones, teclados y monitores', 70.0);

INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (2, 3, 10, 'Donación de monitores', 20.0);

INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (2, 3, 5, 'Donación de portatiles', 10.0);

-- Luis 
INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (4, 3, 20, 'Donación de diversos componentes y periféricos', 25.0);


INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (4, 2, 50, 'Donación de sets de ratones y teclados', 10.0);


INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (4, 1, 35, 'Donación de 3 torres', 25.0);


-- Ricardo 
INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (6, 3, 65, 'Donación de diversos componentes y periféricos', 25.0);


INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (6, 2, 50, 'Donación de sets de ratones y teclados', 10.0);


INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (6, 1, 35, 'Donación de torres', 25.0);


-- Aaron
INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (8, 3, 40, 'Donación de diversos componentes y periféricos', 25.0);


INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (8, 2, 50, 'Donación de sets de ratones y teclados', 10.0);


INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (8, 1, 35, 'Donación de torres', 25.0);

-- Donaciones varias

INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (9, 3, 50, 'Donación variada', 70.0);

INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (9, 3, 10, 'Donación de monitores', 20.0);

INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (10, 3, 5, 'Donación de portatiles', 10.0);

INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (10, 3, 35, 'Donación de 3 torres', 25.0);

------------------------------------------------------
-- Solicitudes de productos --------------------------
------------------------------------------------------

---- 1. El usuario 'Particular' (ID 3) solicita un Monitor Dell (ID 7)
---- Estado: 1 (Pendiente)
--INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
--VALUES (4, 7, 'Necesito un monitor para que mi hijo pueda realizar sus tareas escolares en casa, ya que el nuestro se rompió.', 1);
--
---- 2. El usuario 'Bela' (ID 4) solicita el Portatil HP (ID 9)
---- Estado: 2 (En Revisión)
--INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
--VALUES (4, 9, 'Estoy realizando un curso de formación online y requiero un equipo portátil para poder seguir las clases y entregar los proyectos.', 2);
--
---- 3. El usuario 'Particular' (ID 3) solicita el Ratón Acer (ID 1)
---- Estado: 3 (Aprobada)
--INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
--VALUES (4, 1, 'Mi ratón actual ha dejado de funcionar y no tengo recursos para adquirir uno nuevo en este momento.', 3);
--
---- 4. El usuario 'Bela' (ID 4) solicita la Torre PCGAM Slim (ID 3)
---- Estado: 4 (Denegada)
--INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
--VALUES (4, 3, 'Solicito este equipo para montar un servidor doméstico de pruebas.', 4);
--
---- 5. El usuario 'Particular' (ID 3) solicita el Altavoz MiFa (ID 2)
---- Estado: 5 (Entregada)
--INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
--VALUES (4, 2, 'Necesito un dispositivo de audio para mis clases de idiomas online.', 5);



-- SOlicitudes finales

INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
VALUES (1, 6, 'Necesito un monitor para que mi hijo pueda realizar sus tareas escolares en casa, ya que el nuestro se rompió.', 1);


INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
VALUES (3, 3, 'Solicito este equipo para montar un servidor doméstico de pruebas.', 4);

INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
VALUES (5, 1, 'Mi ratón actual ha dejado de funcionar y no tengo recursos para adquirir uno nuevo en este momento.', 3);

INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
VALUES (7, 8, 'Necesito un portatil para estudiar online el modulo semipresencial.', 5);

------------------------------------------------------
-- Más Solicitudes para el Usuario ID 4 (Bela) -------
------------------------------------------------------

---- 1. Solicita el Monitor VSDISPLAY (ID 8)
---- Estado: 1 (Pendiente)
--INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
--VALUES (4, 8, 'Necesito un segundo monitor para mejorar mi productividad mientras estudio programación.', 1);
--
---- 2. Solicita el Procesador AMD Ryzen (ID 5)
---- Estado: 2 (En Revisión)
--INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
--VALUES (4, 5, 'Mi procesador actual falla constantemente y necesito este componente para reparar mi equipo principal.', 2);
--
---- 3. Solicita el Portatil HP 255 G5 (ID 10)
---- Estado: 3 (Aprobada)
--INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
--VALUES (4, 10, 'Requiero un equipo con más memoria RAM para poder ejecutar máquinas virtuales de mis prácticas.', 3);
--
---- 4. Solicita la Fuente de alimentación Tempest (ID 6)
---- Estado: 5 (Entregada)
--INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
--VALUES (4, 6, 'La fuente de mi ordenador se quemó tras una subida de tensión y necesito esta de sustitución.', 5);
--
---- 5. Solicita la Torre dañada Nox (ID 4)
---- Estado: 4 (Denegada)
--INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado)
--VALUES (4, 4, 'Me gustaría obtener esta torre para practicar soldadura y reparación de placas base.', 4);


------------------------------------------------------
-- Usuarios y Comentarios para mostrar en la parte de comunidad (Ricardo) -------
------------------------------------------------------

-- USUARIOS FICTICIOS (6 PARTICULARES / BENEFICIARIOS)

INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, rol, estado) VALUES
     ('Carlos Martínez', '11111111A', '600111222', 'carlos@mail.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle Mayor 12, 3B', 'Alicante', '03002', 'PARTICULAR', 'ACTIVO'),
     ('Laura Gómez', '22222222B', '600222333', 'laura@mail.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Avenida Libertad 45', 'San Vicente del Raspeig', '03690', 'PARTICULAR', 'ACTIVO'),
     ('Ahmed Ruiz', '33333333C', '600333444', 'ahmed@mail.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Plaza de los Luceros 1', 'Alicante', '03001', 'PARTICULAR', 'ACTIVO'),
     ('Sofía Navarro', '44444444D', '600444555', 'sofia@mail.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle del Sol 8', 'Mutxamel', '03110', 'PARTICULAR', 'ACTIVO'),
     ('David López', '55555555E', '600555666', 'david@mail.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Avenida Costa Blanca 120', 'San Juan Playa', '03540', 'PARTICULAR', 'ACTIVO'),
     ('Elena Torres', '66666666F', '600666777', 'elena@mail.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle San Fernando 33', 'Alicante', '03005', 'PARTICULAR', 'ACTIVO');

-- USUARIOS FICTICIOS (6 EMPRESAS / DONANTES)
INSERT INTO usuarios (nombre, dni, telefono, correo, contrasenia, direccion, localidad, codigo_postal, razon_social, nombre_contacto, rol, estado) VALUES
     ('TechCorp Solutions', 'B11111111', '965111222', 'info@techcorp.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Parque Tecnológico, Nave 4', 'Alicante', '03008', 'TechCorp Iberia S.L.', 'Marcos Soler', 'EMPRESA', 'ACTIVO'),
     ('InnovaTech Alicante', 'B22222222', '965222333', 'donaciones@innovatech.es', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Polígono Canastell, C/ Industria', 'San Vicente del Raspeig', '03690', 'Innovación Tecnológica S.A.', 'Sara Méndez', 'EMPRESA', 'ACTIVO'),
     ('Global Logistics', 'B33333333', '965333444', 'sostenibilidad@global.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Avenida de Elche 150', 'Alicante', '03008', 'Global Logistics España', 'Javier Ramos', 'EMPRESA', 'ACTIVO'),
     ('EcoSoft Dev', 'B44444444', '965444555', 'rrhh@ecosoft.com', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle Innovación 2', 'Mutxamel', '03110', 'EcoSoft Development S.L.', 'Ana Pastor', 'EMPRESA', 'ACTIVO'),
     ('Agencia Creativa', 'B55555555', '965555666', 'hola@agenciacreativa.es', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Calle San Rafael 4', 'San Juan Pueblo', '03550', 'Estudio Creativo S.A.', 'Pedro Giménez', 'EMPRESA', 'ACTIVO'),
     ('Consultoría IT', 'B66666666', '965666777', 'admin@consultoriait.es', '$2a$10$ayw3FCBIkupFt5n9lrmJQe9XZMJhZiNCjaoOkXo/Ba0KZgymO01ce', 'Avenida Maisonnave 28, Entresuelo', 'Alicante', '03003', 'Consultores Informáticos S.L.', 'Lucía Vidal', 'EMPRESA', 'ACTIVO');

-- RESEÑAS DE LA COMUNIDAD (12 RESEÑAS)

INSERT INTO resenas (texto, autor, rol, estrellas, activa) VALUES
    ('Renovamos la oficina y donar los equipos antiguos fue un proceso rápido y transparente. Nos enorgullece saber que tendrán una segunda vida útil.', 'TechCorp Solutions', 'EMPRESA', 5, TRUE),
    ('Gracias a RecycleWare conseguí un portátil para que mi hijo pudiera hacer los deberes del instituto. Ha sido una gran ayuda para nuestra familia.', 'Carlos M.', 'PARTICULAR', 5, TRUE),
    ('Excelente plataforma. Nos emitieron el certificado de donación sin problemas y vinieron a recoger los monitores puntualmente.', 'InnovaTech Alicante', 'EMPRESA', 5, TRUE),
    ('Llevaba meses ahorrando para un ordenador de sobremesa para estudiar programación. El equipo funciona de maravilla, ¡muchísimas gracias!', 'Laura G.', 'PARTICULAR', 5, TRUE),
    ('Teníamos 5 ordenadores cogiendo polvo en el almacén. Saber que ahora los están usando familias que lo necesitan es una satisfacción enorme.', 'Agencia Creativa', 'EMPRESA', 5, TRUE),
    ('El monitor que recibí está en perfecto estado. Me ha facilitado mucho el teletrabajo. Una iniciativa increíble.', 'Ahmed R.', 'PARTICULAR', 4, TRUE),
    ('Me donaron componentes para arreglar mi viejo ordenador y ahora vuela. El proceso de solicitud fue súper rápido y transparente.', 'Sofía N.', 'PARTICULAR', 5, TRUE),
    ('Como empresa de logística, la sostenibilidad es clave. RecycleWare nos ayudó a deshacernos de nuestra basura electrónica de forma responsable.', 'Global Logistics', 'EMPRESA', 4, TRUE),
    ('Poder acceder a esta tecnología me ha abierto puertas para seguir formándome online. Eternamente agradecido al equipo y a los donantes.', 'David L.', 'PARTICULAR', 5, TRUE),
    ('Súper sencillo. Subimos el lote de portátiles a la plataforma y en menos de una semana ya estaban asignados a estudiantes locales.', 'EcoSoft Dev', 'EMPRESA', 5, TRUE),
    ('El trato de los voluntarios fue excepcional. Me explicaron cómo instalar todo y el ordenador va perfecto. 100% recomendable.', 'Elena T.', 'PARTICULAR', 4, TRUE),
    ('Nos guiaron en el proceso de borrado seguro de datos antes de entregar los discos duros. Muy profesionales y una gran labor social.', 'Consultoría IT', 'EMPRESA', 5, TRUE);

INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (11, 3, 6, 'Donación de mouse', 1.0);

INSERT INTO donaciones (id_donante, id_estado, cantidad_productos, descripcion, peso)
VALUES (5, 3, 8, 'Donación de teclados', 1.0);

-- 6 Solicitudes extras con estado ENTREGADA (ID 5) para subir el contador de la Home
INSERT INTO solicitudes (id_solicitante, id_producto, motivo, id_estado) VALUES
    (11, 1, 'Necesito renovar mi ratón para clases de ofimática.', 5),
    (12, 2, 'Mi ratón actual falla mucho y no puedo permitirme uno nuevo.', 5),
    (13, 3, 'Para mis estudios de administración, este PC me vendría genial.', 5),
    (14, 5, 'Necesito ampliar mi equipo actual para poder hacer los trabajos de clase.', 5),
    (15, 6, 'Para poder estudiar mejor, un segundo monitor me ayudaría muchísimo.', 5),
    (16, 8, 'Mi portátil se rompió y ahora mismo no puedo comprar otro para seguir el curso.', 5);
