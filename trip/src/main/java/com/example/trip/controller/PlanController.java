package com.example.trip.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.trip.config.AuthInterceptor;
import com.example.trip.entity.Place;
import com.example.trip.entity.User;
import com.example.trip.entity.Plan;
import com.example.trip.service.PlacesAPIService;
import com.example.trip.service.PlanService;
import com.example.trip.utils.Result;
import com.example.trip.utils.TokenUtils;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.textrazor.AnalysisException;
import com.textrazor.NetworkException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/plan")
public class PlanController {

    @Autowired
    private PlanService planService;

    @Autowired
    private PlacesAPIService placesAPIService;

    private List planItemList = new ArrayList<>();

    Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

    @GetMapping("/list")
    public HashMap<Integer, List> planList(@RequestParam("startDay") String startDay, @RequestParam("endDay") String endDay,
                         @RequestParam("des") String des, // des value: sydney, brisbane, melbourne
                         @RequestParam("budget") String budget, @RequestParam("style") String[] style,
                         @RequestParam("cuisine") String[] cuisine,
                         @RequestParam("group") String group) throws AnalysisException, NetworkException, ParseException {

        // reset
        HashMap<Integer, List> planMap = new HashMap<Integer, List>();

        List<Place> thingsList = placesAPIService.searchThingsTodo(des, style);

        // calculate duration
        Date dateAfter=new SimpleDateFormat("yyyy-MM-dd").parse(startDay);
        Date dateBefore=new SimpleDateFormat("yyyy-MM-dd").parse(endDay);
        long timeDiff = Math.abs(dateAfter.getTime() - dateBefore.getTime());
        int duration = (int) TimeUnit.DAYS.convert(timeDiff, TimeUnit.MILLISECONDS)+1;
        // System.out.println("duration: "+duration);

        // track day, number of rows found by sql query
        int j = 1;
        int num;

        // Assign to per day
        num = thingsList.size();
        System.out.println("number of things found: " + num);

        for(int i=0; i<num; i++) {
            if(j>duration) {
                System.out.println("larger j: "+j);
                j = 1;
            }

            List temp;
            if(planMap.get(j) == null) {
                temp = new ArrayList<Place>();
            } else {
                temp = planMap.get(j);
            }
            temp.add(thingsList.get(i));
            // Add to return map
            planMap.put(j,temp);
            j++;

        }

        j = 1; // reset j for later

        // Cuisine
        List<Place> cuisineList = placesAPIService.searchFood(des, budget, cuisine);

        // Assign to per day
        num = cuisineList.size();
        System.out.println("number of cuisine found: " + num);

        for(int i=0; i<duration; i++) {
            List temp;
            if(planMap.get(j) == null) {
                temp = new ArrayList<Place>();
            } else {
                temp = planMap.get(j);
            }
            System.out.println("cuisine found: " + cuisineList.get(i));
            temp.add(cuisineList.get(i));
            // Add to return map
            planMap.put(j,temp);
            j++;
        }

        return planMap;

    }


    @PostMapping("/save")
    public Result save(@RequestBody Plan plan){
        User res = TokenUtils.getUser();
        if (res == null) {
            return  Result.error(20001, "no such user");
        }
        Integer uid = res.getId();
        plan.setUid(uid);
        boolean success = planService.save(plan); // insert
        if(success) {
            return Result.ok();
        } else {
            return Result.error(20001,"error insertion");
        }
    }

    @GetMapping("/savedPlan")
    public Result getSavedPlan() { // @RequestParam("startDay") String startDay, @RequestParam("endDay") String endDay, @RequestParam("des") String des
        logger.info("======= saved plan is called: ");
        User res = TokenUtils.getUser();
        if (res == null) {
            return  Result.error(20001, "no such user");
        }
        Integer uid = res.getId();
        QueryWrapper<Plan> query = new QueryWrapper<>();
        query.eq("uid",uid).orderByDesc("id").last("limit 1");
        List<Plan> plans = planService.list(query); // should contain only 1 item
        if(plans.size() != 1) {
            logger.info("======= Plans found: " + plans);
            return  Result.error(20001, "no plan found");
        }
        logger.info("======= Plans found: " + plans);
        Plan plan = planService.list(query).get(0);
        String planString = plan.getPlan();
        logger.info("======= Plan found: " + plan.getPlan());
        return Result.ok().data("plan",plan.getPlan()).data("start", plan.getStart()).data("end", plan.getEnd()).data("des", plan.getDes());
    }



}
