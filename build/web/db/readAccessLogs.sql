/**
 * Author:  Ethan Choi
 *  For the purpose of this assignment, sample access logs have only been entered for five users
 */





INSERT INTO ACCESSLOG ("DATE", "TIME", "ACTION", EMAIL)
VALUES
('2020-05-30', '04:09:02', 'Register', 'bob.smith@email.com' ),
('2020-05-30', '12:02:02', 'Login', 'bob.smith@email.com' ),
('2020-05-30', '13:03:02', 'Logout', 'bob.smith@email.com' ),
('2020-06-31', '15:09:02', 'Login', 'bob.smith@email.com' ),
('2020-05-30', '15:45:02', 'Logout', 'bob.smith@email.com' ),

('2020-05-30', '01:02:08', 'Register', 'cindy.lauper@email.com' ),
('2020-05-30', '20:06:10', 'Login', 'cindy.lauper@email.com' ),
('2020-05-30', '20:09:20', 'Logout', 'cindy.lauper@email.com' ),
('2020-06-31', '04:09:02', 'Login', 'cindy.lauper@email.com' ),
('2020-06-31', '05:10:30', 'Logout', 'cindy.lauper@email.com' ),

('2020-05-30', '23:11:11', 'Register', 'kenny.rodgers@email.com' ),
('2020-05-30', '18:02:10', 'Login', 'kenny.rodgers@email.com' ),
('2020-05-30', '19:02:40', 'Logout', 'kenny.rodgers@email.com' ),
('2020-06-01', '13:00:02', 'Login', 'kenny.rodgers@email.com' ),
('2020-06-01', '13:01:30', 'Logout', 'kenny.rodgers@email.com' ),


('2020-05-30', '23:11:11', 'Register', 'jeff.flynn@email.com' ),
('2020-05-30', '18:02:10', 'Login', 'jeff.flynn@email.com' ),
('2020-05-30', '19:02:40', 'Logout', 'jeff.flynn@email.com' ),
('2020-06-01', '13:00:02', 'Login', 'jeff.flynn@email.com' ),
('2020-06-01', '13:01:30', 'Logout', 'jeff.flynn@email.com' ),

('2020-02-21', '03:33:33', 'Register', 'john.zoates@email.com' ),
('2020-02-27', '10:02:10', 'Login', 'john.zoates@email.com' ),
('2020-02-27', '11:30:40', 'Logout', 'john.zoates@email.com' ),
('2020-06-01', '15:00:59', 'Login', 'john.zoates@email.com' ),
('2020-06-01', '15:20:31', 'Logout', 'john.zoates@email.com' ),

('2020-02-21', '12:02:11', 'Register', 'daryl.fall@email.com' ),
('2020-02-27', '08:30:12', 'Login', 'daryl.fall@email.com' ),
('2020-02-27', '08:59:12', 'Logout', 'daryl.fall@email.com' ),
('2020-06-01', '03:00:59', 'Login', 'daryl.fall@email.com' ),
('2020-06-01', '04:01:11', 'Logout', 'daryl.fall@email.com' );
