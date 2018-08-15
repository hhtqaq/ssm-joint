package com.ecjtu.controller;

import com.ecjtu.bean.Msg;
import com.ecjtu.bean.User;
import com.ecjtu.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    @RequestMapping("listUser")
    public String getUser(@RequestParam(value = "currentpage",defaultValue = "1")Integer currentpage, Model model){
        PageHelper.startPage(currentpage,9 );
        //startPage后紧跟的查询就是分页查询
        List<User> users=userService.findAll();
        //s使用pageInfo包装查询后的结果，只需要将pageInfo交给页面
        //封装了分页的一些参数 连续显示的页数
        PageInfo<User> pageInfo=new PageInfo<User>(users,5);
        model.addAttribute("pageInfo",pageInfo);
        return "register";
    }

    /**
     * 需要导入jackson包 对json支持
     * @author hht
     * @param currentpage
     * @return
     */
    @RequestMapping("list")
    @ResponseBody
    public Msg getUserWithJson(@RequestParam(value = "currentpage",defaultValue = "1")Integer currentpage){
        PageHelper.startPage(currentpage,9 );
        //startPage后紧跟的查询就是分页查询
        List<User> users=userService.findAll();
        //s使用pageInfo包装查询后的结果，只需要将pageInfo交给页面
        //封装了分页的一些参数 连续显示的页数
        PageInfo<User> pageInfo=new PageInfo<User>(users,5);
        return Msg.success().add("pageInfo",pageInfo);
    }
}
