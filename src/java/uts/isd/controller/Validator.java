package uts.isd.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

public class Validator implements Serializable {

    private String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";
    private String namePattern = "^[ A-Za-z]+$";
    private String passwordPattern = "[a-z0-9]{5,}";
    private String numberPattern = "^\\d{10}$";
    private String accessKey = "123";
    private String datePattern = "^(19|20)\\d\\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$";
    

    public Validator() {
    }

    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }

    public boolean validateAccessKey(String userAccessKey) {
        return accessKey.equals(userAccessKey);
    }

    public boolean checkEmpty(String email, String password) {
        return email.isEmpty() || password.isEmpty();
    }

    public boolean validateEmail(String email) {
        return validate(emailPattern, email);
    }

    public boolean validateName(String name) {
        return validate(namePattern, name);
    }

    public boolean validatePassword(String password) {
        return validate(passwordPattern, password);
    }

    public boolean validateNumber(String number) {
        return validate(numberPattern, number);
    }
    
    public boolean validateDate(String date){
        return validate (datePattern, date);
    }

    public void clear(HttpSession session) {
        session.setAttribute("emailErr", "");
        session.setAttribute("passErr", "");
        session.setAttribute("existErr", "");
        session.setAttribute("nameErr", "");
        session.setAttribute("numberErr", "");
        session.setAttribute("activateErr", "");
        session.setAttribute("accessErr", "");
    }
}
