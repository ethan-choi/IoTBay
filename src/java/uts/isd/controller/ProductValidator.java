
package IoTBay.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jackie Lim ([A-Za-z0-9()+'/\".-]+[\\s])+[A-Za-z0-9()+'/\".-]*
 * Created: 31/05/2020
 */ 
public class ProductValidator { 
    private String namePattern = "([a-zA-Z0-9+,'\"/._-]+[\\s])*[a-zA-Z0-9+,'\"/._-]*"; 
    private String pricePattern = "^[0-9]+(\\.[0-9]{1,2})?$";
    private String manufacturerPattern = "([a-zA-Z0-9+,'\"/._-]+[\\s])*[a-zA-Z0-9+,'\"/._-]*";
    private String typePattern = "([a-zA-Z0-9+,'\"/._-]+[\\s])*[a-zA-Z0-9+,'\"/._-]*";
    private String quantityPattern = "([0-9]+)";
              
    public ProductValidator(){   
    }       

    // Boolean function that matches input against a pattern using Pattern & Matcher classes from "java.util.regex"
    public boolean validate(String pattern, String input){       
       Pattern regEx = Pattern.compile(pattern);       
       Matcher match = regEx.matcher(input);       
       return match.matches(); 
    }       
    
    public boolean checkEmpty(String name, String type) {       
       return name.isEmpty() || type.isEmpty();
    }
    
    public boolean checkFields(String name, String type, String price, String manufacturer, String quantity) {       
       return name.isEmpty() || type.isEmpty() || price.isEmpty() || manufacturer.isEmpty() || quantity.isEmpty();   
    }

    public boolean validateName(String name) {                       
       return validate(namePattern, name);   
    }
    public boolean validatePrice(String price) {                       
       return validate(pricePattern, price);   
    }
    public boolean validateManufacturer(String manufacturer) {                       
       return validate(manufacturerPattern, manufacturer);   
    }
    public boolean validateType(String type) {                       
       return validate(typePattern, type);   
    }
    public boolean validateQuantity(String quantity) {                       
       return validate(quantityPattern, quantity);   
    }

    public void clear(HttpSession session) {
        session.setAttribute("nameErr", "Enter name:");
        session.setAttribute("priceErr", "Enter price:");
        session.setAttribute("manufacturerErr", "Enter manufacturer:");
        session.setAttribute("typeErr", "Enter type:");
        session.setAttribute("quantityErr", "Enter quantity:");
        session.setAttribute("existErr", "");
    }
}
