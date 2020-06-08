SELECT * FROM IOTUSER.ORDERS;

INSERT INTO ORDERS ("ORDER_TIME","ORDER_DATE","SHIPPED_TIME","SHIPPED_DATE","STATUS","EMAIL","SHIPPING_ID","PAYMENT_ID")
VALUES
('04:09:10','2020-05-29','04:08:02','2020-06-10','SHIPPED','jeff.flynn@email.com',1,1),
('12:08:05','2020-05-30','12:11:02','2020-05-30','CANCELED','bob.smith@email.com',2,2),
('05:09:10','2020-05-30','04:08:02','2020-06-10','SHIPPED','jeff.flynn@email.com',3,3),
('18:04:04','2020-04-22','02:09:02','2020-05-20','CANCELED','jeff.flynn@email.com',4,4),
('04:03:01','2020-03-12','05:09:02','2020-08-21','SHIPPED','daryl.fall@email.com',5,5),
('16:02:02','2020-05-08','08:09:02','2020-07-12','SHIPPED','kenny.rodgers@email.com',6,6),
('04:01:15','2020-03-20','04:08:02','2020-05-30','SHIPPED','john.zoates@email.com',7,7),
('04:06:18','2020-05-11','01:09:02','2020-05-19','SHIPPED','kenny.rodgers@email.com',8,8),
('07:09:34','2020-05-10','04:09:02','2020-05-25','CANCELED','daryl.fall@email.com',9,9),
('04:12:02','2020-04-30','12:10:02','2020-09-10','SHIPPED','jeff.flynn@email.com',10,10),
('04:01:06','2020-05-10','13:09:02','2020-05-27','CANCELED','daryl.fall@email.com',11,11),
('08:02:50','2020-05-12','08:09:02','2020-06-06','SHIPPED','bob.smith@email.com',12,12),
('04:09:02','2020-04-13','04:10:02','2020-05-28','CANCELED','jeff.flynn@email.comm',13,13),
('06:04:12','2020-05-17','06:09:02','2020-05-18','SHIPPED','bob.smith@email.com',14,14),
('04:09:02','2020-06-17','04:09:02','2020-07-21','SHIPPED','kenny.rodgers@email.com',15,15),
('12:09:45','2020-05-10','12:09:02','2020-05-22','CANCELED','bob.smith@email.com',16,16),
('04:07:36','2020-05-01','13:09:02','2020-05-14','SHIPPED','john.zoates@email.com',17,17),
('04:04:29','2020-05-18','04:09:02','2020-08-29','SHIPPED','kenny.rodgers@email.com',18,18),
('01:09:51','2020-05-19','17:09:02','2020-05-27','SHIPPED','john.zoates@email.com',19,19),
('03:09:18','2020-05-23','04:09:02','2020-07-20','SHIPPED','bob.smith@email.com',20,20)