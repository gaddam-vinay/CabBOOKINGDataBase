DROP DATABASE IF EXISTS `CABSERVICE`;
CREATE SCHEMA `CABSERVICE`;
USE `CABSERVICE`;

DROP TABLE IF EXISTS `Account`;

CREATE TABLE `Account` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255) NOT NULL UNIQUE,
  `Email` varchar(255) NOT NULL UNIQUE,
  `Password` varchar(255) NOT NULL UNIQUE,
  `Password_hint` varchar(255),
  `firstname` varchar(255),
  `lastname` varchar(255)
  
);

LOCK TABLES `Account` WRITE;

INSERT INTO Account ( username,Email,Password ,Password_hint,firstname ,lastname) 
VALUES ('Brunda02','Brunda@gmail.com','Brunda122', 'Brun', 'Mandyam' , 'Brunda');

INSERT INTO Account (username,Email,Password ,Password_hint,firstname,lastname) 
VALUES ('Vinay23','Vinay@gmail.com','Vinay12267', 'Vina', 'Gaddam' , 'Vinay');

INSERT INTO Account (username,Email,Password ,Password_hint,firstname ,lastname) 
VALUES ('Aparna14','Aparna@gmail.com','Aparna1267', 'Apar', 'Agrawal' , 'Aparna');

INSERT INTO Account ( username,Email,Password ,Password_hint,firstname ,lastname) 
VALUES ('Ravi78','Ravi@gmail.com','Ravi3478', 'Ravi', 'Hello' , 'Ravi');

INSERT INTO Account ( username,Email,Password ,Password_hint,firstname ,lastname) 
VALUES ('Raju21','Raju@gmail.com','Raju2021', 'Raju', 'Tatimanu' ,' Raju');

INSERT INTO Account (username,Email,Password ,Password_hint,firstname ,lastname) 
VALUES ('Charan11','Charan@gmail.com','Charan2002', 'Char',' Sahit' , 'Charan');

INSERT INTO Account ( username,Email,Password ,Password_hint,firstname ,lastname) 
VALUES ('Yeswanth02','Yeswanth@gmail.com','Yesh122', 'Yesh', 'Mandyam ', 'Yash');

INSERT INTO Account ( username,Email,Password ,Password_hint,firstname ,lastname) 
VALUES ('Vinod23','Vinod@gmail.com','Vinod12267', 'Vino' ,'Gaddam' , 'Vinod');

INSERT INTO Account ( username,Email,Password ,Password_hint,firstname ,lastname) 
VALUES ('Aparna14','Aparna@gmail.com','Aparna1267', 'Apar', 'Mathur' , 'Alex');

INSERT INTO Account ( username,Email,Password ,Password_hint,firstname ,lastname) 
VALUES ('Bharadwaj','Bhar_Ravi@gmail.com','Bhar483', 'Bhar',' Bharadwaj' , 'Ravi');

INSERT INTO Account ( username,Email,Password ,Password_hint,firstname ,lastname) 
VALUES ('Rahul87','Rahul@gmail.com','Rahul658', 'Rahu', 'Reddy' , 'Rahul');


UNLOCK TABLES;

DROP TABLE IF EXISTS `Driver`;

CREATE TABLE `Driver` (
  `Driver_Id` int PRIMARY KEY,
  `Dateofbirth` date,
  `Licensenumber` int CHECK (`Licensenumber` > 0) NOT NULL UNIQUE,
  `Dateofjoining` date,
  `DateofIssue` date,
  `Valid_Till` date,
  FOREIGN KEY (`Driver_Id`) REFERENCES `Account` (`Id`)
);

LOCK TABLES `Driver` WRITE;

INSERT INTO  Driver (Driver_Id ,Dateofbirth ,Licensenumber, Dateofjoining , DateofIssue, Valid_Till) 
VALUES (7, '1990-12-31', 12345678, '2020-12-4' , '2018-12-7', '2025-12-7');

INSERT INTO  Driver (Driver_Id ,Dateofbirth ,Licensenumber, Dateofjoining , DateofIssue, Valid_Till) 
VALUES (8, '1990-11-1', 15379389, '2018-12-5' , '2016-05-06', '2022-12-7');

