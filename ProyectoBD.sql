drop database ProyectoBD;
CREATE DATABASE IF NOT EXISTS ProyectoBD;
USE ProyectoBD;

-- Tabla usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    Documento VARCHAR(15) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    TipoDocumento ENUM('CC', 'TI', 'CE', 'RC', 'NIP', 'NIT') NOT NULL,
    Genero ENUM('Masculino', 'Femenino', 'Otro') NOT NULL,
    Correo VARCHAR(100) UNIQUE NOT NULL,
    Telefono VARCHAR(15),
    Direccion VARCHAR(200),
    Barrio VARCHAR(200),
    FechaNacimiento DATE,
    Password VARCHAR(100) NOT NULL,
    Estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo',
    FechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla empleados
CREATE TABLE IF NOT EXISTS empleados (
    Documento VARCHAR(15) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    TipoDocumento ENUM('CC', 'TI', 'CE', 'RC', 'NIP', 'NIT') NOT NULL,
    Genero ENUM('Masculino', 'Femenino', 'Otro') NOT NULL,
    Correo VARCHAR(100) UNIQUE NOT NULL,
    Telefono VARCHAR(15),
    Direccion VARCHAR(200),
    Barrio VARCHAR(200),
    FechaNacimiento DATE,
    Profesion VARCHAR(100),
    Estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo',
    FechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla especialidades
CREATE TABLE IF NOT EXISTS especialidades (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Estado ENUM('Activa', 'Inactiva') DEFAULT 'Activa',
    FechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla empleados_especialidades (relación muchos a muchos)
CREATE TABLE IF NOT EXISTS empleados_especialidades (
    EmpleadoDocumento VARCHAR(15),
    EspecialidadId INT,
    Estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo',
    FechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (EmpleadoDocumento, EspecialidadId),
    FOREIGN KEY (EmpleadoDocumento) REFERENCES empleados(Documento),
    FOREIGN KEY (EspecialidadId) REFERENCES especialidades(Id)
);

-- Tabla horarios_disponibles
CREATE TABLE IF NOT EXISTS horarios_disponibles (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    EmpleadoDocumento VARCHAR(15),
    Fecha DATE NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    Estado ENUM('Disponible', 'Ocupado', 'Inactivo') DEFAULT 'Disponible',
    FechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (EmpleadoDocumento) REFERENCES empleados(Documento)
);

-- Tabla citas
CREATE TABLE IF NOT EXISTS citas (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    PacienteDocumento VARCHAR(15),
    EmpleadoDocumento VARCHAR(15),
    EspecialidadId INT,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    Estado ENUM('Programada', 'Cancelada', 'Realizada') DEFAULT 'Programada',
    Motivo TEXT,
    Observaciones TEXT,
    FechaCreacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (PacienteDocumento) REFERENCES usuarios(Documento),
    FOREIGN KEY (EmpleadoDocumento) REFERENCES empleados(Documento),
    FOREIGN KEY (EspecialidadId) REFERENCES especialidades(Id)
);
