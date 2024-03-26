create schema evaluacionAlkemyIntegradora;
use evaluacionAlkemyIntegradora;

CREATE TABLE Usuario (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    correo_electronico VARCHAR(100),
    contraseña VARCHAR(50),
    saldo DECIMAL(10,2)
);
/* cree la tabla "monedas" en caso de seleccion de monedas*/
CREATE TABLE Moneda (
    currency_id INT AUTO_INCREMENT PRIMARY KEY,
    currency_name VARCHAR(50),
    currency_symbol VARCHAR(5)
);

CREATE TABLE Transaccion (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_user_id INT,
    receiver_user_id INT,
    importe DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (sender_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES Usuario(user_id)
);

/*insertar valores a la tabla usuarios*/
INSERT INTO Usuario (nombre, correo_electronico, contraseña, saldo) VALUES
('Juan Pérez', 'juan@example.com', 'juanlocochon', 100000),
('María García', 'maria@example.com', 'mariabrigida', 75000),
('Luis Martínez', 'luis@example.com', 'luiseltronadioses', 150000),
('Ana Rodríguez', 'ana@example.com', 'labrigida12', 200000),
('Carlos Sánchez', 'carlos@example.com', 'carlosdiosdelfor', 50000),
('Laura López', 'laura@example.com', 'lauradiosa', 80000),
('Pedro González', 'pedro@example.com', 'pedropascal12', 120000),
('Sofía Díaz', 'sofia@example.com', 'sofiadelboom', 30000),
('Pablo Fernández', 'pablo@example.com', 'contraseña', 90000),
('Carmen Ruiz', 'carmen@example.com', 'carmencontraseñasegura', 60000),
('Javier Gómez', 'javier@example.com', 'admin123', 110000),
('Elena Vázquez', 'elena@example.com', 'sqladmin1123', 85000);


/* poblar los saldos para ejecutar transacciones*/
INSERT INTO Transaccion (sender_user_id, receiver_user_id, importe, transaction_date) VALUES
(1, 2, 5000, NOW()),
(3, 1, 10000, NOW()),
(2, 3, 2500, NOW()),
(4, 1, 20000, NOW()),
(2, 5, 7550, NOW()),
(6, 4, 3025, NOW()),
(7, 2, 8000, NOW()),
(3, 6, 4050, NOW()),
(5, 7, 6075, NOW()),
(8, 1, 9025, NOW()),
(4, 9, 12000, NOW()),
(10, 2, 4500, NOW());

/*revisar tablas*/
select * from transaccion;

select *from usuario;

/*hacer unas transacciones de pruebas entre ellos*/
START TRANSACTION;
-- De María García a Juan Pérez
UPDATE Usuario SET saldo = saldo - 5000 WHERE user_id = 2;
UPDATE Usuario SET saldo = saldo + 5000 WHERE user_id = 1;
-- De Luis Martínez a Ana Rodríguez
UPDATE Usuario SET saldo = saldo - 7500 WHERE user_id = 3;
UPDATE Usuario SET saldo = saldo + 7500 WHERE user_id = 4;

 -- De Ana Rodríguez a Carlos Sánchez
UPDATE Usuario SET saldo = saldo - 6000 WHERE user_id = 4;
UPDATE Usuario SET saldo = saldo + 6000 WHERE user_id = 5;

-- De Carlos Sánchez a Laura López
UPDATE Usuario SET saldo = saldo - 5500 WHERE user_id = 5;
UPDATE Usuario SET saldo = saldo + 5500 WHERE user_id = 6;

COMMIT;



 /* entregar usuarios unicos y nop duplicados*/
SELECT DISTINCT nombre FROM Usuario;
/*ordenar de forma ascendente*/
SELECT *, 'Ascendente' AS orden 
FROM Usuario 
ORDER BY user_id ASC;

/* ordenar de forma descendiente*/
SELECT *, 'Descendente' AS orden 
FROM Usuario 
ORDER BY user_id DESC;

/*consulta de transaccion*/
SELECT * 
FROM Transaccion 
WHERE sender_user_id = 3 OR receiver_user_id = 3;

/* usar join para unir 2 tablas no se si entra en la evaluacion pero lo se hacer :c*/
SELECT *
FROM Transaccion
JOIN Usuario ON Transaccion.sender_user_id = Usuario.user_id;

/*start transaction*/





