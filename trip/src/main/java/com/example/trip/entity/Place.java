package com.example.trip.entity;



import lombok.Data;

/**
 * things_todo
 * @author
 */
@Data
//@TableName(value = "things_todo")
public class Place {

    private String name;

    private String img;

//    private String desc;

    private String address;

    private String city;

    private String type;

    private String rating = "unknown";
    private String price_level;

    public Place(String name, String img, String address, String city, String type, String rating) {
        this.name = name;
        this.img = img;
        this.address = address;
        this.city = city;
        this.type = type;
        if(rating != null) { this.rating = rating;}
    }

    public void setPriceLevel(String priceLevel) {
        if(Integer.parseInt(priceLevel) == 2) {
            this.price_level = "Moderate";
        } else if(Integer.parseInt(priceLevel) >= 3) {
            this.price_level = "Expensive";
        }else if(Integer.parseInt(priceLevel) == 1) {
            this.price_level = "Inexpensive";
        }
    }
}
