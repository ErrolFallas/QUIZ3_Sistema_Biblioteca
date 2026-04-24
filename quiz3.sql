CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Autores (
ID_Autor INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(40) NOT NULL,
Apellido VARCHAR(40) NOT NULL,
Nacionalidad VARCHAR(50) NOT NULL
);

CREATE TABLE Editoriales (
ID_Editorial INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(40) NOT NULL,
Pais VARCHAR(80) NOT NULL
); 

CREATE TABLE Categorias (
ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL
); 

CREATE TABLE Libros (
ID_Libro INT AUTO_INCREMENT PRIMARY KEY,
Titulo VARCHAR(150) NOT NULL,
Anho_Publicacion INT DEFAULT 2026 ,
ID_Autor INT,
ID_Editorial INT,
FOREIGN KEY (ID_Autor) REFERENCES Autores(ID_Autor),
FOREIGN KEY (ID_Editorial) REFERENCES Editoriales(ID_Editorial)
); 

CREATE TABLE Libro_Categoria (
ID_Libro_Categoria INT AUTO_INCREMENT PRIMARY KEY,
ID_Categoria INT,
ID_Libro INT,
FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria),
FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro)
);

CREATE TABLE Usuarios (
ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(40) NOT NULL,
Apellido VARCHAR(40) NOT NULL,
Correo VARCHAR(100) UNIQUE DEFAULT "No_existe",
Fecha_Registro DATE DEFAULT (CURRENT_DATE)
); 

CREATE TABLE Prestamos (
ID_Prestamo INT AUTO_INCREMENT PRIMARY KEY,
Fecha_Prestamo DATE DEFAULT (CURRENT_DATE),
ID_Usuario INT,
FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
); 

CREATE TABLE Detalle_Prestamo (
ID_Detalle_Prestamo INT AUTO_INCREMENT PRIMARY KEY,
Fecha_Estimada_Devolucion DATE NOT NULL,
Estado ENUM ("Devuelto", "No_devuelto") default "No_devuelto",
ID_Prestamo INT,
ID_Libro INT,
FOREIGN KEY (ID_Prestamo) REFERENCES Prestamos(ID_Prestamo),
FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro)
); 


-- consultas de tablas , para observar propiedades
select * From Autores;
select * From Categorias;
select * From Detalle_Prestamo;
select * From Editoriales;
select * From Libro_Categoria;
select * From Libros;
select * From Prestamos;
Select * From Usuarios;

-- Insertar Registros en las tablas
-- Autores
INSERT INTO Autores (Nombre, Apellido, Nacionalidad) VALUES
("Gabriel", "Garcia Marquez", "Colombiana"),
("Isabel", "Allende", "Chilena"),
("Jorge Luis", "Borges", "Argentina"),
("Mario", "Vargas Llosa", "Peruana"),
("Julio", "Cortazar", "Argentina"),
("Pablo", "Neruda", "Chilena");

INSERT INTO Categorias (Nombre) VALUES
("Novela"),
("Ciencia Ficcion"),
("Fantasia"),
("Historia"),
("Poesia"),
("Ensayo");

INSERT INTO Editoriales (Nombre, Pais) VALUES
("Planeta", "España"),
("Penguin Random House", "Estados Unidos"),
("Alfaguara", "España"),
("Anagrama", "España"),
("Siglo XXI", "Mexico"),
("Fondo de Cultura Economica", "Mexico");

INSERT INTO Usuarios (Nombre, Apellido, Correo, Fecha_Registro) VALUES
("Juan", "Perez", "juan@gmail.com", "2018-03-15"),
("Maria", "Lopez", "maria@gmail.com", "2019-07-22"),
("Carlos", "Sanchez", "carlos@gmail.com", "2020-11-05"),
("Ana", "Rodriguez", "ana@gmail.com", "2021-01-30"),
("Luis", "Gomez", "luis@gmail.com", "2023-06-18"),
("Sofia", "Hernandez", "sofia@gmail.com", "2025-09-09"),
("Pedro", "Ramirez", DEFAULT, DEFAULT);

INSERT INTO Libros (Titulo, Anho_Publicacion, ID_Autor, ID_Editorial) VALUES
("Cien años de soledad", 1967, 1, 1),
("La casa de los espiritus", 1982, 2, 2),
("Ficciones", 1944, 3, 3),
("La ciudad y los perros", 1963, 4, 4),
("Rayuela", 1963, 5, 5),
("Veinte poemas de amor", 1924, 6, 6),
("Libro Desconocido", DEFAULT, 1, 1);

