package uts.isd.model.dao;

import java.sql.*;
import java.util.ArrayList;
import uts.isd.model.Product;
import uts.isd.model.Student;
import uts.isd.model.accessLog;

public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    public Student findUser(String email, String password) throws SQLException {
=======
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
=======
>>>>>>> parent of a91034c... User Access Log Management
    //Find a user using email and password
    public User findUser(String email, String password) throws SQLException {
>>>>>>> parent of a91034c... User Access Log Management
        String fetch = "select * from iotuser.Users where EMAIL = '" + email + "' and PASSWORD = '" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String studentEmail = rs.getString(2);
            String studentPassword = rs.getString(3);
            if (studentEmail.equals(email) && studentPassword.equals(password)) {
                String studentName = rs.getString(1);
                String studentNumber = rs.getString(4);
                String studentStatus = rs.getString(5);
                String studentRole = rs.getString(6);
                return new Student(studentName, studentEmail, studentPassword, studentNumber, studentStatus, studentRole);
            }
        }
        return null;
    }

    public Student findUserEmailOnly(String email) throws SQLException {
        String fetch = "select * from iotuser.Users where EMAIL = '" + email + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String studentEmail = rs.getString(2);
            if (studentEmail.equals(email)) {
                String studentName = rs.getString(1);
                String studentPassword = rs.getString(3);
                String studentNumber = rs.getString(4);
                String studentStatus = rs.getString(5);
                String studentRole = rs.getString(6);
                return new Student(studentName, studentEmail, studentPassword, studentNumber, studentStatus, studentRole);
            }
        }
        return null;
    }

    public void addUser(String name, String email, String password, String number, String status, String role) throws SQLException {
        st.executeUpdate("INSERT INTO iotuser.Users " + "VALUES ('" + name + "', '" + email + "', '" + password + "', '" + number + "',  '" + status + "',  '" + role + "')");

    }

    public void updateUser(String name, String email, String password, String number, String status, String role) throws SQLException {
        st.executeUpdate("UPDATE iotuser.Users SET NAME='" + name + "',PASSWORD='" + password + "',number='" + number + "',status='" + status + "', ROLE='" + role + "' WHERE EMAIL='" + email + "'");
    }

    public void deleteUser(String email) throws SQLException {
        st.executeUpdate("DELETE FROM  iotuser.Users WHERE EMAIL = '" + email + "'");
    }

    public void updateUserStatus(String email, String status) throws SQLException {
        st.executeUpdate("UPDATE iotuser.Users SET STATUS='" + status + "' WHERE EMAIL='" + email + "'");
    }

    public ArrayList<Student> fetchStudents() throws SQLException {
        String fetch = "select * from Users";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Student> temp = new ArrayList();

        while (rs.next()) {
            String name = rs.getString(1);
            String email = rs.getString(2);
            String password = rs.getString(3);
            String number = rs.getString(4);
            String status = rs.getString(5);
            String role = rs.getString(6);
            temp.add(new Student(name, email, password, number, status, role));
        }

        return temp;
    }

    public boolean checkUser(String email, String password) throws SQLException {
        String fetch = "select * from iotuser.Users where EMAIL = '" + email + "' and password = '" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String studentEmail = rs.getString(2);
            String studentPass = rs.getString(3);
            if (studentEmail.equals(email) && studentPass.equals(password)) {
                return true;
            }
        }
        return false;

    }
 
    public void addAccessLog(String date, String time, String action, String email) throws SQLException {
        st.executeUpdate("INSERT INTO iotuser.ACCESSLOG " + "VALUES ('" + date + "', '" + time + "', '" + action + "', '" + email + "')");

    }

    public ArrayList<accessLog> fetchAccessLog() throws SQLException {
        String fetch = "select * from accesslog";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<accessLog> temp = new ArrayList();

        while (rs.next()) {
            String date = rs.getString(1);
            String time = rs.getString(2);
            String action = rs.getString(3);
            String email = rs.getString(4);
            temp.add(new accessLog(date, time, action, email));
        }

        return temp;
    }

    public ArrayList<accessLog> findAccessLog(String email, String date) throws SQLException {
        String fetch = "select * from iotuser.accesslog where EMAIL = '" + email + "' and date = '" + date + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<accessLog> temp = new ArrayList();

        while (rs.next()) {
            String userEmail = rs.getString(4);
            String userDate = rs.getString(1);
            if (userEmail.equals(email) && userDate.equals(date)) {
                String time = rs.getString(2);
                String action = rs.getString(3);
                temp.add(new accessLog(userDate, time, action, userEmail));
            }
        }
        return temp;
    }

    public boolean checkAccessLogs(String email, String date) throws SQLException {
        String fetch = "select * from iotuser.accesslog where EMAIL = '" + email + "' and date = '" + date + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String userEmail = rs.getString(4);
            String userDate = rs.getString(1);
            if (userEmail.equals(email) && userDate.equals(date)) {
                return true;
            }
        }
        return false;
    }

    public ArrayList<accessLog> listAccessLogs() throws SQLException {
        String fetch = "select * from accesslog";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<accessLog> temp = new ArrayList();

        while (rs.next()) {
            String date = rs.getString(1);
            String time = rs.getString(2);
            String action = rs.getString(3);
            String email = rs.getString(4);
            temp.add(new accessLog(date, time, action, email));
        }

        return temp;
    }

    public ArrayList<accessLog> listAccessLogsUser(String email) throws SQLException {
        String fetch = "select * from iotuser.accesslog where EMAIL = '" + email + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<accessLog> temp = new ArrayList();

        while (rs.next()) {
            String date = rs.getString(1);
            String time = rs.getString(2);
            String action = rs.getString(3);
            temp.add(new accessLog(date, time, action, email));
        }

        return temp;
    }
    
    //-- Check User's Role --\\
       
    public String checkRole(String email) throws SQLException {
        String fetch = "SELECT * FROM IOTUSER.USERS WHERE EMAIL = '" + email + "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String userEmail = rs.getString(2);
            if (userEmail.equals(email)) {
                return rs.getString(6);
            }
        }
        return null;
    }

    //-- Product / Device Database Manager --\\
    
    public void addProduct(String name, double price, String manufacturer, String type, int quantity_in_stock) throws SQLException {
        st.executeUpdate("INSERT INTO IOTUSER.PRODUCT(NAME, PRICE, MANUFACTURER, TYPE, QUANTITY_IN_STOCK)" + "VALUES ('" + name + "', " + price + ", '" + manufacturer + "', '" + type + "', " + quantity_in_stock + ")"); 
    }
    
    public Product findProduct(String name, String type) throws SQLException {
        String read = "SELECT * FROM IOTUSER.PRODUCT WHERE NAME = '" + name + "' AND TYPE='" + type + "'";
        ResultSet rs = st.executeQuery(read);
        while(rs.next()) {
            String productName = rs.getString(2);
            String productType = rs.getString(5);
            if(productName.equals(name) && productType.equals(type)) {
                double productPrice = rs.getDouble(3);
                String productManufacturer = rs.getString(4);
                int productQuantity = rs.getInt(6);
                return new Product(productName, productPrice, productManufacturer, productType, productQuantity);
            }
        }
        return null;
    }
    /*
        public Product findProductID(Long id) throws SQLException {
        String strID = Long.toString(id);
        String read = "SELECT * FROM IOTUSER.PRODUCT WHERE PRODUCT_ID= '" + strID + "'";
        ResultSet rs = st.executeQuery(read);
        while(rs.next()) {
            Long product_id = rs.getLong(1);
            if (product_id == id) {
                String productName = rs.getString(2);
                double productPrice = rs.getDouble(3);
                String productManufacturer = rs.getString(4);
                String productType = rs.getString(5);
                int productQuantity = rs.getInt(6);
                return new Product(product_id, productName, productPrice, productManufacturer, productType, productQuantity);
            }
        }
        return null;
    }
    */
    public void updateProduct(String name, double price, String manufacturer, String type, int quantity) throws SQLException {
        st.executeUpdate("UPDATE IOTUSER.PRODUCT SET PRICE=" + price + ", MANUFACTURER='" + manufacturer + "', TYPE='" + type + "', QUANTITY_IN_STOCK=" + quantity + " WHERE NAME='" + name + "'");
    }

    public void deleteProduct(String name) throws SQLException {
        st.executeUpdate("DELETE FROM IOTUSER.PRODUCT WHERE NAME='" + name + "'");
    }

    public ArrayList<Product> fetchProducts() throws SQLException {
        String fetch = "SELECT * FROM IOTUSER.PRODUCT";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Product> temp = new ArrayList();
        
        while(rs.next()) {
            Long product_id = rs.getLong(1);
            String name = rs.getString(2);
            double price = rs.getDouble(3);
            String manufacturer = rs.getString(4); 
            String type = rs.getString(5);
            int quantity = rs.getInt(6);
            temp.add(new Product(product_id, name, price, manufacturer, type, quantity));
        }
        return temp;
    }
    
    public ArrayList<Product> findProductList(String name, String type) throws SQLException {
        String fetch = "SELECT * FROM IOTUSER.PRODUCT WHERE NAME= '" + name + "' AND TYPE='" + type + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Product> temp = new ArrayList();
        
        while(rs.next()) {
            String productName = rs.getString(2);
            String productType = rs.getString(5);
            if(productName.equals(name) && productType.equals(type)) {
                Long product_id = rs.getLong(1);    
                double productPrice = rs.getDouble(3);
                String productManufacturer = rs.getString(4);
                int productQuantity = rs.getInt(6);
                temp.add(new Product(product_id, productName, productPrice, productManufacturer, productType, productQuantity));
            }
        }
        return temp;
    }

    public boolean checkProduct(String name, String type) throws SQLException {
        String fetch = "SELECT * FROM IOTUSER.PRODUCT WHERE NAME= '" + name + "' AND TYPE='" + type + "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String productName = rs.getString(2);
            String productType = rs.getString(5);
            if (productName.equals(name) && productType.equals(type)) {
                return true;
            }
        }
        return false;
    }
    
}
