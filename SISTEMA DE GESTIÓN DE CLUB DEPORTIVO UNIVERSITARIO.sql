-- ===========================================================
-- SISTEMA DE GESTIÓN DE CLUB DEPORTIVO UNIVERSITARIO
-- MODELO RELACIONAL (Versión 8 Tablas)
-- ===========================================================
-- Autor: Yandri Piscocama, Wilson Palma.
-- Compatibilidad: MySQL / PostgreSQL
-- ===========================================================

-- ===================== ENTIDADES FUERTES =====================

CREATE TABLE ESTUDIANTE (
    codigo_estudiante VARCHAR(10) PRIMARY KEY,
    cedula VARCHAR(10) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    carrera VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    correo_institucional VARCHAR(120) GENERATED ALWAYS AS (CONCAT(codigo_estudiante, '@unl.edu.ec')) STORED
);

CREATE TABLE ENTRENADOR (
    codigo_entrenador VARCHAR(10) PRIMARY KEY,
    cedula VARCHAR(10) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50),
    telefono VARCHAR(15)
);

CREATE TABLE DISCIPLINA (
    codigo_disciplina VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    categoria_deportiva VARCHAR(40),
    cupo_maximo INT CHECK (cupo_maximo > 0),
    horario VARCHAR(80),
    codigo_entrenador VARCHAR(10) NOT NULL,
    CONSTRAINT fk_disciplina_entrenador
        FOREIGN KEY (codigo_entrenador)
        REFERENCES ENTRENADOR (codigo_entrenador)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE INSTALACION (
    codigo_instalacion VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    tipo VARCHAR(40),
    capacidad_maxima INT CHECK (capacidad_maxima > 0)
);

CREATE TABLE SESION (
    codigo_sesion VARCHAR(10) PRIMARY KEY,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    tipo_entrenamiento VARCHAR(50),
    codigo_disciplina VARCHAR(10) NOT NULL,
    codigo_entrenador VARCHAR(10) NOT NULL,
    CONSTRAINT fk_sesion_disciplina
        FOREIGN KEY (codigo_disciplina)
        REFERENCES DISCIPLINA (codigo_disciplina)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_sesion_entrenador
        FOREIGN KEY (codigo_entrenador)
        REFERENCES ENTRENADOR (codigo_entrenador)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_duracion_sesion CHECK (hora_fin > hora_inicio)
);

-- ===================== ENTIDADES INTERMEDIAS =====================

CREATE TABLE INSCRIPCION (
    codigo_estudiante VARCHAR(10) NOT NULL,
    codigo_disciplina VARCHAR(10) NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    estado VARCHAR(20) DEFAULT 'activo',
    PRIMARY KEY (codigo_estudiante, codigo_disciplina),
    CONSTRAINT fk_inscripcion_estudiante
        FOREIGN KEY (codigo_estudiante)
        REFERENCES ESTUDIANTE (codigo_estudiante)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_inscripcion_disciplina
        FOREIGN KEY (codigo_disciplina)
        REFERENCES DISCIPLINA (codigo_disciplina)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE ASISTENCIA (
    codigo_estudiante VARCHAR(10) NOT NULL,
    codigo_sesion VARCHAR(10) NOT NULL,
    estado_asistencia VARCHAR(15) CHECK (estado_asistencia IN ('presente', 'ausente', 'tardanza')),
    observaciones VARCHAR(255),
    PRIMARY KEY (codigo_estudiante, codigo_sesion),
    CONSTRAINT fk_asistencia_estudiante
        FOREIGN KEY (codigo_estudiante)
        REFERENCES ESTUDIANTE (codigo_estudiante)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_asistencia_sesion
        FOREIGN KEY (codigo_sesion)
        REFERENCES SESION (codigo_sesion)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE HORARIO_USO (
    codigo_disciplina VARCHAR(10) NOT NULL,
    codigo_instalacion VARCHAR(10) NOT NULL,
    dia_semana VARCHAR(15) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    PRIMARY KEY (codigo_disciplina, codigo_instalacion, dia_semana),
    CONSTRAINT fk_horario_disciplina
        FOREIGN KEY (codigo_disciplina)
        REFERENCES DISCIPLINA (codigo_disciplina)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_horario_instalacion
        FOREIGN KEY (codigo_instalacion)
        REFERENCES INSTALACION (codigo_instalacion)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT chk_horario_valido CHECK (hora_fin > hora_inicio)
);

-- ===========================================================
-- FIN DEL SCRIPT
-- ===========================================================
