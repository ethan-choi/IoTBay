package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author ethan
 */
public class Student implements Serializable {

    private String name;
    private String email;
    private String password;
    private String number;
    private String status;
    private String role;

    public Student(String name, String email, String password, String number, String status, String role) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.number = number;
        this.status = status;
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.number = status;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}
