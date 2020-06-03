package uts.isd.model.dao;

import uts.isd.model.Student;

import java.sql.*;
import java.util.ArrayList;
import uts.isd.model.Student;
import uts.isd.model.accessLog;

public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public Student findUser(String email, String password) throws SQLException {
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
}
