-- Datos de prueba: 10 filas por tabla
-- Ejecutar después de haber creado las tablas

-- 1) ESTUDIANTES (10)
INSERT INTO ESTUDIANTE (codigo_estudiante, cedula, nombres, carrera, telefono) VALUES
('ESTU001', '0102030401', 'Ana Gómez', 'Ingeniería Civil', '0998123451'),
('ESTU002', '0102030402', 'Luis Pérez', 'Administración', '0998123452'),
('ESTU003', '0102030403', 'María López', 'Ingeniería en Sistemas', '0998123453'),
('ESTU004', '0102030404', 'Carlos Sánchez', 'Educación Física', '0998123454'),
('ESTU005', '0102030405', 'Sofía Ramírez', 'Nutrición', '0998123455'),
('ESTU006', '0102030406', 'Pedro Castillo', 'Derecho', '0998123456'),
('ESTU007', '0102030407', 'Valeria Ruiz', 'Arquitectura', '0998123457'),
('ESTU008', '0102030408', 'Diego Torres', 'Ingeniería Industrial', '0998123458'),
('ESTU009', '0102030409', 'Lucía Vega', 'Medicina', '0998123459'),
('ESTU010', '0102030410', 'Javier Morales', 'Economía', '0998123460');


-- 2) ENTRENADORES (10)
INSERT INTO ENTRENADOR (codigo_entrenador, cedula, nombres, especialidad, telefono) VALUES
('ENT001', '0203040501', 'Andrés Molina', 'Fútbol', '0987001111'),
('ENT002', '0203040502', 'Patricia Díaz', 'Natación', '0987001112'),
('ENT003', '0203040503', 'Roberto Núñez', 'Baloncesto', '0987001113'),
('ENT004', '0203040504', 'Elena Bravo', 'Vóleibol', '0987001114'),
('ENT005', '0203040505', 'Fernando Gil', 'Atletismo', '0987001115'),
('ENT006', '0203040506', 'Isabel Herrera', 'Tenis', '0987001116'),
('ENT007', '0203040507', 'Miguel Ortega', 'Rugby', '0987001117'),
('ENT008', '0203040508', 'Claudia Paredes', 'Hockey', '0987001118'),
('ENT009', '0203040509', 'Ricardo Salas', 'Gimnasia', '0987001119'),
('ENT010', '0203040510', 'Mariana Cruz', 'Karate', '0987001120');


-- 3) DISCIPLINAS (10) -- cada una con un entrenador asignado
INSERT INTO DISCIPLINA (codigo_disciplina, nombre, categoria_deportiva, cupo_maximo, horario, codigo_entrenador) VALUES
('DIS001', 'Futbol',      'Colectivo', 25, 'Lun,Mié 18:00-20:00', 'ENT001'),
('DIS002', 'Natacion',    'Individual', 20, 'Mar,Jue 07:00-08:30', 'ENT002'),
('DIS003', 'Baloncesto',  'Colectivo', 20, 'Lun,Mié 20:00-22:00', 'ENT003'),
('DIS004', 'Voleibol',    'Colectivo', 18, 'Mar,Jue 18:00-20:00', 'ENT004'),
('DIS005', 'Atletismo',   'Individual', 30, 'Sab 08:00-10:00', 'ENT005'),
('DIS006', 'Tenis',       'Individual', 12, 'Lun,Vie 16:00-18:00', 'ENT006'),
('DIS007', 'Rugby',       'Colectivo', 22, 'Mié,Vie 18:00-20:00', 'ENT007'),
('DIS008', 'Hockey',      'Colectivo', 20, 'Mar,Jue 20:00-22:00', 'ENT008'),
('DIS009', 'Gimnasia',    'Individual', 15, 'Lun,Mie 06:00-07:30', 'ENT009'),
('DIS010', 'Karate',      'Individual', 16, 'Mar,Jue 19:00-20:30', 'ENT010');


-- 4) INSTALACIONES (10)
INSERT INTO INSTALACION (codigo_instalacion, nombre, tipo, capacidad_maxima) VALUES
('INS001', 'Cancha futbol #1', 'Cancha', 300),
('INS002', 'Piscina olimpica', 'Piscina', 100),
('INS003', 'Cancha baloncesto', 'Cancha', 200),
('INS004', 'Gimnasio A', 'Gimnasio', 150),
('INS005', 'Pista atletismo', 'Pista', 500),
('INS006', 'Cancha tenis 1', 'Cancha', 80),
('INS007', 'Campo rugby', 'Cancha', 250),
('INS008', 'Campo hockey', 'Cancha', 200),
('INS009', 'Sala de gimnasia', 'Sala', 60),
('INS010', 'Dojo karate', 'Sala', 40);


