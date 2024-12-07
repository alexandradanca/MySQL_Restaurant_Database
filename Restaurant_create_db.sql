DROP DATABASE IF EXISTS `Restaurant`;
CREATE DATABASE `Restaurant`;
USE `Restaurant`;

CREATE TABLE IF NOT EXISTS `customer` (
  `customerID` numeric NOT NULL UNIQUE PRIMARY KEY,
  `name` varchar(500) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone` numeric NOT NULL,
  `gender` varchar(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS `orders` (
  `orderID` numeric NOT NULL PRIMARY KEY,
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
  `deliveryID` numeric NOT NULL
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
  `salary` decimal NOT NULL,
  `gender` varchar(2) NOT NULL
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
INSERT INTO customer VALUES (1, 'Popescu Ion', 'Painter St, No. 30', 0748334578, 'm');
INSERT INTO customer VALUES (2, 'Popescu Viorel', 'Happiness St, No. 15', 0748357574, 'm');
INSERT INTO customer VALUES (3, 'Dumitrescu Maria', 'str. Tineretului, nr 12', 0761543698, 'f');
INSERT INTO customer VALUES (4, 'Georgescu Angelica', 'str. Nucilor, nr 20', 0789663181, 'f');
INSERT INTO customer VALUES (5, 'Pantia Alexandra', 'str. George Cosbuc, nr 22',0724568791, 'f');
INSERT INTO customer VALUES (6, 'Bucur Mariana','str. Salcamilor, nr 19', 0747893216, 'f');
INSERT INTO customer VALUES (7, 'Apetroaie Daniel', 'str. Eminescu, nr 35', 0761214154, 'm');
INSERT INTO customer VALUES (8, 'Sava Bianca','str. Trandafirilor, nr 39',0723236936, 'f');
INSERT INTO customer VALUES (9, 'Pal Andreea', 'str. Porumbeilor, nr 32',074833965, 'f');
INSERT INTO customer VALUES (10, 'Martinas Ramona', 'str. Stejar, nr 11',0748568452, 'f');
INSERT INTO customer VALUES (11, 'Bejan Ioana', 'str. Stefan cel Mare, nr 21', 0768765984, 'f');
INSERT INTO customer VALUES (12, 'Antoci Dadiana', 'str. Armoniei, nr 12', 0725748956, 'f');
INSERT INTO customer VALUES (13, 'Lazar Antonia', 'str. Independetei, nr 55', 0741212546, 'f');
INSERT INTO customer VALUES (14, 'Boicu Daniela', 'str. Crisan, nr 76', 0786693233, 'f');
INSERT INTO customer VALUES (15, 'Tutuianu Carmen', 'str. Crinului, nr 87', 0744558796, 'f');
INSERT INTO customer VALUES (16, 'Rusu Georgiana', 'str. Horea, nr 98', 0755589978, 'f');
INSERT INTO customer VALUES (17, 'Matei Antoneta', 'str. Zorilor, nr 12', 0766693322, 'f');
INSERT INTO customer VALUES (18, 'Rusu Eliza', 'str. Pacii, nr 31', 0784561234, 'f');                      
INSERT INTO customer VALUES (19, 'Dimisca Paul', 'str. Bradului, nr 95', 0721145968, 'm');
INSERT INTO customer VALUES (20, 'Tudurache Luiza', 'str. Lalelor, nr 48', 0743889787, 'f');
INSERT INTO customer VALUES (21, 'Ionescu Ana', 'Str. Florilor, Nr. 25', 0745891234, 'f');
INSERT INTO customer VALUES (22, 'Marian Andrei', 'Str. Victoriei, Nr. 19', 0723459876, 'm');
INSERT INTO customer VALUES (23, 'Lungu Daniela', 'Str. Salciei, Nr. 10', 0769876543, 'f');
INSERT INTO customer VALUES (24, 'Dumitru Cristian', 'Str. Teiului, Nr. 15', 0756432198, 'm');
INSERT INTO customer VALUES (25, 'Petrescu Maria', 'Str. Dunării, Nr. 3', 0746589231, 'f');
INSERT INTO customer VALUES (26, 'Popa Ioan', 'Str. Zorilor, Nr. 47', 0764210987, 'm');
INSERT INTO customer VALUES (27, 'Mihai Elena', 'Str. Aviatorilor, Nr. 8', 0732145698, 'f');
INSERT INTO customer VALUES (28, 'Stanciu Mihai', 'Str. Nufărului, Nr. 12', 0723987456, 'm');
INSERT INTO customer VALUES (29, 'Vasilescu Anca', 'Str. Crinului, Nr. 20', 0745123689, 'f');
INSERT INTO customer VALUES (30, 'Badea Ioana', 'Str. Castanilor, Nr. 5', 0756123987, 'f');
INSERT INTO customer VALUES (31, 'Lazăr Paul', 'Str. Stejarului, Nr. 11', 0769456123, 'm');
INSERT INTO customer VALUES (32, 'Georgescu Corina', 'Str. Lalelelor, Nr. 13', 0723159847, 'f');
INSERT INTO customer VALUES (33, 'Nistor Alexandru', 'Str. Brândușelor, Nr. 4', 0745698234, 'm');
INSERT INTO customer VALUES (34, 'Iliescu Diana', 'Str. Vișinilor, Nr. 29', 0732145689, 'f');
INSERT INTO customer VALUES (35, 'Preda Cristian', 'Str. Eroilor, Nr. 18', 0724589631, 'm');
INSERT INTO customer VALUES (36, 'Simion Delia', 'Str. Primăverii, Nr. 22', 0746985123, 'f');
INSERT INTO customer VALUES (37, 'Toma Ștefan', 'Str. Armoniei, Nr. 6', 0732459861, 'm');
INSERT INTO customer VALUES (38, 'Barbu Ana-Maria', 'Str. Libertății, Nr. 9', 0746987456, 'f');
INSERT INTO customer VALUES (39, 'Enache George', 'Str. Fagului, Nr. 14', 0756987452, 'm');
INSERT INTO customer VALUES (40, 'Ciobanu Ioana', 'Str. Merilor, Nr. 17', 0731245789, 'f');
INSERT INTO customer VALUES (41, 'Dobre Andreea', 'Str. Salcâmilor, Nr. 30', 0721456987, 'f');
INSERT INTO customer VALUES (42, 'Popescu Vlad', 'Str. Dorobanților, Nr. 16', 0762145698, 'm');
INSERT INTO customer VALUES (43, 'Avram Florina', 'Str. Independenței, Nr. 8', 0745123967, 'f');
INSERT INTO customer VALUES (44, 'Grigore Paul', 'Str. Bucuriei, Nr. 2', 0756984231, 'm');
INSERT INTO customer VALUES (45, 'Savu Ioana', 'Str. Liniștii, Nr. 27', 0732198547, 'f');
INSERT INTO customer VALUES (46, 'Matei Sorin', 'Str. Albatrosului, Nr. 19', 0723458967, 'm');
INSERT INTO customer VALUES (47, 'Dragomir Bianca', 'Str. Soarelui, Nr. 10', 0746987452, 'f');
INSERT INTO customer VALUES (48, 'Cojocaru Cristian', 'Str. Speranței, Nr. 28', 0762145697, 'm');
INSERT INTO customer VALUES (49, 'Rusu Cătălina', 'Str. Gării, Nr. 33', 0732148965, 'f');
INSERT INTO customer VALUES (50, 'Neagu Iulian', 'Str. Fericirii, Nr. 21', 0725698475, 'm');
INSERT INTO customer VALUES (51, 'Costache Dana', 'Str. Păcii, Nr. 31', 0743126985, 'f');
INSERT INTO customer VALUES (52, 'Antonescu Șerban', 'Str. Gloriei, Nr. 12', 0756984123, 'm');
INSERT INTO customer VALUES (53, 'Constantin Laura', 'Str. Mărășești, Nr. 7', 0731456987, 'f');
INSERT INTO customer VALUES (54, 'Iordache Marius', 'Str. Rozelor, Nr. 11', 0762456987, 'm');
INSERT INTO customer VALUES (55, 'Păun Florin', 'Str. Frunzei, Nr. 13', 0721456987, 'm');
INSERT INTO customer VALUES (56, 'Niculescu Adriana', 'Str. Tineretului, Nr. 20', 0745698471, 'f');
INSERT INTO customer VALUES (57, 'Năstase Cosmin', 'Str. Eminescu, Nr. 6', 0732456981, 'm');
INSERT INTO customer VALUES (58, 'Voinea Andreea', 'Str. Ciprian Porumbescu, Nr. 15', 0725698472, 'f');
INSERT INTO customer VALUES (59, 'Stroe Alex', 'Str. I.L. Caragiale, Nr. 4', 0756984125, 'm');
INSERT INTO customer VALUES (60, 'Cernat Mihaela', 'Str. Poenari, Nr. 14', 0762145896, 'f');
INSERT INTO customer VALUES (61, 'Petruș Florin', 'Str. Ana Ipătescu, Nr. 3', 0724589632, 'm');
INSERT INTO customer VALUES (62, 'Diaconu Lavinia', 'Str. Banatului, Nr. 27', 0745698235, 'f');
INSERT INTO customer VALUES (63, 'Predoiu Bogdan', 'Str. Ion Creangă, Nr. 19', 0731459862, 'm');
INSERT INTO customer VALUES (64, 'Albescu Camelia', 'Str. Veronica Micle, Nr. 9', 0725698412, 'f');
INSERT INTO customer VALUES (65, 'Călin Nicolae', 'Str. Mihai Eminescu, Nr. 17', 0745698412, 'm');
INSERT INTO customer VALUES (66, 'Moraru Elena', 'Str. George Enescu, Nr. 10', 0732569814, 'f');
INSERT INTO customer VALUES (67, 'Vlad Bogdan', 'Str. Nicolae Iorga, Nr. 20', 0723145896, 'm');
INSERT INTO customer VALUES (68, 'Marinescu Valeria', 'Str. Pictorului, Nr. 22', 0745126985, 'f');
INSERT INTO customer VALUES (69, 'Teodorescu Răzvan', 'Str. Crișan, Nr. 25', 0732145896, 'm');
INSERT INTO customer VALUES (70, 'Manea Larisa', 'Str. Horia, Nr. 18', 0756987412, 'f');

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
INSERT INTO employee VALUES (101, 'George Ionescu', 'Sales Associate', 2300.00, 'm');
INSERT INTO employee VALUES (102, 'Adrian Popa', 'Sales Associate', 2500.00, 'm');
INSERT INTO employee VALUES (103, 'Elena Stancu', 'Sales Associate', 2000.00, 'f');
INSERT INTO employee VALUES (104, 'Cristina Matei', 'Sales Associate', 2200.00, 'f');
INSERT INTO employee VALUES (105, 'Dan Mihai', 'Sales Associate', 2200.00, 'm');
INSERT INTO employee VALUES (106, 'Simona Ene', 'Sales Associate', 2700.00, 'f');
INSERT INTO employee VALUES (107, 'Victor Tudor', 'Sales Associate', 3000.00, 'm');
INSERT INTO employee VALUES (108, 'Ana Popescu', 'Sales Associate', 3000.00, 'f');
INSERT INTO employee VALUES (109, 'Ioan Toma', 'Sales Associate', 2500.00, 'm');
INSERT INTO employee VALUES (110, 'Maria Radu', 'Sales Associate', 2550.00, 'f');
INSERT INTO employee VALUES (111, 'Stefan Dumitru', 'Sales Associate', 2600.00, 'm');
INSERT INTO employee VALUES (112, 'Laura Neagu', 'Sales Associate', 2750.00, 'f');
INSERT INTO employee VALUES (113, 'Roxana Calin', 'Sales Associate', 2500.00, 'f');
INSERT INTO employee VALUES (114, 'Paul Ene', 'Sales Associate', 2500.00, 'm');
INSERT INTO employee VALUES (115, 'Andrei Pavel', 'Sales Associate', 2200.00, 'm');
INSERT INTO employee VALUES (116, 'Claudia Iordache', 'Sales Associate', 2000.00, 'f');
INSERT INTO employee VALUES (117, 'Bogdan Gheorghe', 'Sales Associate', 2300.00, 'm');
INSERT INTO employee VALUES (118, 'Florina Costache', 'Sales Associate', 2500.00, 'f');
INSERT INTO employee VALUES (119, 'Mario Dumitru', 'Sales Associate', 3000.00, 'm');

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
INSERT INTO orders VALUES (24, '2023-12-16', 1, 1104, 14, 114);
INSERT INTO orders VALUES (25, '2023-12-17', 2, 1124, 15, 115);
INSERT INTO orders VALUES (26, '2023-12-17', 1, 1125, 15, 115);
INSERT INTO orders VALUES (27, '2023-12-18', 1, 1100, 16, 116);
INSERT INTO orders VALUES (28, '2023-12-18', 2, 1102, 16, 116);
INSERT INTO orders VALUES (29, '2023-12-19', 1, 1103, 17, 117);
INSERT INTO orders VALUES (30, '2023-12-20', 1, 1104, 18, 118);
INSERT INTO orders VALUES (31, '2023-12-20', 2, 1105, 18, 118);
INSERT INTO orders VALUES (32, '2023-12-20', 3, 1104, 20, 102);
INSERT INTO orders VALUES (33, '2023-12-21', 2, 1105, 21, 103);
INSERT INTO orders VALUES (34, '2023-12-21', 1, 1106, 22, 104);
INSERT INTO orders VALUES (35, '2023-12-22', 2, 1107, 23, 105);
INSERT INTO orders VALUES (36, '2023-12-22', 3, 1108, 24, 106);
INSERT INTO orders VALUES (37, '2023-12-23', 1, 1109, 25, 107);
INSERT INTO orders VALUES (38, '2023-12-23', 1, 1110, 26, 108);
INSERT INTO orders VALUES (39, '2023-12-24', 2, 1111, 27, 109);
INSERT INTO orders VALUES (40, '2023-12-24', 3, 1112, 28, 110);
INSERT INTO orders VALUES (41, '2023-12-25', 1, 1113, 29, 111);
INSERT INTO orders VALUES (42, '2023-12-25', 2, 1114, 30, 112);
INSERT INTO orders VALUES (43, '2023-12-26', 1, 1115, 31, 113);
INSERT INTO orders VALUES (44, '2023-12-26', 2, 1116, 32, 114);
INSERT INTO orders VALUES (45, '2023-12-27', 1, 1117, 33, 115);
INSERT INTO orders VALUES (46, '2023-12-27', 3, 1118, 34, 116);
INSERT INTO orders VALUES (47, '2023-12-28', 2, 1119, 35, 117);
INSERT INTO orders VALUES (48, '2023-12-28', 1, 1120, 36, 118);
INSERT INTO orders VALUES (49, '2023-12-29', 3, 1100, 37, 101);
INSERT INTO orders VALUES (50, '2023-12-29', 2, 1101, 38, 102);
INSERT INTO orders VALUES (52, '2023-12-19', 1, 1101, 17, 117);
INSERT INTO orders VALUES (53, '2023-12-19', 2, 1102, 18, 118);
INSERT INTO orders VALUES (54, '2023-12-20', 1, 1103, 19, 101);

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
INSERT INTO delivery VALUES (16, '12:00:00', 106);
INSERT INTO delivery VALUES (17, '14:45:00', 107);
INSERT INTO delivery VALUES (18, '17:30:00', 108);
INSERT INTO delivery VALUES (19, '19:00:00', 109);
INSERT INTO delivery VALUES (20, '20:30:00', 110);
INSERT INTO delivery VALUES (21, '13:30:00', 101);
INSERT INTO delivery VALUES (22, '15:00:00', 102);
INSERT INTO delivery VALUES (23, '16:15:00', 103);
INSERT INTO delivery VALUES (24, '18:15:00', 104);
INSERT INTO delivery VALUES (25, '19:45:00', 105);
INSERT INTO delivery VALUES (26, '11:00:00', 106);
INSERT INTO delivery VALUES (27, '13:45:00', 107);
INSERT INTO delivery VALUES (28, '15:30:00', 108);
INSERT INTO delivery VALUES (29, '17:45:00', 109);
INSERT INTO delivery VALUES (30, '20:15:00', 110);
INSERT INTO delivery VALUES (31, '12:15:00', 101);
INSERT INTO delivery VALUES (32, '14:00:00', 102);
INSERT INTO delivery VALUES (33, '16:30:00', 103);
INSERT INTO delivery VALUES (34, '18:15:00', 104);
INSERT INTO delivery VALUES (35, '19:00:00', 105);
INSERT INTO delivery VALUES (36, '13:30:00', 106);
INSERT INTO delivery VALUES (37, '15:30:00', 107);
INSERT INTO delivery VALUES (38, '17:00:00', 108);
INSERT INTO delivery VALUES (39, '18:45:00', 109);
INSERT INTO delivery VALUES (40, '20:15:00', 110);
INSERT INTO delivery VALUES (41, '11:45:00', 101);
INSERT INTO delivery VALUES (42, '13:15:00', 102);
INSERT INTO delivery VALUES (43, '14:30:00', 103);
INSERT INTO delivery VALUES (44, '16:45:00', 104);
INSERT INTO delivery VALUES (45, '18:00:00', 105);
INSERT INTO delivery VALUES (46, '19:30:00', 106);
INSERT INTO delivery VALUES (47, '21:00:00', 107);
INSERT INTO delivery VALUES (48, '11:30:00', 108);
INSERT INTO delivery VALUES (49, '13:45:00', 109);
INSERT INTO delivery VALUES (50, '15:15:00', 110);

-- Cashier
INSERT INTO cashier VALUES (1, 'Card', 1);
INSERT INTO cashier VALUES (2, 'Cash', 2);
INSERT INTO cashier VALUES (3, 'Mobile Payment', 3);
INSERT INTO cashier VALUES (4, 'Card', 4);
INSERT INTO cashier VALUES (5, 'Cash', 5);
INSERT INTO cashier VALUES (6, 'Mobile Payment', 6);
INSERT INTO cashier VALUES (7, 'Card', 7);
INSERT INTO cashier VALUES (8, 'Cash', 8);
INSERT INTO cashier VALUES (9, 'Mobile Payment', 9);
INSERT INTO cashier VALUES (10, 'Card', 10);
INSERT INTO cashier VALUES (11, 'Cash', 11);
INSERT INTO cashier VALUES (12, 'Card', 12);
INSERT INTO cashier VALUES (13, 'Mobile Payment', 13);
INSERT INTO cashier VALUES (14, 'Cash', 14);
INSERT INTO cashier VALUES (15, 'Mobile Payment', 15);
INSERT INTO cashier VALUES (16, 'Card', 16);
INSERT INTO cashier VALUES (17, 'Cash', 17);
INSERT INTO cashier VALUES (18, 'Card', 18);
INSERT INTO cashier VALUES (19, 'Cash', 19);
INSERT INTO cashier VALUES (20, 'Card', 20);
INSERT INTO cashier VALUES (21, 'Cash', 21);
INSERT INTO cashier VALUES (22, 'Card', 22);
INSERT INTO cashier VALUES (23, 'Cash', 23);
INSERT INTO cashier VALUES (24, 'Card', 24);
INSERT INTO cashier VALUES (25, 'Cash', 25);
INSERT INTO cashier VALUES (26, 'Card', 26);
INSERT INTO cashier VALUES (27, 'Cash', 27);
INSERT INTO cashier VALUES (28, 'Card', 28);
INSERT INTO cashier VALUES (29, 'Cash', 29);
INSERT INTO cashier VALUES (30, 'Card', 30);
INSERT INTO cashier VALUES (31, 'Cash', 31);
INSERT INTO cashier VALUES (32, 'Card', 32);
INSERT INTO cashier VALUES (33, 'Cash', 33);
INSERT INTO cashier VALUES (34, 'Card', 34);
INSERT INTO cashier VALUES (35, 'Cash', 35);
INSERT INTO cashier VALUES (36, 'Card', 36);
INSERT INTO cashier VALUES (37, 'Cash', 37);
INSERT INTO cashier VALUES (38, 'Card', 38);
INSERT INTO cashier VALUES (39, 'Cash', 39);
INSERT INTO cashier VALUES (40, 'Card', 40);
INSERT INTO cashier VALUES (41, 'Cash', 41);
INSERT INTO cashier VALUES (42, 'Card', 42);
INSERT INTO cashier VALUES (43, 'Cash', 43);
INSERT INTO cashier VALUES (44, 'Card', 44);
INSERT INTO cashier VALUES (45, 'Cash', 45);
INSERT INTO cashier VALUES (46, 'Card', 46);
INSERT INTO cashier VALUES (47, 'Cash', 47);
INSERT INTO cashier VALUES (48, 'Card', 48);
INSERT INTO cashier VALUES (49, 'Cash', 49);
INSERT INTO cashier VALUES (50, 'Card', 50);

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
INSERT INTO table_reservation VALUES (16, '2023-12-05', '17:30:00', 113, 10);
INSERT INTO table_reservation VALUES (17, '2023-12-10', '19:30:00', 106, 4);
INSERT INTO table_reservation VALUES (18, '2023-12-04', '17:30:00', 115, 4);

-- Canceled_reservation
INSERT INTO canceled_reservation VALUES (1, 'Emergency', 13);
INSERT INTO canceled_reservation VALUES (2, 'Customer request', 9);
INSERT INTO canceled_reservation VALUES (3, 'Emergency', 3);
INSERT INTO canceled_reservation VALUES (4, 'Weather conditions', 12);
INSERT INTO canceled_reservation VALUES (5, 'Double booking', 5);
INSERT INTO canceled_reservation VALUES (6, 'Illness', 6);
INSERT INTO canceled_reservation VALUES (7, 'Schedule conflict', 7);
INSERT INTO canceled_reservation VALUES (8, 'Emergency', 12);
INSERT INTO canceled_reservation VALUES (9, 'Schedule conflict', 12);
INSERT INTO canceled_reservation VALUES (10, 'Schedule conflict', 1);
INSERT INTO canceled_reservation VALUES (11, 'Schedule conflict', 4);
INSERT INTO canceled_reservation VALUES (12, 'Schedule conflict', 8);

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