INSERT INTO Prestamos (Fecha_Prestamo, ID_Usuario) VALUES
("2023-01-10", 1),
("2023-05-14", 2),
("2024-02-20", 3),
("2024-08-03", 4),
("2025-03-11", 5),
("2026-01-25", 6),
(DEFAULT, 7);

INSERT INTO Prestamos (Fecha_Prestamo, ID_Usuario) VALUES
("2026-02-01", 1),
("2026-02-05", 1),
("2026-02-10", 2),
("2026-02-15", 3),
("2026-02-20", 1);

INSERT INTO Libro_Categoria (ID_Categoria, ID_Libro) VALUES
(1,1),
(1,2),
(2,3),
(1,4),
(3,5),
(5,6),
(6,7);

INSERT INTO Libro_Categoria (ID_Categoria, ID_Libro) VALUES
(2,1),
(3,1),
(4,2),
(5,2),
(1,3),
(6,3),
(2,5),
(4,6);

INSERT INTO Detalle_Prestamo (Fecha_Estimada_Devolucion, ID_Prestamo, ID_Libro, Estado) VALUES
("2023-01-20", 1, 1, "Devuelto"),
("2023-05-25", 2, 2, "Devuelto"),
("2024-03-05", 3, 3, "Devuelto"),
("2024-08-18", 4, 4, "Devuelto"),
("2025-03-25", 5, 5, "Devuelto"),
("2026-02-10", 6, 6, DEFAULT),
("2026-01-10", 7, 7, DEFAULT);

INSERT INTO Detalle_Prestamo (Fecha_Estimada_Devolucion, ID_Prestamo, ID_Libro, Estado) VALUES
("2026-02-10", 8, 1, "Devuelto"),
("2026-02-12", 8, 2, "Devuelto"),
("2026-02-18", 9, 1, "Devuelto"),
("2026-02-20", 9, 3, "Devuelto"),
("2026-02-25", 10, 1, "Devuelto"),
("2026-02-28", 10, 4, "Devuelto"),
("2026-03-05", 11, 2, "Devuelto"),
("2026-03-08", 11, 5, "Devuelto"),
("2026-05-01", 12, 1, "No_devuelto"),
("2026-05-05", 12, 6, "No_devuelto");


-- A-Consultas Basicas:
-- A.1-Mostrar todos los libros

select * From Libros;

-- A.2- Mostrar títulos y años de publicación
Select Titulo, Anho_Publicacion FROM Libros;

-- A.3-Mostrar usuarios registrados recientemente
Select * From Usuarios where Fecha_Registro between "2025-01-01" AND "2026-12-31" order by Fecha_Registro DESC;

-- B-JOIN
-- B.1-Mostrar libros con su autor
Select Libros.Titulo, Autores.Nombre AS Nombre_Autor, Autores.Apellido As Apellido_Autor 
from Libros inner join Autores
ON Libros.ID_Autor = Autores.ID_Autor;

-- B.2-Mostrar libros con su editorial
Select Libros.Titulo as Titulo_Libros, Editoriales.Nombre as Nombre_Editorial
from Libros inner join Editoriales
ON Libros.ID_Editorial = Editoriales.ID_Editorial;

-- B.3-Mostrar categorías de cada libro
SELECT Libro_Categoria.ID_Libro_Categoria, Libros.Titulo AS Titulo_Libros, Categorias.Nombre AS Categorias
FROM Libro_Categoria 
INNER JOIN Categorias ON Libro_Categoria.ID_Categoria = Categorias.ID_Categoria
INNER JOIN Libros ON Libro_Categoria.ID_Libro = Libros.ID_Libro;

-- C-JOIN múltiples
-- C.1-Mostrar todos los préstamos con nombre de usuario y libro
SELECT Usuarios.Nombre AS Nombre_Usuario,Usuarios.Apellido AS Apellido_Usuario, Libros.Titulo,Prestamos.Fecha_Prestamo
FROM Detalle_Prestamo 
INNER JOIN Prestamos ON Detalle_Prestamo.ID_Prestamo = Prestamos.ID_Prestamo
INNER JOIN Libros ON Detalle_Prestamo.ID_Libro = Libros.ID_Libro
INNER JOIN Usuarios ON Prestamos.ID_Usuario = Usuarios.ID_Usuario;
-- C.2-Mostrar libros no devueltos
SELECT Libros.Titulo, Prestamos.Fecha_Prestamo AS Fecha_Prestamo, Detalle_Prestamo.Fecha_Estimada_Devolucion AS Fecha_Limite_Devolucion,Detalle_Prestamo.Estado
FROM Detalle_Prestamo 
INNER JOIN Prestamos ON Detalle_Prestamo.ID_Prestamo= Prestamos.ID_Prestamo
INNER JOIN Libros ON Detalle_Prestamo.ID_Libro = Libros.ID_Libro
where Detalle_Prestamo.Estado = "No_devuelto";

