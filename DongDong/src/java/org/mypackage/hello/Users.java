/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.mypackage.hello;

/**
 *
 * @author bochhuang2
 */
public class Users {
    private String username;
    private String password;   
    private float loyaltyPoints;
    private int role;
    
    public Users(){
        username = null;
        password = null;
        loyaltyPoints=0;
        role = 1;
    
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

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the role
     */
    public int getRole() {
        return role;
    }

    /**
     * @param role the role to set
     */
    public void setRole(int role) {
        this.role = role;
    }
    
    public float getLoyPoint(){
        return loyaltyPoints;
    }
    
    public void setLoyPoint(float p){
        this.loyaltyPoints=p;
    }
    
    
}
