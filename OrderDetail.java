/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author 1
 */
public class OrderDetail implements Serializable
{
    private int quantity;
    private double totalPrice;

    public OrderDetail(int quantity, double totalPrice) {
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }

    public int getQunatity() {
        return quantity;
    }

    public void setQunatity(int qunatity) {
        this.quantity = qunatity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    
}
