/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

/**
 *
 * @author yuanel
 */
public class Refund {
    private String username;
    private String bookName;
    private float price;
    private int amount;
    private String location;
    private int cdNumber;
    private int cdSafetyCode;
    private int status;
    private String date;
            
    public Refund(){
        
    }
    
   
    public void setBName(String name){
        this.bookName=name;
    }
    
    public String getBName(){
        return bookName;
    }
    
    public void setPrice(float p){
        this.price=p;
    }
    
    public float getPrice(){
        return price;
    }
    
    public void setAmount(int a){
        this.amount=a;
    }
    
    public int getAmount(){
        return amount;
    }
    
    public void setLocation(String l){
        this.location=l;
    }
    
    public String getLocation(){
        return location;
    }
    
    public void setCdNum(int n){
        this.cdNumber=n;
    }
    
    public int getCdNum(){
        return cdNumber;
    }
    
    public void setCdSafeCd(int c){
        this.cdSafetyCode=c;
    }
    
    public int getCdSafeCd(){
        return cdSafetyCode;
    }
    
    public void setStatus(int s){
        this.status=s;
    }
    
    public int getStatus(){
        return status;
    }


    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }
    
}
