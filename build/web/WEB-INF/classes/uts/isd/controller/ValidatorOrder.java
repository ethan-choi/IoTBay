
package uts.isd.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

public class ValidatorOrder implements Serializable { 
    private String product_IdPattern = "([0-9]+)";
 private String quantityPattern = "([0-9]+)";
              
    public ValidatorOrder(){   
    }       
    
    public boolean validate(String pattern, String input){       
       Pattern regEx = Pattern.compile(pattern);       
       Matcher match = regEx.matcher(input);       
       return match.matches(); 
    }       
    
    public boolean checkEmpty(String name, String type) {       
       return name.isEmpty() || type.isEmpty();
    }
    
    public boolean checkFields(String product_Id,String quantity) {       
       return product_Id.isEmpty()|| quantity.isEmpty();   
    }

    public boolean validateName(String product_Id) {                       
       return validate(product_IdPattern, product_Id);   
    }
   
    public boolean validateQuantity(String quantity) {                       
       return validate(quantityPattern, quantity);   
    }

    public void clear(HttpSession session) {
        session.setAttribute("product_Id", "Enter product_Id:");
        session.setAttribute("quantityErr", "Enter quantity:");
      
    }
}
