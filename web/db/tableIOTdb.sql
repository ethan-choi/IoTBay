/**
 * Author:  Jackie Lim
 * Created: 17/05/2020
 */

/* -- ALL THE TABLE CREATION IN ONE SQL-- */

CREATE TABLE Users
(
Name varchar(20) NOT NULL,
Email varchar(30) NOT NULL,
Password varchar(16) NOT NULL,
"NUMBER" varchar(10) NOT NULL,
Status varchar(20) NOT NULL,
"ROLE" varchar(20) NOT NULL,
PRIMARY KEY(Email)
);

CREATE TABLE Product
(
Product_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
"NAME" varchar(50) NOT NULL UNIQUE,
Price double NOT NULL,
Manufacturer varchar(50) NOT NULL,
"TYPE" varchar(50) NOT NULL,
Quantity_In_Stock integer NOT NULL, 
PRIMARY KEY (Product_ID)
);

CREATE TABLE Shipping_Address
(
Shipping_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
Street_Number integer NOT NULL,
Street_Name varchar(25) NOT NULL,
Suburb varchar (25) NOT NULL,
"STATE" varchar (3) NOT NULL,
Postcode integer NOT NULL,
Email varchar(30) NOT NULL,
PRIMARY KEY (Shipping_ID),
FOREIGN KEY (Email) REFERENCES Users(Email)
);

CREATE TABLE Payment_Details
(
Payment_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
Card_Number numeric(16) NOT NULL,
Card_Type varchar(25) NOT NULL,
Card_Holder varchar(50) NOT NULL,
Expiration_Date numeric(5) NOT NULL,
CVV numeric(3) NOT NULL, 
Email varchar(30) NOT NULL,
PRIMARY KEY (Payment_ID),
FOREIGN KEY (Email) REFERENCES Users(Email)
);

CREATE TABLE Orders
(
Order_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
Order_Time time NOT NULL,
Order_Date date NOT NULL,
Shipped_Time time,
Shipped_Date date,
Status varchar(10) NOT NULL,
Email varchar(30) NOT NULL,
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

CREATE TABLE AccessLog
(
AccessLog_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
"DATE" varchar(10) NOT NULL,
"TIME"  varchar(10) NOT NULL,
"ACTION" varchar(10) NOT NULL,
Email varchar(30) NOT NULL,
FOREIGN KEY (Email) REFERENCES Users(Email)
);

CREATE TABLE Order_History
(
History_ID integer NOT NULL
    GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
Order_ID integer NOT NULL,
Email varchar(30) NOT NULL,
PRIMARY KEY (History_ID),
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
FOREIGN KEY (Email) REFERENCES Users(Email)
);
