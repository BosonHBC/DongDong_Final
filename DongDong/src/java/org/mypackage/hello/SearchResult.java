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
public class SearchResult {
    
    private final int EBOOK = 0;
    private final int PBOOK = 1;
    
    private String imgName;
    private String title;
    private float price;
    private String author;
    private String publisher;
    private String introduce;
    private int type;
    
    public SearchResult(){
        imgName = null;
        title = null;
        price = 0;
        author = null;
        publisher = null;
        introduce = null;
        type = EBOOK;
    }

    /**
     * @return the imgUrl
     */
    public String getImgUrl() {
        String url;
        url = "./image/"+imgName;
        
        return url;
    }

    /**
     * @param imgUrl the imgUrl to set
     */
    public void setImgUrl(String imgUrl) {
        this.imgName = imgUrl;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the price
     */
    public String getPrice() {
        String p;
        p = "$" + this.price;
        return p;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
    }

    /**
     * @return the author
     */
    public String getAuthor() {
        return author;
    }

    /**
     * @param author the author to set
     */
    public void setAuthor(String author) {
        this.author = author;
    }

    /**
     * @return the publisher
     */
    public String getPublisher() {
        return publisher;
    }

    /**
     * @param publisher the publisher to set
     */
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    /**
     * @return the introduce
     */
    public String getIntroduce() {
        return introduce;
    }

    /**
     * @param introduce the introduce to set
     */
    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(int type) {
        this.type = type;
    }
}
