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

public class SearchHandler {
   private String search_info;
   
   public SearchHandler(){
       search_info = null;
   }

    /**
     * @return the search_info
     */
    public String getSearch_info() {
        return search_info;
    }

    /**
     * @param search_info the search_info to set
     */
    public void setSearch_info(String search_info) {
       if(search_info == null || search_info.equalsIgnoreCase("")){
           search_info = " ";
       }
       
        this.search_info = search_info;
    }

   
   
}
