DROP DATABASE IF EXISTS `Restaurant`;
CREATE DATABASE `Restaurant`;
USE `Restaurant`;

DROP TABLE IF EXISTS rented_halls;
DROP TABLE IF EXISTS canceled_reservations;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS cashier;
DROP TABLE IF EXISTS menus;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS deliveries;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers ( 
CustomerID NUMERIC (2) NOT NULL UNIQUE,
CustomerName VARCHAR (20),
Address VARCHAR (30),
Phone NUMERIC (10),
PRIMARY KEY(CustomerID)
);

CREATE TABLE products (
ProductID NUMERIC (4) NOT NULL UNIQUE,
ProductName VARCHAR (40) NOT NULL,
Price NUMERIC (10),
MenuID NUMERIC (10),
PRIMARY KEY(ProductID, MenuID)
);

CREATE TABLE orders (
OrderID NUMERIC (2) NOT NULL,
OrderDate DATE,
Quantity NUMERIC (30) NOT NULL,
OrderPrice NUMERIC (10) NOT NULL,
ProductID NUMERIC (4) NOT NULL,
CustomerID NUMERIC (2) NOT NULL,
PRIMARY KEY (OrderID, ProductID)
);

CREATE TABLE deliveries(
DeliveryID NUMERIC (3) NOT NULL,
DeliveryDate DATE,
DeliveryTime TIME, 
EmployeeID NUMERIC (3),
PRIMARY KEY(DeliveryID)
);

CREATE TABLE employees(
EmployeeID NUMERIC (3) NOT NULL,
Position VARCHAR (30) NOT NULL,
Name VARCHAR(25) NOT NULL,
Phone NUMERIC (10) NOT NULL,
Salary NUMERIC (10) NOT NULL,
PRIMARY KEY(EmployeeID)
);

CREATE TABLE menus (
MenuID NUMERIC (3) NOT NULL,
MenuName VARCHAR (25) NOT NULL,
PRIMARY KEY(MenuID)
);

CREATE TABLE cashier (
CashierID NUMERIC(3) NOT NULL,
CollectedAmount NUMERIC (10),
TransactionDate DATE,
TransactionTime TIME,
EmployeeID NUMERIC (3) NOT NULL,
PRIMARY KEY (CashierID)
);

CREATE TABLE reservations (
ReservationID NUMERIC (3),
ReservationDate DATE,
ReservationTime TIME,
Advance NUMERIC (10),
EmployeeID NUMERIC (3),
CustomerID NUMERIC (2),
PRIMARY KEY (ReservationID)
);

CREATE TABLE canceled_reservations (
CanceledReservationID NUMERIC (3) NOT NULL,
Reason VARCHAR (25),
Penalty NUMERIC (10),
ReservationID NUMERIC(3),
PRIMARY KEY (ReservationID, CanceledReservationID)
);

CREATE TABLE rented_halls (
HallID NUMERIC (3) NOT NULL,
HallName VARCHAR (15),
Capacity NUMERIC(3),
RentalPrice NUMERIC (10),
CustomerID NUMERIC (2) NOT NULL,
PRIMARY KEY (HallID, CustomerID)
);

-- Customers
INSERT INTO customers VALUES (1, 'Popescu Ion', 'Painter St, No. 30', 0748334578);
INSERT INTO customers VALUES (2, 'Popescu Viorel', 'Happiness St, No. 15', 0748357574);
INSERT INTO customers VALUES ( 3, 'Dumitrescu Maria', 'str. Tineretului, nr 12', 0761543698);
INSERT INTO customers VALUES ( 4, 'Georgescu Angelica', 'str. Nucilor, nr 20', 0789663181);
INSERT INTO customers VALUES ( 5, 'Pantia Alexandra', 'str. George Cosbuc, nr 22',0724568791);
INSERT INTO customers VALUES ( 6, 'Bucur Mariana','str. Salcamilor, nr 19', 0747893216);
INSERT INTO customers VALUES ( 7, 'Apetroaie Daniel', 'str. Eminescu, nr 35', 0761214154);
INSERT INTO customers VALUES ( 8, 'Sava Bianca','str. Trandafirilor, nr 39',0723236936);
INSERT INTO customers VALUES ( 9, 'Pal Andreea', 'str. Porumbeilor, nr 32',074833965);
INSERT INTO customers VALUES ( 10, 'Martinas Ramona', 'str. Stejar, nr 11',0748568452);
INSERT INTO customers VALUES (11, 'Bejan Ioana', 'str. Stefan cel Mare, nr 21', 0768765984);
INSERT INTO customers VALUES (12, 'Antoci Dadiana', 'str. Armoniei, nr 12', 0725748956);
INSERT INTO customers VALUES (13, 'Lazar Antonia', 'str. Independetei, nr 55', 0741212546);
INSERT INTO customers VALUES (14, 'Boicu Daniela', 'str. Crisan, nr 76', 0786693233 );
INSERT INTO customers VALUES (15, 'Tutuianu Carmen', 'str. Crinului, nr 87', 0744558796 );
INSERT INTO customers VALUES (16, 'Rusu Georgiana', 'str. Horea, nr 98', 0755589978 );
INSERT INTO customers VALUES (17, 'Matei Antoneta', 'str. Zorilor, nr 12', 0766693322 );
INSERT INTO customers VALUES (18, 'Rusu Eliza', 'str. Pacii, nr 31', 0784561234 );                      
INSERT INTO customers VALUES (19, 'Dimisca Paul', 'str. Bradului, nr 95', 0721145968);
INSERT INTO customers VALUES (20, 'Tudurache Luiza', 'str. Lalelor, nr 48', 0743889787);