-- 5) SESIONES (10) - cada sesión referencia disciplina y entrenador
INSERT INTO SESION (codigo_sesion, fecha, hora_inicio, hora_fin, tipo_entrenamiento, codigo_disciplina, codigo_entrenador) VALUES
('SES001', '2025-11-03', '18:00:00', '20:00:00', 'técnico', 'DIS001', 'ENT001'),
('SES002', '2025-11-04', '07:00:00', '08:30:00', 'técnico', 'DIS002', 'ENT002'),
('SES003', '2025-11-03', '20:00:00', '22:00:00', 'táctico', 'DIS003', 'ENT003'),
('SES004', '2025-11-04', '18:00:00', '20:00:00', 'físico', 'DIS004', 'ENT004'),
('SES005', '2025-11-08', '08:00:00', '10:00:00', 'físico', 'DIS005', 'ENT005'),
('SES006', '2025-11-10', '16:00:00', '18:00:00', 'técnico', 'DIS006', 'ENT006'),
('SES007', '2025-11-05', '18:00:00', '20:00:00', 'táctico', 'DIS007', 'ENT007'),
('SES008', '2025-11-06', '20:00:00', '22:00:00', 'táctico', 'DIS008', 'ENT008'),
('SES009', '2025-11-03', '06:00:00', '07:30:00', 'técnico', 'DIS009', 'ENT009'),
('SES010', '2025-11-04', '19:00:00', '20:30:00', 'técnico', 'DIS010', 'ENT010');


-- 6) INSCRIPCIONES (10) - cada estudiante inscrito en al menos una disciplina
-- (máx 3 por estudiante respetado en este conjunto)
INSERT INTO INSCRIPCION (codigo_estudiante, codigo_disciplina, fecha_inscripcion, estado) VALUES
('ESTU001', 'DIS001', '2025-02-01', 'activo'),
('ESTU002', 'DIS001', '2025-02-03', 'activo'),
('ESTU003', 'DIS002', '2025-02-05', 'activo'),
('ESTU004', 'DIS003', '2025-02-07', 'activo'),
('ESTU005', 'DIS004', '2025-02-08', 'activo'),
('ESTU006', 'DIS005', '2025-02-09', 'activo'),
('ESTU007', 'DIS006', '2025-02-10', 'activo'),
('ESTU008', 'DIS007', '2025-02-11', 'activo'),
('ESTU009', 'DIS008', '2025-02-12', 'activo'),
('ESTU010', 'DIS010', '2025-02-13', 'activo');


-- 7) ASISTENCIAS (10) - registros de presencia en sesiones
INSERT INTO ASISTENCIA (codigo_estudiante, codigo_sesion, estado_asistencia, observaciones) VALUES
('ESTU001', 'SES001', 'presente', ''),
('ESTU002', 'SES001', 'ausente', 'motivo: enfermedad'),
('ESTU003', 'SES002', 'presente', ''),
('ESTU004', 'SES003', 'tardanza', 'llegó 15 min tarde'),
('ESTU005', 'SES004', 'presente', ''),
('ESTU006', 'SES005', 'presente', ''),
('ESTU007', 'SES006', 'presente', ''),
('ESTU008', 'SES007', 'ausente', 'viaje'),
('ESTU009', 'SES008', 'presente', ''),
('ESTU010', 'SES010', 'presente', 'participó en examen');


-- 8) HORARIO_USO (10) - programación de instalaciones por disciplina
INSERT INTO HORARIO_USO (codigo_disciplina, codigo_instalacion, dia_semana, hora_inicio, hora_fin) VALUES
('DIS001', 'INS001', 'Lunes',   '18:00:00', '20:00:00'),
('DIS001', 'INS001', 'Miercoles','18:00:00', '20:00:00'),
('DIS002', 'INS002', 'Martes',  '07:00:00', '08:30:00'),
('DIS003', 'INS003', 'Lunes',   '20:00:00', '22:00:00'),
('DIS004', 'INS004', 'Martes',  '18:00:00', '20:00:00'),
('DIS005', 'INS005', 'Sabado',  '08:00:00', '10:00:00'),
('DIS006', 'INS006', 'Lunes',   '16:00:00', '18:00:00'),
('DIS007', 'INS007', 'Miercoles','18:00:00', '20:00:00'),
('DIS008', 'INS008', 'Jueves',  '20:00:00', '22:00:00'),
('DIS010', 'INS010', 'Martes',  '19:00:00', '20:30:00');