INSERT INTO  Driver (Driver_Id ,Dateofbirth ,Licensenumber, Dateofjoining , DateofIssue, Valid_Till) 
VALUES (9, '1978-1-16', 16389841, '2017-11-4' , '2016-04-07', '2023-12-7');

INSERT INTO  Driver (Driver_Id ,Dateofbirth ,Licensenumber, Dateofjoining , DateofIssue, Valid_Till) 
VALUES (10, '1984-12-7', 36879016, '2016-09-06' , '2016-02-05', '2021-11-5');

INSERT INTO  Driver (Driver_Id ,Dateofbirth ,Licensenumber, Dateofjoining , DateofIssue, Valid_Till) 
VALUES (11, '1995-11-16', 38173919, '2019-11-16' , '2018-11-7', '2021-11-7');

UNLOCK TABLES;


DROP TABLE IF EXISTS `Customer`;

CREATE TABLE `Customer` (
  `Customer_Id` int PRIMARY KEY,
  `Home_Address` varchar(255),
  `Work_Address` varchar(255),
  FOREIGN KEY (`Customer_Id`) REFERENCES `Account` (`Id`)

);

LOCK TABLES `Customer` WRITE;

INSERT INTO  Customer (Customer_Id,Home_Address,Work_Address ) 
VALUES (1 ,'3/1056-B YMRCOLONY Hyderabad ', '3/187 TCS GandhiNagar Hyderabad');

INSERT INTO  Customer (Customer_Id,Home_Address,Work_Address ) 
VALUES (2 ,'3/1056-D YMRCOLONY Hyderabad ', '3/101 INFOSYS GandhiNagar Hyderabad');

INSERT INTO  Customer (Customer_Id,Home_Address,Work_Address ) 
VALUES (3 ,'3/1052 YMRCOLONY Hyderabad ', '3/104 GOOGLE GandhiNagar Hyderabad');

INSERT INTO  Customer (Customer_Id,Home_Address,Work_Address ) 
VALUES (4 ,'3/156-C YMRCOLONY Hyderabad ', '3/76 MICROSOFT GandhiNagar Hyderabad');

INSERT INTO  Customer (Customer_Id,Home_Address,Work_Address ) 
VALUES (5 ,'4/16-B YMRCOLONY Hyderabad ', '3/99 TCS GandhiNagar Hyderabad');

INSERT INTO  Customer (Customer_Id,Home_Address,Work_Address ) 
VALUES (6 ,'4/78-B YMRCOLONY Hyderabad ', '3/100 TECH GandhiNagar Hyderabad');

UNLOCK TABLES;

DROP TABLE IF EXISTS `Cost`;

CREATE TABLE `Cost` (
  `numberofseats` int CHECK (`numberofseats` > 0),
  `3or4_wheeler` int CHECK (`3or4_wheeler` in (3,4 )),
  `AC_or_NON_AC` boolean,
  `cost_km` int CHECK (`cost_km` > 0) ,
  PRIMARY KEY ( `numberofseats`, `3or4_wheeler`, `AC_or_NON_AC`)
);

LOCK TABLES `Cost` WRITE;

INSERT INTO Cost (numberofseats, 3or4_wheeler ,AC_or_NON_AC , cost_km)
VALUES(2, 3, 1, 60 );

INSERT INTO Cost (numberofseats, 3or4_wheeler ,AC_or_NON_AC , cost_km)
VALUES(4, 4, 1, 70 );

INSERT INTO Cost (numberofseats, 3or4_wheeler ,AC_or_NON_AC , cost_km)
VALUES(3, 4, 0, 50 );

INSERT INTO Cost (numberofseats, 3or4_wheeler ,AC_or_NON_AC , cost_km)
VALUES(5, 4, 1, 80 );

INSERT INTO Cost (numberofseats, 3or4_wheeler ,AC_or_NON_AC , cost_km)
VALUES(5, 4, 0, 75);

UNLOCK TABLES;


DROP TABLE IF EXISTS `Vehicle_model`;

