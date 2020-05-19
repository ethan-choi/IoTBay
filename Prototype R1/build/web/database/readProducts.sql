/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Jackie Lim
 * Created: 19/05/2020
 */

/* NOTE: 
 * - Products listed from: "https://tutorials-raspberrypi.com/raspberry-pi-sensors-overview-50-important-components/"
 * - Manufacturer names are made up. 
 */


SELECT * FROM IOTUSER.PRODUCT;

INSERT INTO PRODUCT (PRODUCT_ID, "NAME", PRICE, MANUFACTURER, "TYPE", QUANTITY_IN_STOCK)
VALUES
(1, 'PIR Motion Sensor', 2, 'Techno', 'Motion Sensors', 15),
(2, 'HC-SR04 Ultrasonic Sensor', 3, 'SwiftElectric', 'Motion Sensors', 10),
(3, 'GP2Y0A02YK', 11.49, 'Techno', 'Motion Sensors', 5),
(4, 'GPS NEO-6M Module', 10, 'Mecha', 'Navigation Modules', 5),
(5, 'USB GPS Receiver', 15, 'Techno', 'Navigation Modules', 5),
(6, 'MPU-6050 Gyroscope', 4.10, 'Techno', 'Navigation Modules', 10),
(7, '433 MHz Set', 3, 'Techno', 'Wireless / Infrared(IR) / Bluetooth', 15),
(8, '2.4 GHz NRF24L01+ Modul', 4, 'Techno', 'Wireless / Infrared(IR) / Bluetooth', 15),
(9, 'GMS Surfstick', 25, 'Techno', 'Wireless / Infrared(IR) / Bluetooth', 3),
(10, 'Servo Motors', 3, 'Techno', 'Motors', 15),
(11, '28BYJ-48 Stepper Motor', 2, 'Techno', 'Motors', 10),
(12, 'PCA9785 Servo Board', 4.30, 'Techno', 'Motors', 12),
(13, 'MCP3008 Analog-to-digitl converter', 5, 'Techno', 'Analogue Sensors', 10),
(14, 'Joystick', 5.50, 'Techno', 'Analogue Sensors', 10),
(15, 'Potentiometer', 3.30, 'Techno', 'Analogue Sensors', 15),
(16, 'Relais', 3.85, 'Techno', 'Current Supply', 15),
(17, 'LM2596 Buck Converter', 3, 'Techno', 'Current Supply', 15),
(18, '7" Raspberry Pi Touchscreen', 60, 'Raspberry', 'Displays', 2),
(19, 'HDD44780 Displays', 4.99, 'Techno', 'Displays', 12),
(20, 'MAX7219 LED Matrix', 4.25, 'Techno', 'Other', 10)

