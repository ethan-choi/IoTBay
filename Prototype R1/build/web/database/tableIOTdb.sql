/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Jackie Lim
 * Created: 17/05/2020
 */

/* -- ALL THE TABLE CREATION IN ONE SQL-- */

CREATE TABLE Users
(
Email varchar(30) NOT NULL,
Password varchar(16) NOT NULL,
First_Name varchar(20) NOT NULL,
Last_Name varchar(20) NOT NULL,
PRIMARY KEY(Email)
);

CREATE TABLE Customer
(
Customer_ID integer NOT NULL,
Mobile_Number varchar(10),
PRIMARY KEY (Customer_ID)
);

CREATE TABLE Staff
(
Staff_ID integer NOT NULL,
Department varchar(20),
PRIMARY KEY (Staff_ID)
);

CREATE TABLE System_Admin
(
System_Admin_ID integer NOT NULL,
"ROLE" varchar(20),
PRIMARY KEY (System_Admin_ID)
);

CREATE TABLE User_Customer
(
Email varchar(30) NOT NULL,
Customer_ID integer NOT NULL,
FOREIGN KEY (Email) REFERENCES Users(Email),
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE User_Staff
(
Email varchar(30) NOT NULL,
Staff_ID integer NOT NULL,
FOREIGN KEY (Email) REFERENCES Users(Email),
FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

CREATE TABLE User_System_Admin
(
Email varchar(30) NOT NULL,
System_Admin_ID integer NOT NULL,
FOREIGN KEY (Email) REFERENCES Users(Email),
FOREIGN KEY (System_Admin_ID) REFERENCES System_Admin(System_Admin_ID)
);

CREATE TABLE Product
(
Product_ID integer NOT NULL,
"NAME" varchar(50),
Price double,
Manufacturer varchar(50),
"TYPE" varchar(50),
Quantity_In_Stock integer,
PRIMARY KEY (Product_ID)
);

CREATE TABLE Shipping_Address
(
Shipping_ID integer NOT NULL,
Street_Number integer,
Street_Name varchar(25),
Suburb varchar (25),
"STATE" varchar (3),
Postcode integer,
Email varchar(30) NOT NULL,
PRIMARY KEY (Shipping_ID),
FOREIGN KEY (Email) REFERENCES Users(Email)
);

CREATE TABLE Payment_Details
(
Payment_ID integer NOT NULL,
Card_Number numeric(16),
Card_Type varchar(25),
Card_Holder varchar(50),
Expiration_Date numeric(5),
CVV numeric(3), 
Email varchar(30) NOT NULL,
PRIMARY KEY (Payment_ID),
FOREIGN KEY (Email) REFERENCES Users(Email)
);

CREATE TABLE Orders
(
Order_ID integer NOT NULL,
Order_Time time,
Order_Date date,
Shipped_Time time,
Shipped_Date date,
Status varchar(10),
Email varchar(30),
Shipping_ID integer NOT NULL,
Payment_ID integer NOT NULL,
PRIMARY KEY (Order_ID),
FOREIGN KEY (Email) REFERENCES Users(Email),
FOREIGN KEY (Shipping_ID) REFERENCES Shipping_Address(Shipping_ID),
FOREIGN KEY (Payment_ID) REFERENCES Payment_Details(Payment_ID)
);

CREATE TABLE Order_Detail
(
Quantity integer,
Total_Price double,
Product_ID integer NOT NULL,
Order_ID integer NOT NULL,
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

CREATE TABLE Access_Log
(
Access_ID integer NOT NULL,
Activities varchar(255),
Login_Time time,
Login_Date date,
Logout_Time time,
Logout_Date date,
Email varchar(30),
PRIMARY KEY (Access_ID),
FOREIGN KEY (Email) REFERENCES Users(Email)
);

CREATE TABLE Order_History
(
History_ID integer,
Order_ID integer,
Email varchar(30),
PRIMARY KEY (History_ID),
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
FOREIGN KEY (Email) REFERENCES Users(Email)
);
