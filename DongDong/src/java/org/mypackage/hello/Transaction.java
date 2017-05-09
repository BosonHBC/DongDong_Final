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
public class Transaction {
    private String uName;
    private String bookName;
    private float price;
    private int amount;
    private String location;
    private int cdNumber;
    private int cdSafetyCode;
    private int status;
    private String date;
            
    public Transaction(){
        
    }
    
    public void setDate(String d){
        this.date=d;
    }
    
    public String getDate(){
        return date;
    }
    
    public void setUName(String name){
        this.uName=name;
    }
    
    public String getUName(){
        return uName;
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
    
}
