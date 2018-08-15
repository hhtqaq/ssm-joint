package com.ecjtu.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * @Auther: hht
 * @Date: 2018/8/13 19:29
 * @Description:
 * 通用的json信息
 */
public class Msg {
    //相应的状态码  假设200成功 400失败
    private int code;
    //提示的信息
    private String msg;
    //返回的数据
    private Map<String,Object> map=new HashMap<>();

    public static Msg success(){
        Msg msg = new Msg();
        msg.setCode(200);
        msg.setMsg("处理成功");
        return  msg;
    }
    public static Msg fail(){
        Msg msg = new Msg();
        msg.setCode(400);
        msg.setMsg("处理失败");
        return  msg;
    }
    public Msg add(String key,Object value){
            this.map.put(key,value);
            return this;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