CREATE TABLE `Vehicle_model` (
  `Vehiclemodel_Id` int PRIMARY KEY AUTO_INCREMENT,
  `Model_type` varchar(255),
  `numberofseats` int CHECK (`numberofseats` > 0),
  `3or4_wheeler` int CHECK (`3or4_wheeler` in (3,4 )),
  `AC_or_NON_AC` boolean,
  FOREIGN KEY ( `numberofseats`, `3or4_wheeler`, `AC_or_NON_AC`) REFERENCES `Cost`( `numberofseats`, `3or4_wheeler`, `AC_or_NON_AC`)
);

LOCK TABLES `Vehicle_model` WRITE;

INSERT INTO Vehicle_model (Model_type , numberofseats , 3or4_wheeler , AC_or_NON_AC)
VALUES( 'TATA987', 4 , 4 , 1 );

INSERT INTO Vehicle_model (Model_type , numberofseats , 3or4_wheeler , AC_or_NON_AC)
VALUES( 'VERSION2TATA' , 5 , 4 ,1 );

INSERT INTO Vehicle_model (Model_type , numberofseats , 3or4_wheeler , AC_or_NON_AC)
VALUES( 'NANO78', 3 , 4 ,0 );

INSERT INTO Vehicle_model (Model_type , numberofseats , 3or4_wheeler , AC_or_NON_AC)
VALUES( 'RICKSHAW12' , 2 , 3 , 1 );

INSERT INTO Vehicle_model (Model_type , numberofseats , 3or4_wheeler , AC_or_NON_AC)
VALUES( 'SUMO65', 5 , 4 ,0 );

UNLOCK TABLES;



DROP TABLE IF EXISTS `Vehicle`;

CREATE TABLE `Vehicle` (
  `Vehicle_Id` int PRIMARY KEY AUTO_INCREMENT,
   `Vehiclemodel_Id` int ,
   `Driver_Id` int,
  `In_Service` bool,
  `Vehicle_registration_plate` varchar(255) NOT NULL UNIQUE,
  FOREIGN KEY (`Driver_Id`) REFERENCES `Driver` (`Driver_Id`),
  FOREIGN KEY (`Vehiclemodel_Id`) REFERENCES `Vehicle_model` (`Vehiclemodel_Id`)
);

LOCK TABLES `Vehicle` WRITE;

INSERT INTO Vehicle ( Vehiclemodel_Id, Driver_Id, In_Service, Vehicle_registration_plate)
VALUES( 2, 8, 1, 'TS34780');

INSERT INTO Vehicle ( Vehiclemodel_Id, Driver_Id, In_Service, Vehicle_registration_plate)
VALUES( 4, 7, 1, 'TS34770');

INSERT INTO Vehicle ( Vehiclemodel_Id, Driver_Id, In_Service, Vehicle_registration_plate)
VALUES( 2, 10, 1, 'TS78780');

INSERT INTO Vehicle ( Vehiclemodel_Id, Driver_Id, In_Service, Vehicle_registration_plate)
VALUES( 3, 11, 1, 'TS37280');

UNLOCK TABLES;

DROP TABLE IF EXISTS `Ride`;

CREATE TABLE `Ride` (
  `Ride_number` int PRIMARY KEY AUTO_INCREMENT,
  `Customer_Id` int,
  `Vehicle_Id` int,
  `Pickup_location` varchar(255),
  `Destination` varchar(255),
  `Distance` decimal,
  `Shared` bool,
  `Status` varchar(30)
);

LOCK TABLES `Ride` WRITE;

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES(2,'Madhapur NEAR DMART','Gachibowli plot36',15, 0, 'OnTheWay');

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES(1,2,'Madhapur NEAR Railwaystation','Gandhinagar plot37',32, 0, 'OnRide');

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES(1,3,'Madhapur NEAR DMART','Gachibowli plot38',40, 0, 'Cancelled');

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES(2,3,'Madhapur NEAR DMART','Gachibowli plot39',25, 1, 'Completed');

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES(2,1,'Madhapur NEAR DMART','Gachibowli plot40',36, 0, 'Completed');

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES(2,1,'Madhapur NEAR DMART','Gachibowli plot41',21, 0, 'Completed');

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES(3,5,'Madhapur NEAR DMART','Gachibowli plot42',32, 1, 'Completed');

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES(3,5,'Madhapur NEAR DMART','Gachibowli plot43',41, 0, 'Completed');

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES( 3,1,'Madhapur NEAR DMART','Gachibowli plot44',19, 0, 'Completed');

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES( 4,2,'Madhapur NEAR DMART','Gachibowli plot45',39, 0, 'Completed');

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES( 5,3,'Madhapur NEAR DMART','Gachibowli plot46',22, 0, 'Completed');

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES( 5,4,'Madhapur NEAR DMART','Gachibowli plot47',19, 0, 'Completed');

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES( 6,1,'Madhapur NEAR DMART','Gachibowli plot48',11, 0, 'Completed');

