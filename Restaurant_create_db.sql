DROP DATABASE IF EXISTS `Restaurant`;
CREATE DATABASE `Restaurant`;
USE `Restaurant`;

CREATE TABLE IF NOT EXISTS `customer` (
  `customerID` numeric NOT NULL UNIQUE PRIMARY KEY,
  `name` varchar(500) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone` numeric NOT NULL
);

CREATE TABLE IF NOT EXISTS `orders` (
  `oderID` numeric NOT NULL PRIMARY KEY,
  `date` date NOT NULL,
  `quantity` numeric NOT NULL,
  `productID` numeric NOT NULL,
  `customerID` numeric NOT NULL,
  `employeeID` numeric NOT NULL
);

CREATE TABLE IF NOT EXISTS `product` (
  `productID` numeric NOT NULL UNIQUE PRIMARY KEY,
  `name` varchar(500) NOT NULL,
  `description` varchar(500) NOT NULL,
  `price` decimal NOT NULL
);

CREATE TABLE IF NOT EXISTS `cashier` (
  `cashierID` numeric NOT NULL UNIQUE PRIMARY KEY,
  `method` varchar(500) NOT NULL,
  `employeeID` numeric NOT NULL
);

CREATE TABLE IF NOT EXISTS `canceled_reservation` (
  `cancelID` numeric NOT NULL UNIQUE PRIMARY KEY,
  `reason` varchar(500),
  `reservationID` numeric NOT NULL
);

CREATE TABLE IF NOT EXISTS `employee` (
  `employeeID` numeric NOT NULL UNIQUE PRIMARY KEY,
  `name` varchar(500) NOT NULL,
  `position` varchar(500) NOT NULL,
  `salary` decimal NOT NULL
);

CREATE TABLE IF NOT EXISTS `table_reservation` (
  `reservationID` numeric NOT NULL UNIQUE PRIMARY KEY,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `employeeID` numeric NOT NULL,
  `customerID` numeric NOT NULL
);

CREATE TABLE IF NOT EXISTS `feedback` (
  `feedbackID` numeric NOT NULL UNIQUE PRIMARY KEY,
  `rating` numeric NOT NULL,
  `date` date NOT NULL,
  `customerID` numeric NOT NULL
);

CREATE TABLE IF NOT EXISTS `delivery` (
  `deliveryID` numeric NOT NULL UNIQUE PRIMARY KEY,
  `time` time NOT NULL,
  `employeeID` numeric NOT NULL
);

-- Customers
INSERT INTO customer VALUES (1, 'Popescu Ion', 'Painter St, No. 30', 0748334578);
INSERT INTO customer VALUES (2, 'Popescu Viorel', 'Happiness St, No. 15', 0748357574);
INSERT INTO customer VALUES (3, 'Dumitrescu Maria', 'str. Tineretului, nr 12', 0761543698);
INSERT INTO customer VALUES (4, 'Georgescu Angelica', 'str. Nucilor, nr 20', 0789663181);
INSERT INTO customer VALUES (5, 'Pantia Alexandra', 'str. George Cosbuc, nr 22',0724568791);
INSERT INTO customer VALUES (6, 'Bucur Mariana','str. Salcamilor, nr 19', 0747893216);
INSERT INTO customer VALUES (7, 'Apetroaie Daniel', 'str. Eminescu, nr 35', 0761214154);
INSERT INTO customer VALUES (8, 'Sava Bianca','str. Trandafirilor, nr 39',0723236936);
INSERT INTO customer VALUES (9, 'Pal Andreea', 'str. Porumbeilor, nr 32',074833965);
INSERT INTO customer VALUES (10, 'Martinas Ramona', 'str. Stejar, nr 11',0748568452);
INSERT INTO customer VALUES (11, 'Bejan Ioana', 'str. Stefan cel Mare, nr 21', 0768765984);
INSERT INTO customer VALUES (12, 'Antoci Dadiana', 'str. Armoniei, nr 12', 0725748956);
INSERT INTO customer VALUES (13, 'Lazar Antonia', 'str. Independetei, nr 55', 0741212546);
INSERT INTO customer VALUES (14, 'Boicu Daniela', 'str. Crisan, nr 76', 0786693233 );
INSERT INTO customer VALUES (15, 'Tutuianu Carmen', 'str. Crinului, nr 87', 0744558796 );
INSERT INTO customer VALUES (16, 'Rusu Georgiana', 'str. Horea, nr 98', 0755589978 );
INSERT INTO customer VALUES (17, 'Matei Antoneta', 'str. Zorilor, nr 12', 0766693322 );
INSERT INTO customer VALUES (18, 'Rusu Eliza', 'str. Pacii, nr 31', 0784561234 );                      
INSERT INTO customer VALUES (19, 'Dimisca Paul', 'str. Bradului, nr 95', 0721145968);
INSERT INTO customer VALUES (20, 'Tudurache Luiza', 'str. Lalelor, nr 48', 0743889787);

-- Products
-- Products (Romanian)
INSERT INTO product VALUES (1100, 'Stuffed cabbage rolls', 'Traditional Romanian dish with cabbage leaves stuffed with a mixture of meat and rice.', 15);
INSERT INTO product VALUES (1102, 'Tripe soup', 'Creamy soup made with beef tripe, a Romanian specialty.', 20);
INSERT INTO product VALUES (1103, 'Smoked sausages', 'Savory and flavorful smoked pork sausages.', 13);
INSERT INTO product VALUES (1104, 'Pork feast', 'A hearty dish featuring assorted cuts of pork prepared in various styles.', 17);
INSERT INTO product VALUES (1105, 'Bean soup with smoked pork', 'Rustic bean soup flavored with smoked pork, a comfort food classic.', 23);
-- Products (Greek)
INSERT INTO product VALUES (1106, 'Meat pie', 'Richly filled pie made with minced meat and flaky pastry.', 27);
INSERT INTO product VALUES (1107, 'Eggplant in tomato sauce', 'Tender eggplant slices cooked in a rich tomato sauce.', 24);
INSERT INTO product VALUES (1108, 'Sweet and sour chicken', 'A balance of tangy and sweet flavors in this chicken dish.', 21);
INSERT INTO product VALUES (1109, 'Sweet and sour chicken', 'A balance of tangy and sweet flavors in this chicken dish.', 21);
INSERT INTO product VALUES (1110, 'Sweet and sour chicken', 'A balance of tangy and sweet flavors in this chicken dish.', 21);
-- Products (Chinese)
INSERT INTO product VALUES (1111, 'Sweet and sour chicken', 'A balance of tangy and sweet flavors in this chicken dish.', 21);
INSERT INTO product VALUES (1112, 'Chinese noodles', 'Stir-fried noodles with vegetables and your choice of protein.', 18);
INSERT INTO product VALUES (1113, 'Greek fava', 'Smooth yellow split pea puree with olive oil and lemon.', 28);
INSERT INTO product VALUES (1114, 'Fresh tuna salad', 'Light and healthy salad with fresh tuna and greens.', 22);
INSERT INTO product VALUES (1115, 'Meatball soup Greek style', 'Delicious soup with meatballs and vegetables in a flavorful broth.', 30);
-- Products (Italian)
INSERT INTO product VALUES (1116, 'Lasagna with Bolognese sauce', 'Layered pasta with rich Bolognese sauce and cheese.', 25);
INSERT INTO product VALUES (1117, 'Pizza', 'Classic Italian dish with various toppings on a thin crust.', 22);
INSERT INTO product VALUES (1118, 'Pasta with chicken and bacon', 'Creamy pasta tossed with grilled chicken and crispy bacon.', 24);
INSERT INTO product VALUES (1119, 'Milanese spaghetti', 'Spaghetti cooked with Milanese-style flavors.', 23);
INSERT INTO product VALUES (1120, 'Eggplant rolls', 'Baked eggplant rolls stuffed with cheese and herbs.', 19);
-- Products (beverage)
INSERT INTO product VALUES (1121, 'Still water', 'Pure and refreshing still water.', 3);
INSERT INTO product VALUES (1122, 'Coca-Cola', 'Famous carbonated soft drink.', 5);
INSERT INTO product VALUES (1123, 'Aloe vera drink', 'Refreshing drink infused with aloe vera.', 10);
INSERT INTO product VALUES (1124, 'Cappy nectar', 'Fruity nectar drink with rich flavor.', 6);
INSERT INTO product VALUES (1125, 'Fanta', 'Orange-flavored carbonated soft drink.', 5);

-- Employees
INSERT INTO employee VALUES (101, 'George Ionescu', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (102, 'Adrian Popa', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (103, 'Elena Stancu', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (104, 'Cristina Matei', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (105, 'Dan Mihai', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (106, 'Simona Ene', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (107, 'Victor Tudor', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (108, 'Ana Popescu', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (109, 'Ioan Toma', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (110, 'Maria Radu', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (111, 'Stefan Dumitru', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (112, 'Laura Neagu', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (113, 'Roxana Calin', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (114, 'Paul Ene', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (115, 'Andrei Pavel', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (116, 'Claudia Iordache', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (117, 'Bogdan Gheorghe', 'Sales Associate', 2500.00);
INSERT INTO employee VALUES (118, 'Florina Costache', 'Sales Associate', 2500.00);

-- Orders
INSERT INTO orders VALUES (1, '2023-12-01', 2, 1100, 1, 101);
INSERT INTO orders VALUES (2, '2023-12-01', 1, 1102, 1, 101);
INSERT INTO orders VALUES (3, '2023-12-02', 1, 1103, 2, 102);
INSERT INTO orders VALUES (4, '2023-12-03', 3, 1104, 3, 103);
INSERT INTO orders VALUES (5, '2023-12-04', 2, 1105, 3, 103);
INSERT INTO orders VALUES (6, '2023-12-05', 1, 1106, 4, 104);
INSERT INTO orders VALUES (7, '2023-12-05', 1, 1107, 4, 104);
INSERT INTO orders VALUES (8, '2023-12-06', 1, 1108, 5, 105);
INSERT INTO orders VALUES (9, '2023-12-06', 2, 1109, 5, 105);
INSERT INTO orders VALUES (10, '2023-12-07', 1, 1110, 6, 106);
INSERT INTO orders VALUES (11, '2023-12-08', 1, 1111, 6, 106);
INSERT INTO orders VALUES (12, '2023-12-09', 1, 1112, 7, 107);
INSERT INTO orders VALUES (13, '2023-12-09', 2, 1113, 7, 107);
INSERT INTO orders VALUES (14, '2023-12-10', 1, 1114, 8, 108);
INSERT INTO orders VALUES (15, '2023-12-10', 1, 1115, 8, 108);
INSERT INTO orders VALUES (16, '2023-12-11', 3, 1116, 9, 109);
INSERT INTO orders VALUES (17, '2023-12-12', 1, 1117, 10, 110);
INSERT INTO orders VALUES (18, '2023-12-12', 2, 1118, 10, 110);
INSERT INTO orders VALUES (19, '2023-12-13', 1, 1119, 11, 111);
INSERT INTO orders VALUES (20, '2023-12-14', 2, 1120, 12, 112);
INSERT INTO orders VALUES (21, '2023-12-15', 1, 1121, 13, 113);
INSERT INTO orders VALUES (22, '2023-12-15', 1, 1122, 13, 113);
INSERT INTO orders VALUES (23, '2023-12-16', 1, 1123, 14, 114);
INSERT INTO orders VALUES (24, '2023-12-17', 2, 1124, 15, 115);
INSERT INTO orders VALUES (25, '2023-12-17', 1, 1125, 15, 115);
INSERT INTO orders VALUES (26, '2023-12-18', 1, 1100, 16, 116);
INSERT INTO orders VALUES (27, '2023-12-18', 2, 1102, 16, 116);
INSERT INTO orders VALUES (28, '2023-12-19', 1, 1103, 17, 117);
INSERT INTO orders VALUES (29, '2023-12-20', 1, 1104, 18, 118);
INSERT INTO orders VALUES (30, '2023-12-20', 2, 1105, 18, 118);

-- Delivery
INSERT INTO delivery VALUES (1, '12:30:00', 101);
INSERT INTO delivery VALUES (2, '14:15:00', 102);
INSERT INTO delivery VALUES (3, '16:45:00', 103);
INSERT INTO delivery VALUES (4, '18:00:00', 104);
INSERT INTO delivery VALUES (5, '19:30:00', 105);
INSERT INTO delivery VALUES (6, '13:15:00', 106);
INSERT INTO delivery VALUES (7, '15:45:00', 107);
INSERT INTO delivery VALUES (8, '17:00:00', 108);
INSERT INTO delivery VALUES (9, '11:45:00', 109);
INSERT INTO delivery VALUES (10, '10:30:00', 110);
INSERT INTO delivery VALUES (11, '13:00:00', 101);
INSERT INTO delivery VALUES (12, '14:30:00', 102);
INSERT INTO delivery VALUES (13, '16:00:00', 103);
INSERT INTO delivery VALUES (14, '18:45:00', 104);
INSERT INTO delivery VALUES (15, '20:00:00', 105);

-- Cashier
INSERT INTO cashier VALUES (1, 'Credit Card', 101);
INSERT INTO cashier VALUES (2, 'Cash', 102);
INSERT INTO cashier VALUES (3, 'Mobile Payment', 103);
INSERT INTO cashier VALUES (4, 'Credit Card', 104);
INSERT INTO cashier VALUES (5, 'Cash', 105);
INSERT INTO cashier VALUES (6, 'Mobile Payment', 106);
INSERT INTO cashier VALUES (7, 'Credit Card', 107);
INSERT INTO cashier VALUES (8, 'Cash', 108);
INSERT INTO cashier VALUES (9, 'Mobile Payment', 109);
INSERT INTO cashier VALUES (10, 'Credit Card', 110);
INSERT INTO cashier VALUES (11, 'Cash', 101);
INSERT INTO cashier VALUES (12, 'Credit Card', 102);
INSERT INTO cashier VALUES (13, 'Mobile Payment', 103);
INSERT INTO cashier VALUES (14, 'Cash', 104);
INSERT INTO cashier VALUES (15, 'Mobile Payment', 105);

-- Table_reservation
INSERT INTO table_reservation VALUES (1, '2023-12-05', '18:30:00', 106, 1);
INSERT INTO table_reservation VALUES (2, '2023-12-06', '20:00:00', 107, 2);
INSERT INTO table_reservation VALUES (3, '2023-12-07', '19:15:00', 108, 3);
INSERT INTO table_reservation VALUES (4, '2023-12-08', '21:00:00', 109, 4);
INSERT INTO table_reservation VALUES (5, '2023-12-09', '18:45:00', 110, 5);
INSERT INTO table_reservation VALUES (6, '2023-12-10', '18:30:00', 111, 6);
INSERT INTO table_reservation VALUES (7, '2023-12-11', '19:00:00', 112, 7);
INSERT INTO table_reservation VALUES (8, '2023-12-12', '20:15:00', 113, 8);
INSERT INTO table_reservation VALUES (9, '2023-12-13', '19:30:00', 114, 9);
INSERT INTO table_reservation VALUES (10, '2023-12-14', '21:00:00', 115, 10);
INSERT INTO table_reservation VALUES (11, '2023-12-15', '18:30:00', 106, 11);
INSERT INTO table_reservation VALUES (12, '2023-12-16', '20:00:00', 107, 12);
INSERT INTO table_reservation VALUES (13, '2023-12-17', '19:15:00', 108, 13);
INSERT INTO table_reservation VALUES (14, '2023-12-18', '20:30:00', 109, 14);
INSERT INTO table_reservation VALUES (15, '2023-12-19', '21:15:00', 110, 15);

-- Canceled_reservation
INSERT INTO canceled_reservation VALUES (1, 'No show', 1);
INSERT INTO canceled_reservation VALUES (2, 'Customer request', 2);
INSERT INTO canceled_reservation VALUES (3, 'Emergency', 3);
INSERT INTO canceled_reservation VALUES (4, 'Weather conditions', 4);
INSERT INTO canceled_reservation VALUES (5, 'Double booking', 5);
INSERT INTO canceled_reservation VALUES (6, 'Illness', 6);
INSERT INTO canceled_reservation VALUES (7, 'Schedule conflict', 7);
INSERT INTO canceled_reservation VALUES (8, 'Travel delays', 8);
INSERT INTO canceled_reservation VALUES (9, 'Restaurant closure', 9);
INSERT INTO canceled_reservation VALUES (10, 'Family emergency', 10);
INSERT INTO canceled_reservation VALUES (11, 'Transportation issues', 11);
INSERT INTO canceled_reservation VALUES (12, 'Missed reservation time', 12);
INSERT INTO canceled_reservation VALUES (13, 'Error in reservation', 13);
INSERT INTO canceled_reservation VALUES (14, 'Accident on route', 14);
INSERT INTO canceled_reservation VALUES (15, 'Double booking error', 15);

-- Feedback
INSERT INTO feedback VALUES (1, 5, '2023-12-04', 1);
INSERT INTO feedback VALUES (2, 4, '2023-12-05', 2);
INSERT INTO feedback VALUES (3, 3, '2023-12-06', 3);
INSERT INTO feedback VALUES (4, 5, '2023-12-07', 4);
INSERT INTO feedback VALUES (5, 2, '2023-12-08', 5);
INSERT INTO feedback VALUES (6, 4, '2023-12-09', 6);
INSERT INTO feedback VALUES (7, 5, '2023-12-10', 7);
INSERT INTO feedback VALUES (8, 3, '2023-12-11', 8);
INSERT INTO feedback VALUES (9, 4, '2023-12-12', 9);
INSERT INTO feedback VALUES (10, 5, '2023-12-13', 10);
INSERT INTO feedback VALUES (11, 2, '2023-12-14', 11);
INSERT INTO feedback VALUES (12, 3, '2023-12-15', 12);
INSERT INTO feedback VALUES (13, 4, '2023-12-16', 13);
INSERT INTO feedback VALUES (14, 5, '2023-12-17', 14);
INSERT INTO feedback VALUES (15, 3, '2023-12-18', 15);




