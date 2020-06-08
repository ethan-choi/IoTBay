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
public class Orders implements Serializable
{
   private int orderId;
    private int orderTime;
    private int orderDate;
    private int shippingDate;
    private int shippingTime;
    private String status;
    private String email;
    private String shippingId;
    private String paymentId;

    public Orders(int orderId, int orderTime, int orderDate, int shippingDate, int shippingTime, String status, String email, String shippingId, String paymentId) {
        this.orderId = orderId;
        this.orderTime = orderTime;
        this.orderDate = orderDate;
        this.shippingDate = shippingDate;
        this.shippingTime = shippingTime;
        this.status = status;
        this.email = email;
        this.shippingId = shippingId;
        this.paymentId = paymentId;
    }
    
            
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(int orderTime) {
        this.orderTime = orderTime;
    }

    public int getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(int orderDate) {
        this.orderDate = orderDate;
    }

    public int getShippingDate() {
        return shippingDate;
    }

    public void setShippingDate(int shippingDate) {
        this.shippingDate = shippingDate;
    }

    public int getShippingTime() {
        return shippingTime;
    }

    public void setShippingTime(int shippingTime) {
        this.shippingTime = shippingTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getShippingId() {
        return shippingId;
    }

    public void setShippingId(String shippingId) {
        this.shippingId = shippingId;
    }

    public String getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }
 
    
}