INSERT INTO Ride( Customer_Id ,Vehicle_Id ,Pickup_location, Destination, Distance, Shared, Status)
VALUES( 6,2,'Madhapur NEAR DMART','Gachibowli plot49',23, 0, 'Completed');

UNLOCK TABLES;

DROP TABLE IF EXISTS `Feedback`;

CREATE TABLE `Feedback` (
  `Ride_number` int PRIMARY KEY ,
  `Rating` int CHECK (`Rating` > 0 and `Rating` < 6),
  `Any_Improvement` varchar(255),
  FOREIGN KEY (`Ride_number`) REFERENCES `Ride` (`Ride_number`)
);

LOCK TABLES `Feedback` WRITE;

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(1, 3,'Good');

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(2, 4,'No');

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(3, 5,'Yes');

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(4, 2,'No');

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(5, 3,'Worst');

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(6, 4,'Good');

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(7, 5,'Good');

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(8, 2,'Good');

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(9, 3,'Better');

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(10, 4,'Good');

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(11, 5,'Yes');

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(12, 2,'No');

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(13, 4,'Good');

INSERT INTO Feedback( Rating  , Any_Improvement)
VALUES(14, 4,'Good');

UNLOCK TABLES;

DROP TABLE IF EXISTS `Discount`;

CREATE TABLE `Discount` (
  `Discount_Amount` int,
  `Discount_Code` varchar(255),
  `Valid_for_distance` decimal,
  `Valid_for_amount` int,
  PRIMARY KEY (`Discount_Amount`, `Discount_Code`)
);

LOCK TABLES `Discount` WRITE;

INSERT INTO Discount(Discount_Amount,Discount_Code, Valid_for_distance,Valid_for_amount)
VALUES(20, 'HAPPY20', 10, 70 );

INSERT INTO Discount(Discount_Amount,Discount_Code, Valid_for_distance,Valid_for_amount)
VALUES(10, 'HAPPY20', 15, 60 );

INSERT INTO Discount(Discount_Amount,Discount_Code, Valid_for_distance,Valid_for_amount)
VALUES(30, 'DIWALI21', 20, 90 );

INSERT INTO Discount(Discount_Amount,Discount_Code, Valid_for_distance,Valid_for_amount)
VALUES(25, 'NAVRATRI21', 25, 70 );

INSERT INTO Discount(Discount_Amount,Discount_Code, Valid_for_distance,Valid_for_amount)
VALUES(15, 'SUMMER21', 10, 60 );

INSERT INTO Discount(Discount_Amount,Discount_Code, Valid_for_distance,Valid_for_amount)
VALUES(18, 'NEW21', 30, 65 );

UNLOCK TABLES;

DROP TABLE IF EXISTS `Payment`;

CREATE TABLE `Payment` (
  `Ride_number` int PRIMARY KEY,
  `Mode_of_Payment` varchar(255),
  `Payment_successful` bool
);

LOCK TABLES `Payment` WRITE;

UNLOCK TABLES;

INSERT INTO Payment(Ride_number,Mode_of_Payment , Payment_successful )
VALUES(3,'Cancelled-ride',0);

INSERT INTO Payment(Ride_number,Mode_of_Payment , Payment_successful )
VALUES(4,'NetBanking',1);

INSERT INTO Payment(Ride_number,Mode_of_Payment , Payment_successful )
VALUES(5,'NetBanking',1);

INSERT INTO Payment(Ride_number,Mode_of_Payment , Payment_successful )
VALUES(6,'Cash',1);