-- C.3-Mostrar historial completo de préstamos
SELECT Detalle_Prestamo.ID_Detalle_Prestamo, Libros.Titulo, Usuarios.Nombre as Nombre_Usuario, Usuarios.Apellido as Apellido_Usuario, Prestamos.Fecha_Prestamo AS Fecha_Prestamo, Detalle_Prestamo.Fecha_Estimada_Devolucion AS Fecha_Limite_Devolucion,Detalle_Prestamo.Estado
FROM Detalle_Prestamo 
INNER JOIN Prestamos ON Detalle_Prestamo.ID_Prestamo= Prestamos.ID_Prestamo
INNER JOIN Libros ON Detalle_Prestamo.ID_Libro = Libros.ID_Libro
INNER JOIN Usuarios ON Prestamos.ID_Usuario = Usuarios.ID_Usuario;


-- D-Agregaciones:
-- D.1-Cantidad de libros por categoría
SELECT Categorias.ID_Categoria, Categorias.Nombre AS Categoria, COUNT(Libro_Categoria.ID_Libro) AS Cantidad_Libros
FROM Libro_Categoria
INNER JOIN Categorias 
ON Libro_Categoria.ID_Categoria = Categorias.ID_Categoria
GROUP BY Categorias.ID_Categoria;

-- D.2-Cantidad de préstamos por usuario
Select Usuarios.ID_Usuario, Usuarios.Nombre AS Usuarios, count(Prestamos.ID_Prestamo) AS Cantidad_Prestamos_Realizados
FROM Prestamos
INNER JOIN Usuarios
ON Prestamos.ID_Usuario=Usuarios.ID_Usuario
Group by Usuarios.ID_Usuario;

-- D.3-Cantidad de libros por editorial
select Editoriales.Nombre AS Casa_Editorial, count(Libros.ID_Libro) AS Cantidad_libros
FROM Libros
INNER JOIN Editoriales
ON Libros.ID_Editorial= Editoriales.ID_Editorial
GROUP BY Editoriales.ID_Editorial;

-- E-Consultas avanzadas

-- E.1-Usuario con más préstamos
select Usuarios.ID_Usuario, Usuarios.Nombre as usuario, count(Prestamos.ID_Prestamo) as Cantidad_Prestamos
FROM Prestamos
Inner JOIN Usuarios
ON Prestamos.ID_Usuario = Usuarios.ID_Usuario
Group by Usuarios.ID_Usuario
HAVING COUNT(Prestamos.ID_Prestamo) = (
    SELECT MAX(Cantidad)
    FROM (
        SELECT COUNT(*) AS Cantidad
        FROM Prestamos
        GROUP BY ID_Usuario
    ) AS sub
);


-- E.2-Libro más prestado
SELECT Libros.Titulo, count(Detalle_Prestamo.ID_Prestamo ) as Cantidad_Prestamos FROM Detalle_Prestamo 
INNER JOIN Libros
ON Detalle_Prestamo.ID_Libro=Libros.ID_Libro
INNER JOIN Prestamos
ON Detalle_Prestamo.ID_Prestamo=Prestamos.ID_Prestamo
Group by Libros.ID_Libro
HAVING COUNT(Detalle_Prestamo.ID_Prestamo) = (
    SELECT MAX(Cantidad)
    FROM (
        SELECT COUNT(*) AS Cantidad
        FROM Detalle_Prestamo
        GROUP BY ID_Libro
    ) AS sub
);

-- E.3-Categoría más popular
SELECT Categorias.ID_Categoria, Categorias.Nombre AS Categoria, COUNT(Detalle_Prestamo.ID_Prestamo) AS Total_Prestamos
FROM Categorias
INNER JOIN Libro_Categoria 
ON Categorias.ID_Categoria = Libro_Categoria.ID_Categoria
INNER JOIN Detalle_Prestamo 
ON Libro_Categoria.ID_Libro = Detalle_Prestamo.ID_Libro
GROUP BY Categorias.ID_Categoria
HAVING COUNT(Detalle_Prestamo.ID_Prestamo) = (
    SELECT MAX(Cantidad)
    FROM (
        SELECT COUNT(*) AS Cantidad
        FROM Detalle_Prestamo
        INNER JOIN Libro_Categoria 
		ON Detalle_Prestamo.ID_Libro = Libro_Categoria.ID_Libro
        GROUP BY Libro_Categoria.ID_Categoria
    ) AS sub
);

select * From Autores;
select * From Categorias;
select * From Detalle_Prestamo;
select * From Editoriales;
select * From Libro_Categoria;
select * From Libros;
select * From Prestamos;
Select * From Usuarios;