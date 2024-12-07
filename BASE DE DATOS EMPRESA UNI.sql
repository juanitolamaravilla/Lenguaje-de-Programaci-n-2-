-- Crear base de datos
CREATE DATABASE EmpresaUNI;
GO

USE EmpresaUNI;

-- Tabla Centro de Trabajo
CREATE TABLE Centro_Trabajo (
ID_Centro INT PRIMARY KEY,
Nombre_Centro VARCHAR(100) NOT NULL,
Ciudad VARCHAR(50) NOT NULL
);

-- Tabla Empleado
CREATE TABLE Empleado (
ID_Empleado INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL,
Apellido_Paterno VARCHAR(50) NOT NULL,
Apellido_Materno VARCHAR(50) NOT NULL,
Fecha_Nacimiento DATE NOT NULL,
RFC AS (UPPER(SUBSTRING(Nombre,1,2) + SUBSTRING(Apellido_Paterno,1,2) +
SUBSTRING(Apellido_Materno,1,1) +
FORMAT(Fecha_Nacimiento, 'yyMMdd'))),
ID_Centro INT FOREIGN KEY REFERENCES Centro_Trabajo(ID_Centro),
Puesto VARCHAR(50) NOT NULL,
Descripcion_Puesto VARCHAR(100) NOT NULL,
Directivo BIT NOT NULL
);


-- Tabla Directivo
CREATE TABLE Directivo(
ID_Directivo INT PRIMARY KEY FOREIGN KEY REFERENCES Empleado(ID_Empleado),
Numero_Centro_Supervisado INT NOT NULL,
Prestacion_Combustible BIT NOT NULL,
FOREIGN KEY (Numero_Centro_Supervisado) REFERENCES Centro_Trabajo(ID_Centro)
);


-- Inserci�n de datos en Centro de Trabajo
INSERT INTO Centro_Trabajo (ID_Centro, Nombre_Centro, Ciudad) VALUES
(000201, 'Tiendas �ngel Flores Ropa', 'Culiac�n'),
(000202, 'Tiendas �ngel Flores Muebles', 'Culiac�n'),
(000203, 'Tiendas �ngel Flores Cajas', 'Culiac�n'),
(049001, 'La Primavera Ropa', 'Culiac�n'),
(049002, 'La Primavera Muebles', 'Culiac�n'),
(049003, 'La Primavera Cajas', 'Culiac�n');
 

-- Inserci�n de datos en Empleado
INSERT INTO Empleado(Nombre, Apellido_Paterno, Apellido_Materno, Fecha_Nacimiento, ID_Centro, Puesto, Descripcion_Puesto, Directivo) VALUES
('Luis', 'Castillo', 'Ramirez', '1987-03-12', 000201, 'Jefe de Almac�n', 'Gestiona inventarios y operaciones log�sticas', 1),
('Andrea', 'Gonzalez', 'Hernandez', '1992-09-25', 000202, 'Analista Contable', 'Revisa y analiza estados financieros', 0),
('Carlos', 'Santos', 'Lopez', '1980-11-07', 000203, 'Gerente de Sucursal', 'Supervisa las operaciones de la sucursal', 1),
('Sofia', 'Morales', 'Diaz', '1995-05-14', 049001, 'Ejecutiva de Ventas', 'Responsable de atender clientes clave', 0),
('Miguel', 'Torres', 'Jimenez', '1983-01-18', 049002, 'Supervisor de Operaciones', 'Coordina equipos operativos y tareas diarias', 1),
('Elena', 'Garcia', 'Ortiz', '1991-07-03', 049003, 'Coordinadora de Proyectos', 'Planifica y supervisa proyectos internos', 1),
('Ricardo', 'Fernandez', 'Martinez', '1989-02-27', 000201, 'Especialista en Log�stica', 'Optimiza procesos de entrega y distribuci�n', 0),
('Lucia', 'Serrano', 'Castro', '1993-10-15', 049002, 'Dise�adora Gr�fica', 'Crea materiales visuales para campa�as publicitarias', 0),
('Roberto', 'Alvarez', 'Velazquez', '1977-04-20', 049001, 'Consultor de Negocios', 'Asesora sobre estrategias empresariales', 1),
('Isabel', 'Lopez', 'Gutierrez', '1985-08-09', 000203, 'Supervisora de Ventas', 'Controla el desempe�o del equipo de ventas', 1);


-- Inserci�n de datos en Directivo
(1, 000201, 1),
(3, 000203, 1),
(5, 049002, 1),
(6, 049003, 1),
(10, 000203, 1);
