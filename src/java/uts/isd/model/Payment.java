/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author User
 */
public class Payment implements Serializable{
    private String PaymentID;
    private String CardNumber;
    private String CardType;
    private String CardHolder;
    private String ExpirationDate;
    private String CVV;
    private String Email;

    /**
     *
     * @param PaymentID
     * @param CardNumber
     * @param CardType
     * @param CardHolder
     * @param ExpirationDate
     * @param CVV
     * @param Email
     */
    public Payment(String PaymentID, String CardNumber, String CardType, String CardHolder, String ExpirationDate, String CVV, String Email) {
        this.PaymentID = PaymentID;
        this.CardNumber = CardNumber;
        this.CardType = CardType;
        this.CardHolder = CardHolder;
        this.ExpirationDate = ExpirationDate;
        this.CVV = CVV;
        this.Email = Email;
    }

    public String getPaymentID() {
        return PaymentID;
    }

    public void setPaymentID(String PaymentID) {
        this.PaymentID = PaymentID;
    }

    public String getCardNumber() {
        return CardNumber;
    }

    public void setCardNumber(String CardNumber) {
        this.CardNumber = CardNumber;
    }

    public String getCardType() {
        return CardType;
    }

    public void setCardType(String CardType) {
        this.CardType = CardType;
    }

    public String getCardHolder() {
        return CardHolder;
    }

    public void setCardHolder(String CardHolder) {
        this.CardHolder = CardHolder;
    }

    public String getExpirationDate() {
        return ExpirationDate;
    }

    public void setExpirationDate(String ExpirationDate) {
        this.ExpirationDate = ExpirationDate;
    }

    public String getCVV() {
        return CVV;
    }

    public void setCVV(String CVV) {
        this.CVV = CVV;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
    
    
}
