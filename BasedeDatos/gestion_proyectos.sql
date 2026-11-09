CREATE DATABASE gestion_proyectos;
USE gestion_proyectos;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(100) NOT NULL,
    rol VARCHAR(30) NOT NULL
);CREATE TABLE proyecto (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    estado VARCHAR(30) NOT NULL
);CREATE TABLE tarea (
    id_tarea INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    prioridad VARCHAR(20),
    estado VARCHAR(30),
    fecha_inicio DATE,
    fecha_entrega DATE,
    id_usuario INT,
    id_proyecto INT,

    CONSTRAINT fk_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario),

    CONSTRAINT fk_proyecto
        FOREIGN KEY (id_proyecto)
        REFERENCES proyecto(id_proyecto)
);CREATE TABLE incidencia (
    id_incidencia INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT NOT NULL,
    prioridad VARCHAR(20),
    estado VARCHAR(30),
    fecha_registro DATE,
    id_tarea INT,

    CONSTRAINT fk_tarea
        FOREIGN KEY (id_tarea)
        REFERENCES tarea(id_tarea)

);CREATE TABLE reporte (
    id_reporte INT AUTO_INCREMENT PRIMARY KEY,
    fecha_generacion DATE NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descripcion TEXT,
    id_proyecto INT NOT NULL,

    CONSTRAINT fk_reporte_proyecto
        FOREIGN KEY (id_proyecto)
        REFERENCES proyecto(id_proyecto)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);