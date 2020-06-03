package uts.isd.model;

import java.io.Serializable;

/**
 *
 * Author: Jackie Lim
 * Created: 30/05/2020
 */
public class Product implements Serializable {
    private Long product_id;
    private String name;
    private double price;
    private String manufacturer;
    private String type;
    private int quantity;

    public Product(String name, double price, String manufacturer, String type, int quantity) {
        this.product_id = null;
        this.name = name;
        this.price = price;
        this.manufacturer = manufacturer;
        this.type = type;
        this.quantity = quantity;
    }
    
    public Product(Long product_id, String name, double price, String manufacturer, String type, int quantity) {
        this.product_id = product_id;
        this.name = name;
        this.price = price;
        this.manufacturer = manufacturer;
        this.type = type;
        this.quantity = quantity;
    }
    
    public Long getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Long product_id) {
        this.product_id = product_id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
