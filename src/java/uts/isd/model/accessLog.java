
package uts.isd.model;

import java.util.Date;


public class accessLog {

    
    //Variables
    private String date;
    private String time;
    private String action;
    private String email;

    
    //Constructor
    public accessLog(String date, String time, String action, String email) {
        this.date = date;
        this.time = time;
        this.action = action;
        this.email = email;
    }
    
    
    //Getters + setters

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
