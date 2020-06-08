package uts.isd.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Ethan Choi
 */

public class ValidatorUserAccessManagement implements Serializable {

    
    //Email must include @ and . characters
    private String emailPattern = "^(.+)@(.+)$";
    
    //Name must be only letters
    private String namePattern = "^[ A-Za-z]+$";
    
    //Password must be at least 5 characters
    private String passwordPattern = "[a-z0-9]{5,}";
    
    //Mobile number must be 10 digits
    private String numberPattern = "^\\d{10}$";
    
    //Staff access key is 123
    private String accessKey = "123";
    
    //date must be YYYY-MM-DD
    private String datePattern = "^(19|20)\\d\\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$";

    
    
    public ValidatorUserAccessManagement() {
    }

    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }

    public boolean validateAccessKey(String userAccessKey) {
        return accessKey.equals(userAccessKey);
    }
    
    //Empty checkers

    public boolean checkEmptyLogin(String email, String password) {
        return email.isEmpty() || password.isEmpty();
    }

    public boolean checkEmptyEdit(String email, String password, String name, String number) {
        return email.isEmpty() || password.isEmpty() || name.isEmpty() || number.isEmpty();
    }

    public boolean checkEmptyCustomerRegister(String email, String password, String name, String number) {
        return email.isEmpty() || password.isEmpty() || name.isEmpty() || number.isEmpty();
    }

    public boolean checkEmptyStaffRegister(String accesskey, String email, String password, String name, String number) {
        return accesskey.isEmpty() || email.isEmpty() || password.isEmpty() || name.isEmpty() || number.isEmpty();
    }

    public boolean checkEmptyAccessLog(String date) {
        return date.isEmpty();
    }

    
    
    //Input field checkers
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

    public boolean validateDate(String date) {
        return validate(datePattern, date);
    }
    
    
    
    //Clear error sesisons

    public void clear(HttpSession session) {
        session.setAttribute("emailErr", "");
        session.setAttribute("passErr", "");
        session.setAttribute("existErr", "");
        session.setAttribute("nameErr", "");
        session.setAttribute("numberErr", "");
        session.setAttribute("activateErr", "");
        session.setAttribute("accessErr", "");
        session.setAttribute("emptyErrUam", "");
        session.setAttribute("updated", "");
        session.setAttribute("UsernameErr", "");
    }
}
