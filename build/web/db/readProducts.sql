
/**
 * Author:  Jackie Lim
 * Created: 19/05/2020
 */

/* NOTES: 
 * - Products listed from: "https://tutorials-raspberrypi.com/raspberry-pi-sensors-overview-50-important-components/"
 * - Manufacturer names are made up. 
 */


SELECT * FROM IOTUSER.PRODUCT;

INSERT INTO PRODUCT ("NAME", PRICE, MANUFACTURER, "TYPE", QUANTITY_IN_STOCK)
VALUES
('PIR Motion Sensor', 2, 'Techno', 'Motion Sensors', 15),
('HC-SR04 Ultrasonic Sensor', 3, 'SwiftElectric', 'Motion Sensors', 10),
('GP2Y0A02YK', 11.49, 'Techno', 'Motion Sensors', 5),
('GPS NEO-6M Module', 10, 'Mecha', 'Navigation Modules', 5),
('USB GPS Receiver', 15, 'SwiftElectric', 'Navigation Modules', 5),
('MPU-6050 Gyroscope', 4.10, 'Mecha', 'Navigation Modules', 10),
('433 MHz Set', 3, 'Techno', 'Wireless / Infrared(IR) / Bluetooth', 15),
('2.4 GHz NRF24L01+ Modul', 4, 'Raspberry', 'Wireless / Infrared(IR) / Bluetooth', 15),
('GMS Surfstick', 25, 'Mecha', 'Wireless / Infrared(IR) / Bluetooth', 3),
('Servo Motors', 3, 'SwiftElectric', 'Motors', 15),
('28BYJ-48 Stepper Motor', 2, 'Techno', 'Motors', 10),
('PCA9785 Servo Board', 4.30, 'Techno', 'Motors', 12),
('MCP3008 Analog-to-digitl converter', 5, 'Mecha', 'Analogue Sensors', 10),
('Joystick', 5.50, 'Mecha', 'Analogue Sensors', 10),
('Potentiometer', 3.30, 'Raspberry', 'Analogue Sensors', 15),
('Relais', 3.85, 'SwiftElectric', 'Current Supply', 15),
('LM2596 Buck Converter', 3, 'Techno', 'Current Supply', 15),
('7" Raspberry Pi Touchscreen', 60, 'Raspberry', 'Displays', 2),
('HDD44780 Displays', 4.99, 'Techno', 'Displays', 12),
('MAX7219 LED Matrix', 4.25, 'Techno', 'Other', 10)