INSERT INTO Payment(Ride_number,Mode_of_Payment , Payment_successful )
VALUES(7,'Cash',1);

INSERT INTO Payment(Ride_number,Mode_of_Payment , Payment_successful )
VALUES(8,'PhonePay',1);

INSERT INTO Payment(Ride_number,Mode_of_Payment , Payment_successful )
VALUES(9,'PhonePay',1);

INSERT INTO Payment(Ride_number,Mode_of_Payment , Payment_successful )
VALUES(10,'NetBanking',1);

INSERT INTO Payment(Ride_number,Mode_of_Payment , Payment_successful )
VALUES(11,'Cash',1);

INSERT INTO Payment(Ride_number,Mode_of_Payment , Payment_successful )
VALUES(12,'PhonePay',1);

INSERT INTO Payment(Ride_number,Mode_of_Payment , Payment_successful )
VALUES(13,'NetBanking',1);

INSERT INTO Payment(Ride_number,Mode_of_Payment , Payment_successful )
VALUES(14,'Cash',1);


DROP TABLE IF EXISTS `Contact`;

CREATE TABLE `Contact` (
  `Id_account` int ,
  `Contact_number` varchar(20),
  FOREIGN KEY (`Id_account`) REFERENCES `Account` (`Id`)
);

LOCK TABLES `Contact` WRITE;

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(1,427580250);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(2,427580251);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(3,427580251);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(4,427580253);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(5,427580254);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(6,427580255);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(7,427580256);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(8,427580257);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(9,427580258);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(10,427580259);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(11,427580261);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(1,427580262);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(2,427580263);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(3,427580264);

INSERT INTO Contact(Id_account ,Contact_number )
VALUES(1,427580265);

UNLOCK TABLES;

DROP TABLE IF EXISTS `DiscountCode`;

CREATE TABLE `DiscountCode` (
  `Ride_number` int,
   `Discount_Amount`  int,
  `Discount_Code_name` varchar(255),
  PRIMARY KEY (`Ride_number`),
  FOREIGN KEY (`Ride_number`) REFERENCES `Payment` (`Ride_number`),
  FOREIGN KEY (`Discount_Amount`, `Discount_Code_name`) REFERENCES `Discount`(`Discount_Amount`, `Discount_Code`)
);

LOCK TABLES `DiscountCode` WRITE;

INSERT INTO DiscountCode(Ride_number , Discount_Amount ,Discount_Code_name )
VALUES(4,20,'HAPPY20');

INSERT INTO DiscountCode(Ride_number , Discount_Amount ,Discount_Code_name )
VALUES(5,30,'DIWALI21');

INSERT INTO DiscountCode(Ride_number , Discount_Amount ,Discount_Code_name )
VALUES(6,25,'NAVRATRI21');

INSERT INTO DiscountCode(Ride_number , Discount_Amount ,Discount_Code_name )
VALUES(9,15,'SUMMER21');

INSERT INTO DiscountCode(Ride_number , Discount_Amount ,Discount_Code_name )
VALUES(10,20,'HAPPY20');

UNLOCK TABLES;

ALTER TABLE `Customer` ADD FOREIGN KEY (`Customer_Id`) REFERENCES `Account` (`Id`);

ALTER TABLE `Driver` ADD FOREIGN KEY (`Driver_Id`) REFERENCES `Account` (`Id`);

ALTER TABLE `Payment` ADD FOREIGN KEY (`Ride_number`) REFERENCES `Ride` (`Ride_number`);

ALTER TABLE `Vehicle` ADD FOREIGN KEY (`Driver_Id`) REFERENCES `Driver` (`Driver_Id`);

ALTER TABLE `Vehicle` ADD FOREIGN KEY (`Vehiclemodel_Id`) REFERENCES `Vehicle_model` (`Vehiclemodel_Id`);

ALTER TABLE `Ride` ADD FOREIGN KEY (`Ride_number`) REFERENCES `Feedback` (`Ride_number`);

ALTER TABLE `DiscountCode` ADD FOREIGN KEY (`Ride_number`) REFERENCES `Payment` (`Ride_number`);


ALTER TABLE `Contact` ADD FOREIGN KEY (`Id_account`) REFERENCES `Account` (`Id`);