-- Products (Romanian)
INSERT INTO products VALUES (1101 , 'Stuffed cabbage rolls', 15, 11);
INSERT INTO products VALUES (1102 , 'Tripe soup', 20, 11);
INSERT INTO products VALUES (1103 , 'Smoked sausages', 13, 11);
INSERT INTO products VALUES (1104 , 'Pork feast', 17, 11);
INSERT INTO products VALUES (1105 , 'Bean soup with smoked pork', 23, 11);
-- Products (Greek)
INSERT INTO products VALUES (3301 , 'Meat pie', 27, 33);
INSERT INTO products VALUES (3302 , 'Eggplant in tomato sauce', 24, 33);
INSERT INTO products VALUES (3303 , 'Sweet and sour chicken', 21, 33);
INSERT INTO products VALUES (3304 , 'Sweet and sour chicken', 21, 33);
INSERT INTO products VALUES (3305 , 'Sweet and sour chicken', 21, 33);
-- Products (Chinese)
INSERT INTO products VALUES (4401 , 'Sweet and sour chicken', 21, 44);
INSERT INTO products VALUES (4402 , 'Chinese noodles', 18, 44);
INSERT INTO products VALUES (4403 , 'Greek fava', 28, 44);
INSERT INTO products VALUES (4404 , 'Fresh tuna salad', 22, 44);
INSERT INTO products VALUES (4405 , 'Meatball soup Greek style', 30, 44);
-- Products (Italian)
INSERT INTO products VALUES (5501 , 'Lasagna with Bolognese sauce', 25, 55);
INSERT INTO products VALUES (5502 , 'Pizza', 22, 55);
INSERT INTO products VALUES (5503 , 'Pasta with chicken and bacon', 24, 55);
INSERT INTO products VALUES (5504 , 'Milanese spaghetti', 23, 55);
INSERT INTO products VALUES (5505 , 'Eggplant rolls', 19, 55);
-- Products (beverage)
INSERT INTO products VALUES (6601 , 'Still water', 3, 66);
INSERT INTO products VALUES (6602 , 'Coca-Cola', 5, 66);
INSERT INTO products VALUES (6603 , 'Aloe vera drink', 10, 66);
INSERT INTO products VALUES (6604 , 'Cappy nectar', 6, 66);
INSERT INTO products VALUES (6605 , 'Fanta', 5, 66);

-- Orders
INSERT INTO orders VALUES (1, '2017-04-15', 2, 42, 4401, 1);
INSERT INTO orders VALUES (2 ,'2017-04-15', 1, 6, 6604, 2);
INSERT INTO orders VALUES (3 ,'2017-04-12', 3, 66 ,4404, 3);
INSERT INTO orders VALUES (4 ,'2017-04-13', 1, 19, 2204, 4);
INSERT INTO orders VALUES (5 ,'2017-04-22', 1,27, 3301, 5);
INSERT INTO orders VALUES (6 ,'2017-05-19', 2, 34, 4401, 6);
INSERT INTO orders VALUES (7 ,'2017-05-23', 2,42, 2201, 7);
INSERT INTO orders VALUES (8 ,'2017-05-19', 1, 5 ,6604, 8);
INSERT INTO orders VALUES (9 ,'2017-05-12',1,10,6603, 9);
INSERT INTO orders VALUES (10 ,'2017-05-23',1, 66, 5502, 10);
INSERT INTO orders VALUES (11 ,'2017-05-30',1,22, 4404, 15);
INSERT INTO orders VALUES (12 ,'2017-06-02', 1,21, 3304, 16);

