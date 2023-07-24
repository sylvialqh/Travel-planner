package com.example.trip.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import com.google.gson.JsonObject;
import lombok.Builder;
import lombok.Data;
// import org.json.JSONObject;

@Data
@TableName(value = "plan")
public class Plan {
    @TableId(type=IdType.AUTO)
    private Integer id;

    private String start;

    private String end;

    private String des;

    private String plan;

    private Integer uid;

    @TableField(exist = false)
    private JsonObject planJson;
}
