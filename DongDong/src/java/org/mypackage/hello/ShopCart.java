/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.mypackage.hello;
import java.util.ArrayList;
import org.mypackage.hello.Commodity;
/**
 *
 * @author bochhuang2
 */
public class ShopCart {
    private ArrayList<Commodity> commodities =new ArrayList();
    private int amount;
    
    public ShopCart(){
       amount=0;
    }
    
    public void addCommodity(Commodity c){
        commodities.add(c);
        amount+=c.getNumber();
    }
    /**
     * @return the amount
     */
    
    public Commodity getCommodity(int i){
        return commodities.get(i);
    }
    public void removeCommodity(int i){
        amount-=this.getCommodity(i).getNumber();
        commodities.remove(i);
    }
    public int getCommoditiesSize(){
        return commodities.size();
    }
    public int getAmount() {
        return amount;
    }
   

   
    
   
    
}