-- Deliveries
INSERT INTO deliveries VALUES (001, '2017-03-14', '13:40', 031);
INSERT INTO deliveries VALUES (002,'2017-03-15','12:50',031);
INSERT INTO deliveries VALUES (003,'2017-04-18','16:00',032);
INSERT INTO deliveries VALUES (004,'2017-04-18','17:30',032 );
INSERT INTO deliveries VALUES (005,'2017-04-19','08:00',031);
INSERT INTO deliveries VALUES (006,'2017-04-19','10:45', 031);
INSERT INTO deliveries VALUES (007,'2017-04-21','15:15',032);
INSERT INTO deliveries VALUES (008,'2017-04-21','22:30', 031);
INSERT INTO deliveries VALUES (009,'2017-04-23','14:10', 032);
INSERT INTO deliveries VALUES (010, '2017-04-24','09:20',031);

-- Employees
INSERT INTO employees VALUES (011, 'Waiter', 'Alex Manastireanu', 0759662745, 1600);
INSERT INTO employees VALUES (012, 'Waiter', 'Bojoga Catalina', 075833897, 1600);
INSERT INTO employees VALUES (013, 'Waiter', 'Deorde Bianca', 07645878952, 1600);
INSERT INTO employees VALUES (014, 'Waiter', 'Fronea Andreea', 0759662123, 1600);
INSERT INTO employees VALUES (015, 'Waiter', 'Cojocaru Andrei', 0759662879, 1600);
INSERT INTO employees VALUES (021, 'Chef', 'Ionescu Miruna', 0759678655, 1850);
INSERT INTO employees VALUES (022, 'Chef', 'Munteanu Bogdan', 0752486585, 1850);
INSERT INTO employees VALUES (031, 'Driver', 'Murarasu Adi', 0752657899, 1300);
INSERT INTO employees VALUES (032, 'Driver', 'Darie Andrei', 0754514236, 1300);
INSERT INTO employees VALUES (041, 'Cashier', 'Ababei Ionela', 0759662852, 1000);
INSERT INTO employees VALUES (042, 'Cashier', 'Dospinescu Mihai', 0729662878, 1000);
INSERT INTO employees VALUES (043, 'Cashier', 'Popecu Alina', 0759112845, 1000);
INSERT INTO employees VALUES (044, 'Cashier', 'Chelariu Alexandra', 074967873, 1000);


-- Menus
INSERT INTO menus VALUES (11, 'Romanian');
INSERT INTO menus VALUES (22, 'Romanian Vegetarian');
INSERT INTO menus VALUES (33, 'Greek');
INSERT INTO menus VALUES (44, 'Chinese');
INSERT INTO menus VALUES (55, 'Italian');
INSERT INTO menus VALUES (66, 'Beverages');

-- Cashier
INSERT INTO cashier VALUES (123, 75, '2017-01-14', '13:16', 041);
INSERT INTO cashier VALUES (321, 64, '2017-01-16', '14:30', 041);
INSERT INTO cashier VALUES (124, 83, '2017-02-12', '12:00', 041);
INSERT INTO cashier VALUES (421, 56, '2017-02-17', '18:15', 041);
INSERT INTO cashier VALUES (125, 60, '2017-03-10', '17:45', 041);
INSERT INTO cashier VALUES (521, 48, '2017-03-26', '13:50', 041);
INSERT INTO cashier VALUES (126, 72, '2017-04-15', '10:16', 031);
INSERT INTO cashier VALUES (621, 75, '2017-04-15', '15:35', 041);
INSERT INTO cashier VALUES (127, 63, '2017-04-15', '14:10', 041);
INSERT INTO cashier VALUES (721, 90, '2017-05-10', '13:00', 041);
INSERT INTO cashier VALUES (128, 98, '2017-04-15', '18:10', 041);
INSERT INTO cashier VALUES (821, 55, '2017-05-10', '19:00', 041);
INSERT INTO cashier VALUES (129, 68, '2017-03-26', '20:15', 041);
INSERT INTO cashier VALUES (921, 89, '2017-05-10', '13:30', 041);

