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
Status varchar(20) NOT NULL,
"Role" varchar(20) NOT NULL,
PRIMARY KEY(Email)
);

/*
CREATE TABLE Customer
(
Customer_ID integer NOT NULL 
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
Mobile_Number varchar(10),
Email varchar(30) NOT NULL UNIQUE,
PRIMARY KEY (Customer_ID),
FOREIGN KEY (Email) REFERENCES Users(Email)
);

CREATE TABLE Staff
( 
Staff_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
Department varchar(20),
Email varchar(30) NOT NULL UNIQUE,
PRIMARY KEY (Staff_ID),
FOREIGN KEY (Email) REFERENCES Users(Email)
);

CREATE TABLE System_Admin
(
System_Admin_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
"ROLE" varchar(20),
Email varchar(30) NOT NULL UNIQUE,
PRIMARY KEY (System_Admin_ID),
FOREIGN KEY (Email) REFERENCES Users(Email)
);
*/

CREATE TABLE Product
(
Product_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
"NAME" varchar(50) NOT NULL UNIQUE,
Price double NOT NULL UNIQUE,
Manufacturer varchar(50) NOT NULL UNIQUE,
"TYPE" varchar(50) NOT NULL UNIQUE,
Quantity_In_Stock integer NOT NULL UNIQUE, 
PRIMARY KEY (Product_ID)
);

CREATE TABLE Shipping_Address
(
Shipping_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
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
Payment_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
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
Order_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
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
Access_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
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
History_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
Order_ID integer,
Email varchar(30),
PRIMARY KEY (History_ID),
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
FOREIGN KEY (Email) REFERENCES Users(Email)
);
