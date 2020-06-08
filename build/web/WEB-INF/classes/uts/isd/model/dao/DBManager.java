package uts.isd.model.dao;

import java.sql.*;
import java.util.ArrayList;
import uts.isd.model.Product;
import uts.isd.model.User;
import uts.isd.model.accessLog;

public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    //-- User Access Management --\\
    //Find a user using email and password
    public User findUser(String email, String password) throws SQLException {
        String fetch = "select * from iotuser.Users where EMAIL = '" + email + "' and PASSWORD = '" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String userEmail = rs.getString(2);
            String userPassword = rs.getString(3);
            if (userEmail.equals(email) && userPassword.equals(password)) {
                String userName = rs.getString(1);
                String userNumber = rs.getString(4);
                String userStatus = rs.getString(5);
                String userRole = rs.getString(6);
                return new User(userName, userEmail, userPassword, userNumber, userStatus, userRole);
            }
        }
        return null;
    }

    //Find a user using only their email
    public User findUserEmailOnly(String email) throws SQLException {
        String fetch = "select * from iotuser.Users where EMAIL = '" + email + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String userEmail = rs.getString(2);
            if (userEmail.equals(email)) {
                String userName = rs.getString(1);
                String userPassword = rs.getString(3);
                String userNumber = rs.getString(4);
                String userStatus = rs.getString(5);
                String userRole = rs.getString(6);
                return new User(userName, userEmail, userPassword, userNumber, userStatus, userRole);
            }
        }
        return null;
    }

    //Create a new user record
    public void addUser(String name, String email, String password, String number, String status, String role) throws SQLException {
        st.executeUpdate("INSERT INTO iotuser.Users " + "VALUES ('" + name + "', '" + email + "', '" + password + "', '" + number + "',  '" + status + "',  '" + role + "')");

    }

    //Update user record
    public void updateUser(String name, String email, String password, String number, String status, String role) throws SQLException {
        st.executeUpdate("UPDATE iotuser.Users SET NAME='" + name + "',PASSWORD='" + password + "',number='" + number + "',status='" + status + "', ROLE='" + role + "' WHERE EMAIL='" + email + "'");
    }

    //Delete user record entirely
    public void deleteUser(String email) throws SQLException {
        st.executeUpdate("DELETE FROM  iotuser.Users WHERE EMAIL = '" + email + "'");
    }

    //Change user status i.e. active or inactive
    public void updateUserStatus(String email, String status) throws SQLException {
        st.executeUpdate("UPDATE iotuser.Users SET STATUS='" + status + "' WHERE EMAIL='" + email + "'");
    }

    //Check to see if user exists in the database by matching an email and password with current records
    public boolean checkUser(String email, String password) throws SQLException {
        String fetch = "select * from iotuser.Users where EMAIL = '" + email + "' and password = '" + password + "'";
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            String userEmail = rs.getString(2);
            String userPass = rs.getString(3);
            if (userEmail.equals(email) && userPass.equals(password)) {
                return true;
            }
        }
        return false;

    }

    //Cretae new access log
    public void addAccessLog(String date, String time, String action, String email) throws SQLException {
        st.executeUpdate("INSERT INTO iotuser.ACCESSLOG(date, time, action, email)" + "VALUES ('" + date + "', '" + time + "', '" + action + "', '" + email + "')");

    }

    //Find all access logs from all users
    public ArrayList<accessLog> fetchAccessLog() throws SQLException {
        String fetch = "select * from accesslog";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<accessLog> temp = new ArrayList();

        while (rs.next()) {
            String id = rs.getString(1);
            String date = rs.getString(2);
            String time = rs.getString(3);
            String action = rs.getString(4);
            String email = rs.getString(5);
            temp.add(new accessLog(id, date, time, action, email));
        }

        return temp;
    }

    //Find an access log by email and date
    public ArrayList<accessLog> findAccessLog(String email, String date) throws SQLException {
        String fetch = "select * from iotuser.accesslog where EMAIL = '" + email + "' and date = '" + date + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<accessLog> temp = new ArrayList();

        while (rs.next()) {
            String userEmail = rs.getString(5);
            String userDate = rs.getString(2);
            if (userEmail.equals(email) && userDate.equals(date)) {
                String time = rs.getString(3);
                String action = rs.getString(4);
                String id = rs.getString(1);
                temp.add(new accessLog(id, userDate, time, action, userEmail));
            }
        }
        return temp;
    }

    //Check to see if access log exists
    public boolean checkAccessLogs(String email, String date) throws SQLException {
        String fetch = "select * from iotuser.accesslog where EMAIL = '" + email + "' and date = '" + date + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String userEmail = rs.getString(5);
            String userDate = rs.getString(2);
            if (userEmail.equals(email) && userDate.equals(date)) {
                return true;
            }
        }
        return false;
    }

    //Find access logs by an email only
    public ArrayList<accessLog> listAccessLogsUser(String email) throws SQLException {
        String fetch = "select * from iotuser.accesslog where EMAIL = '" + email + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<accessLog> temp = new ArrayList();

        while (rs.next()) {
            String date = rs.getString(2);
            String id = rs.getString(1);
            String time = rs.getString(3);
            String action = rs.getString(4);
            temp.add(new accessLog(id, date, time, action, email));
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
    
    // Find product only by its name
    public Product findProductName(String name) throws SQLException {
        String read = "SELECT * FROM IOTUSER.PRODUCT WHERE NAME = '" + name + "'";
        ResultSet rs = st.executeQuery(read);
        while (rs.next()) {
            String productName = rs.getString(2);
            if (productName.equals(name)) {
                String productType = rs.getString(5);
                double productPrice = rs.getDouble(3);
                String productManufacturer = rs.getString(4);
                int productQuantity = rs.getInt(6);
                return new Product(productName, productPrice, productManufacturer, productType, productQuantity);
            }
        }
        return null;
    }
    
    // Find product based on name & type
    public Product findProduct(String name, String type) throws SQLException {
        String read = "SELECT * FROM IOTUSER.PRODUCT WHERE NAME = '" + name + "' AND TYPE='" + type + "'";
        ResultSet rs = st.executeQuery(read);
        while (rs.next()) {
            String productName = rs.getString(2);
            String productType = rs.getString(5);
            if (productName.equals(name) && productType.equals(type)) {
                double productPrice = rs.getDouble(3);
                String productManufacturer = rs.getString(4);
                int productQuantity = rs.getInt(6);
                return new Product(productName, productPrice, productManufacturer, productType, productQuantity);
            }
        }
        return null;
    }
    
    // Find product based on their ID
    public Product findProductID(long id) throws SQLException {
        String read = "SELECT * FROM IOTUSER.PRODUCT";
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
    
    // SQL query to update product details based on ID
    public void updateProductID(long id, String name, double price, String manufacturer, String type, int quantity) throws SQLException { // WHERE NAME='" + name + "'"
        st.executeUpdate("UPDATE IOTUSER.PRODUCT SET NAME='" + name + "', PRICE= " + price + ", MANUFACTURER= '" + manufacturer + "', TYPE= '" + type + "', QUANTITY_IN_STOCK= " + quantity + " WHERE PRODUCT_ID = " + id + "");
    }
    
    // SQL query to delete a product based on name
    public void deleteProduct(String name) throws SQLException {
        st.executeUpdate("DELETE FROM IOTUSER.PRODUCT WHERE NAME='" + name + "'");
    }
    
    // Used to fetch all products stored in the database
    public ArrayList<Product> fetchProducts() throws SQLException {
        String fetch = "SELECT * FROM IOTUSER.PRODUCT";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Product> temp = new ArrayList();

        while (rs.next()) {
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
    

    // Search by name & type -- kinda redundant but search has two input fields anyways
    public ArrayList<Product> findProductList(String name, String type) throws SQLException {
        String fetch = "SELECT * FROM IOTUSER.PRODUCT WHERE NAME= '" + name + "' AND TYPE='" + type + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Product> temp = new ArrayList();

        while (rs.next()) {
            String productName = rs.getString(2);
            String productType = rs.getString(5);
            if (productName.equals(name) && productType.equals(type)) {
                Long product_id = rs.getLong(1);
                double productPrice = rs.getDouble(3);
                String productManufacturer = rs.getString(4);
                int productQuantity = rs.getInt(6);
                temp.add(new Product(product_id, productName, productPrice, productManufacturer, productType, productQuantity));
            }
        }
        return temp;
    }
    
    // Search by name
    public ArrayList<Product> findProductNameList(String name) throws SQLException {
        String fetch = "SELECT * FROM IOTUSER.PRODUCT WHERE NAME= '" + name + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Product> temp = new ArrayList();

        while (rs.next()) {
            String productName = rs.getString(2);
            if (productName.equals(name)) {
                Long product_id = rs.getLong(1);
                String productType = rs.getString(5);
                double productPrice = rs.getDouble(3);
                String productManufacturer = rs.getString(4);
                int productQuantity = rs.getInt(6);
                temp.add(new Product(product_id, productName, productPrice, productManufacturer, productType, productQuantity));
            }
        }
        return temp;
    }
    
    // Search by type
    public ArrayList<Product> findProductTypeList(String type) throws SQLException {
        String fetch = "SELECT * FROM IOTUSER.PRODUCT WHERE TYPE= '" + type + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Product> temp = new ArrayList();

        while (rs.next()) {
            String productType = rs.getString(5);
            if (productType.equals(type)) {
                Long product_id = rs.getLong(1);
                String productName = rs.getString(2);
                double productPrice = rs.getDouble(3);
                String productManufacturer = rs.getString(4);
                int productQuantity = rs.getInt(6);
                temp.add(new Product(product_id, productName, productPrice, productManufacturer, productType, productQuantity));
            }
        }
        return temp;
    }
    
    // Check product name + type
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
    
    // Check product name
    public boolean checkProductName(String name) throws SQLException {
        String fetch = "SELECT * FROM IOTUSER.PRODUCT WHERE NAME= '" + name + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String productName = rs.getString(2);
            if (productName.equals(name)) {
                return true;
            }
        }
        return false;
    }
    
    // Check product type
    public boolean checkProductType(String type) throws SQLException {
        String fetch = "SELECT * FROM IOTUSER.PRODUCT WHERE TYPE= '" + type + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String productType = rs.getString(5);
            if (productType.equals(type)) {
                return true;
            }
        }
        return false;
    }
    
    // Check product id
    public boolean checkProductID(long id) throws SQLException {
        String read = "SELECT * FROM IOTUSER.PRODUCT";
        ResultSet rs = st.executeQuery(read);

        while (rs.next()) {
            Long productID = rs.getLong(1);
            if (productID == id) {
                return true;
            }
        }
        return false;
    }
    
       //Adds order to the table//
    public void addOrders(int orderId, int orderTime, int orderDate, int shippingDate, int shippingTime, String status, String email, String shippingId, String paymentId) throws SQLException {
        st.executeUpdate("INSERT INTO iotuser.Orders " + "VALUES ('" + orderId + "', '" + orderTime + "', '" + orderDate + "', '" + shippingDate + "',  '" + status + "',  '" + email + "',  '" + shippingId + "',  '" + paymentId + "')");

    }
    
    //updates saved orders//
     public void updateOrderDetail(int quantity, double totalPrice) throws SQLException {
        st.executeUpdate("UPDATE iotuser.OrderDetails SET Quantity ='" + quantity + "',TOTAL_PRICE='" + totalPrice + "'");
    }

     /// search for orders via order_id and Order_date///
     public User findOrders(int orderId, int orderDate) throws SQLException {
        String fetch = "select * from iotuser.Orders where ORDER_ID = '" + orderId + "' and ORDER_DATE = '" + orderDate + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String OrderId = rs.getString(2);
            String OrderDate = rs.getString(3);
            if (OrderId.equals(orderId) && OrderDate.equals(orderDate)) {
                String idOrder = rs.getString(6);
                String dateOrder = rs.getString(6);
                String timeOrder = rs.getString(6);
                String statusOrder = rs.getString(6);
                String shippedTime = rs.getString(6);
                String shippedDate = rs.getString(6);
                String EMAIL= rs.getString(6);
                String SHIPPEDID = rs.getString(6);
                String PaymentID = rs.getString(6);
                //return new Orders(Integer.parseInt(idOrder), Integer.parseInt(dateOrder),Integer.parseInt(timeOrder), Integer.parseInt(statusOrder),Integer.parseInt(shippedTime), shippedDate, EMAIL, SHIPPEDID, PaymentID);
            }
        }
        return null;
    }
    
}