-- Reservations
INSERT INTO reservations VALUES (501, '2017-01-12', '10:10', 50, 041, 1);
INSERT INTO reservations VALUES (502, '2017-01-12', '12:45', 45, 041, 2);
INSERT INTO reservations VALUES (503, '2017-02-16', '08:15', 30, 042, 3);
INSERT INTO reservations VALUES (504, '2017-02-28', '10:50', 50, 042, 4);
INSERT INTO reservations VALUES (505, '2017-02-28', '09:50', 25, 043, 5);
INSERT INTO reservations VALUES (506, '2017-03-15', '12:30', 50, 043, 5);
INSERT INTO reservations VALUES (507, '2017-03-15', '10:25', 50, 043, 6);
INSERT INTO reservations VALUES (508, '2017-03-18', '14:55', 45, 043, 7);
INSERT INTO reservations VALUES (509, '2017-03-15', '17:12', 50, 043, 8);
INSERT INTO reservations VALUES (510, '2017-03-25', '15:16', 50, 044, 9); 
INSERT INTO reservations VALUES (511, '2017-03-28', '17:25', 45, 041, 10);
INSERT INTO reservations VALUES (512, '2017-04-15', '13:12', 45, 042, 11);
INSERT INTO reservations VALUES (513, '2017-04-16', '12:18', 40, 044, 12); 
INSERT INTO reservations VALUES (514, '2017-04-17', '15:12', 45, 043, 13);
INSERT INTO reservations VALUES (515, '2017-05-05', '11:22', 35, 041, 14);
INSERT INTO reservations VALUES (516, '2017-05-12', '12:12', 50, 041, 15);
INSERT INTO reservations VALUES (517, '2017-05-12', '20:12', 30, 043, 16);
INSERT INTO reservations VALUES (518, '2017-05-15', '08:15', 50, 043, 17);
INSERT INTO reservations VALUES (519, '2017-05-15', '12:00', 40, 044, 18);
INSERT INTO reservations VALUES (520, '2017-05-18', '09:20', 40, 042, 19);
INSERT INTO reservations VALUES (521, '2017-05-19', '12:12', 55, 042, 20);
INSERT INTO reservations VALUES (522, '2017-05-20', '13:30', 50, 041, 2);
INSERT INTO reservations VALUES (523, '2017-05-22', '13:42', 40, 044, 8);
INSERT INTO reservations VALUES (524, '2017-05-22', '16:40', 30, 042, 1);
INSERT INTO reservations VALUES (525, '2017-05-22', '18:11', 55, 044, 3);
INSERT INTO reservations VALUES (526, '2017-05-22', '18:40', 35, 042, 7);
INSERT INTO reservations VALUES (527, '2017-05-22', '20:00', 40, 041, 11);
INSERT INTO reservations VALUES (528, '2017-05-23', '16:40', 30, 042, 1);
INSERT INTO reservations VALUES (529, '2017-05-23', '17:50', 45, 044, 10);
INSERT INTO reservations VALUES (530, '2017-05-25', '14:40', 35, 042, 19);
INSERT INTO reservations VALUES (531, '2017-05-27', '19:11', 50, 041, 15);

-- Canceled Reservations
INSERT INTO canceled_reservations VALUES (101, 'Personal', 50, 516);
INSERT INTO canceled_reservations VALUES (102,'Personal', 45, 511);
INSERT INTO canceled_reservations VALUES (103,'Personal', 40, 513);
INSERT INTO canceled_reservations VALUES (104,'Personal', 45, 508);
INSERT INTO canceled_reservations VALUES (105,'Personal', 40, 523);
INSERT INTO canceled_reservations VALUES (106,'Personal', 30, 524);
INSERT INTO canceled_reservations VALUES (107,'Personal', 55, 525);
INSERT INTO canceled_reservations VALUES (108,'Personal', 35, 526);
INSERT INTO canceled_reservations VALUES (109,'Personal', 50, 531);

-- Rented Halls
INSERT INTO rented_halls VALUES (101, 'Rossini', 40, 1500, 1);
INSERT INTO rented_halls VALUES (102, 'Verdini', 60, 1800,2);
INSERT INTO rented_halls VALUES (103, 'Eminescu', 80, 2000,3);
INSERT INTO rented_halls VALUES (104, 'Creanga', 100, 2300,4);
INSERT INTO rented_halls VALUES (105, 'Eminescu', 80, 2000,5);
INSERT INTO rented_halls VALUES (106, 'Verdini', 60, 1800,6);
INSERT INTO rented_halls VALUES (107, 'Eminescu', 80, 2000,7);
INSERT INTO rented_halls VALUES (108, 'Rossini', 40, 1500,8);
INSERT INTO rented_halls VALUES (109, 'Eminescu', 80, 2000,9);
INSERT INTO rented_halls VALUES (110, 'Rossini', 40, 1500,10);
INSERT INTO rented_halls VALUES (111,'Eminescu',80, 2000,1);
INSERT INTO rented_halls VALUES (112,'Verdini',60, 1800,1);
INSERT INTO rented_halls VALUES (113,'Creanga',100, 2300,1);
