package uts.isd.controller;
import java.util.Date;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.*;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;
import uts.isd.model.User;

public class TestDB {

    private static Scanner in = new Scanner(System.in);
    private DBConnector connector;
    private Connection conn;
    private DBManager db;

    public static void main(String[] args) throws SQLException {
        (new TestDB()).runQueries();
    }

    public TestDB() {
        try {
            connector = new DBConnector();
            conn = connector.openConnection();
            db = new DBManager(conn);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private char readChoice() {
        System.out.print("Operation CRUDS or * to exit: ");
        return in.nextLine().charAt(0);
    }

    private void runQueries() throws SQLException {
        char c;
        while ((c = readChoice()) != '*') {
            switch (c) {
                case 'c':
                    testAdd();
                    break;
                case 'r':
                    testRead();
                    break;
                case 'u':
                    testUpdate();
                    break;
                case 'd':
                    testDelete();
                    break;
                case 'l':
                    addAccessLog();
                    break;
                default:
                    System.out.println("Unknown command");
                    break;

            }
        }
    }

    
    
    
    
    private void addAccessLog(){
       Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
        String stringDate = dateFormat.format(date);  

        System.out.print("Time: ");
        String time = in.nextLine();
        System.out.print("Action: ");
        String action = in.nextLine();
        System.out.print("Email: ");
        String email = in.nextLine();
        
        
        try {
            db.addAccessLog(stringDate, time, action, email);
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Access Log added");
        
        
    }
    private void testAdd() {
        System.out.print("User email: ");
        String email = in.nextLine();
        System.out.print("User name: ");
        String name = in.nextLine();
        System.out.print("User password: ");
        String password = in.nextLine();
        System.out.print("User dob: ");
        String number = in.nextLine();
        System.out.print("User role: ");
        String role = in.nextLine();
        String status = "active";


        try {
            db.addUser(email, password, name, number, status, role);
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("User added");
    }

    private void testRead() throws SQLException {
        System.out.print("User email: ");
        String email = in.nextLine();
        System.out.print("User password: ");
        String password = in.nextLine();

        User user = db.findUser(email, password);

        if (user != null) {
            System.out.println("User " + user.getName() + "exists in database.");
        } else {
            System.out.println("User does not exist");
        }
    }

    private void testUpdate() {
        System.out.print("User email: ");
        String email = in.nextLine();
        System.out.print("User password: ");
        String password = in.nextLine();

        try {
            if (db.checkUser(email, password)) {
                System.out.print("User name: ");
                String name = in.nextLine();
                System.out.print("User number: ");
                String number = in.nextLine();
                System.out.print("User role: ");
                String role = in.nextLine();
                String status = "active";
                db.updateUser(name, email, password, number, status, role);
            } else {
                System.out.println("User does not exist");
            }
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void testDelete() {
        System.out.print("User email: ");
        String email = in.nextLine();
        System.out.print("User password: ");
        String password = in.nextLine();

        try {
            if (db.checkUser(email, password)) {
                db.deleteUser(email);
            } else {
                System.out.println("User does not exist");
            }
        } catch (SQLException ex) {
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
