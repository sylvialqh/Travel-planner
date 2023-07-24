package com.example.trip.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.trip.entity.ThingsTodo;
import com.example.trip.service.ThingsTodoService;
import com.example.trip.utils.Result;
import com.textrazor.AnalysisException;
import com.textrazor.NetworkException;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/things")
public class ThingsTodoController {
   @Autowired
   private ThingsTodoService thingsTodoService;

   @RequestMapping("/list")
   public List ThingsTodoList(){
      return  thingsTodoService.list();
   }
   @RequestMapping("/attractionlist")
   public Result AttractionList(){
      QueryWrapper<ThingsTodo>queryWrapper=new QueryWrapper<>();
      queryWrapper.eq("type_","Attraction");
      List attrLists = thingsTodoService.list(queryWrapper);
      Result result = Result.ok().data("attractions", attrLists);
      return  result;
   }
   @RequestMapping("/listbytype")
   public List GetListByType( @RequestParam String[] types){
      QueryWrapper<ThingsTodo>queryWrapper=new QueryWrapper<>();
      for (String type : types) {
         queryWrapper.eq("type_",type).or();
      }


      return  thingsTodoService.list(queryWrapper);
   }

   @DeleteMapping("/{id}")
   public boolean delete(@PathVariable Integer id)
   {
      return thingsTodoService.removeById(id);
   }

   @GetMapping("/page")
   public IPage<ThingsTodo> findPage(@RequestParam Integer pageNum, @RequestParam Integer pageSize
           , @RequestParam(defaultValue = "")String type, @RequestParam(defaultValue = "") String city){
      IPage<ThingsTodo> page=new Page<>(pageNum,pageSize);
      QueryWrapper<ThingsTodo> queryWrapper=new QueryWrapper<>();
      queryWrapper.like(Strings.isNotEmpty(type),"type",type);
      queryWrapper.like("city",city);
      return thingsTodoService.page(page,queryWrapper);
   }

}
