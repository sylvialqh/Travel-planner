package com.example.trip.service;

import com.example.trip.entity.Place;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import okhttp3.*;
import org.springframework.stereotype.Service;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class PlacesAPIService {
    private final String API_KEY =  "AIzaSyD_n7IW6r4yD5ZpWtlUgDyk1sUbeTHA4WU";
    // Base URL
    private String baseUrl = "https://maps.googleapis.com/maps/api/place/textsearch/json";
    private OkHttpClient client;

    public PlacesAPIService() {
        this.client = new OkHttpClient().newBuilder().build(); // new OkHttpClient();
    }

    public List<Place> searchThingsTodo(String des, String[] interests) {

        ArrayList<String> queries = new ArrayList<String>();
        int num = 4; // number per type of activities recommended
        List<Place> queryRes = new ArrayList<>();

        // If user hasn't choosen a style, recommend he/she sightseeing
        if(interests.length == 0) {
            String[] newInterests = new String[]{"sightseeing"};
            interests = newInterests;
        }

        for (String i : interests) {
            String query = i + "%20in" + des;
            queries.add(query);
        }

        if(interests.length == 1) {
            num = 8;
        } else if (interests.length >= 3) {
            num = 3;
        }

        for (int i = 0; i < queries.size(); i++) {

            // Build the URL with the encoded query parameter
            MediaType mediaType = MediaType.parse("text/plain");
            // RequestBody body = RequestBody.create(mediaType, "");
            HttpUrl.Builder urlBuilder = HttpUrl.parse(baseUrl).newBuilder();
            urlBuilder.addQueryParameter("query", queries.get(i));
            urlBuilder.addQueryParameter("key", API_KEY);
            String url = urlBuilder.build().toString();
            Request request = new Request.Builder()
                    .url(url)
                    .get()
                    .build();
            try {
                Response response = client.newCall(request).execute();
                if (response.isSuccessful()) {
                    String jsonStr = response.body().string();

                    // Parse the JSON string into a JSON object using Gson
                    JsonParser jsonParser = new JsonParser();
                    JsonObject jo = (JsonObject) jsonParser.parse(jsonStr);
                    // Get the "data" array from the JSON object
                    JsonArray dataArray = jo.getAsJsonArray("results"); // get json array
                    // System.out.println(dataArray);

                    if (dataArray != null && dataArray.size() > 0) {

                        // Get the pth item from the array of activities found
                        for (int p = 0; p < dataArray.size(); p++) {
                            if(p == num) { break; }
                            JsonObject place = dataArray.get(p).getAsJsonObject();
                            // System.out.println(place);
                            String name = place.get("name").getAsString();
                            if(place.get("photos") == null){ continue; }
                            JsonArray photoDetails = place.get("photos").getAsJsonArray();
                            JsonObject imgObject = photoDetails.get(0).getAsJsonObject();
                            String img = "https://maps.googleapis.com/maps/api/place/photo?photo_reference=" +
                                    imgObject.get("photo_reference").getAsString() +
                                    "&maxwidth=300&key=" +
                                    API_KEY;
                            System.out.println("URL for image: " + img);
                            String address = place.get("formatted_address").getAsString();
                            String city = des;
                            String type = interests[i];
                            String rating = place.get("rating").getAsString();
                            Place thingsTodo = new Place(name, img, address, city, type, rating);
                            queryRes.add(thingsTodo);
                            //System.out.println(thingsTodo);
                        }

                    } else {
                        System.out.println("No data available in the array.");
                    }
                } else {
                    System.out.println("Request failed with code: " + response.code());
                }

            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        return queryRes;
    }

    // For budget and price level matching
    public String priceMatchMax(String budget){
        if(budget.equals("lowBudget")){
            return "2";
        } else if(budget.equals("mediumBudget")){
            return "3";
        } else {
            return "4";
        }
    }

    public String priceMatchMin(String budget){
        if(budget.equals("lowBudget")){
            return "1";
        } else if(budget.equals("mediumBudget")){
            return "2";
        } else {
            return "2";
        }
    }

    // For cuisine
    public List<Place> searchFood(String des, String budget, String[] cuisines) {

        ArrayList<String> queries = new ArrayList<String>();
        int num = 4; // number per type of activities recommended
        List<Place> queryRes = new ArrayList<>();

        for (String c : cuisines) {
            String query = c + "%food%20in" + des;
            queries.add(query);
        }

        if(cuisines.length == 0) {
            String query =  "food%20in" + des;
            queries.add(query);
        }

        if(cuisines.length == 1) {
            num = 7;
        } else if (cuisines.length >= 4) {
            num = 3;
        }

        for (int i = 0; i < queries.size(); i++) {

            // Build the URL with the encoded query parameter
            MediaType mediaType = MediaType.parse("text/plain");
            HttpUrl.Builder urlBuilder = HttpUrl.parse(baseUrl).newBuilder();
            urlBuilder.addQueryParameter("query", queries.get(i));
            urlBuilder.addQueryParameter("maxprice", priceMatchMax(budget));
            urlBuilder.addQueryParameter("minprice", priceMatchMin(budget));
            urlBuilder.addQueryParameter("key", API_KEY);
            String url = urlBuilder.build().toString();
            Request request = new Request.Builder()
                    .url(url)
                    .get()
                    .build();
            try {
                Response response = client.newCall(request).execute();
                if (response.isSuccessful()) {
                    String jsonStr = response.body().string();


                    JsonParser jsonParser = new JsonParser();
                    JsonObject jo = (JsonObject) jsonParser.parse(jsonStr);
                    JsonArray dataArray = jo.getAsJsonArray("results"); // get json array
                    // System.out.println(dataArray);

                    if (dataArray != null && dataArray.size() > 0) {

                        // Get the pth item from the array of activities found
                        for (int p = 0; p < dataArray.size(); p++) {
                            if(p == num) { break; }
                            JsonObject place = dataArray.get(p).getAsJsonObject();

                            // Remove those low rating places
                            String rating = place.get("rating").getAsString();
                            if(rating != null){
                                if(Double.parseDouble(rating) < 4.0) {
                                    continue;
                                }
                            }

                            // System.out.println(place);
                            String name = place.get("name").getAsString();
                            String img = "https://cdn.iconscout.com/icon/free/png-512/free-restaurant-18-118817.png?f=avif&w=128";
                            String address = place.get("formatted_address").getAsString();
                            String city = des;
                            String type = "food";
                            if(cuisines.length != 0) {
                                type = cuisines[i];
                            }
                            Place thingsTodo = new Place(name, img, address, city, type, rating);
                            thingsTodo.setPriceLevel(place.get("price_level").getAsString());
                            queryRes.add(thingsTodo);
                            // System.out.println(thingsTodo);
                        }

                    } else {
                        System.out.println("No data available in the array.");
                    }
                } else {
                    System.out.println("Request failed with code: " + response.code());
                }

            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        return queryRes;
    }



}
