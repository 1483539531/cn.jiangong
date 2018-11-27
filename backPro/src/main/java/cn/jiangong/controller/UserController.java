package cn.jiangong.controller;

import cn.jiangong.entity.BackUser;
import cn.jiangong.entity.Menu;
import cn.jiangong.service.MenuServiceImpl;
import cn.jiangong.service.UserServiceImpl;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserServiceImpl userService;

    @Autowired
    MenuServiceImpl menuService;


    @RequestMapping("/login")
    public String login(String zhanghao, String password, HttpServletRequest request){
        BackUser backUsers = userService.login(zhanghao, password);
        if(backUsers == null){
            return "login";
        }else{
            request.getSession().setAttribute("user",backUsers);
        }
        return "index";
    }

    @ResponseBody
    @RequestMapping("BackUserList")
    public Object BackUserList(HttpServletRequest request,Integer page,Integer limit,String startdate,String enddate,String name){
        PageInfo<BackUser> backUserPageInfo = userService.selectUserList(page,limit,startdate,enddate,name);
        HashMap<String,Object> hashMap = new  HashMap<String,Object>();
        hashMap.put("code",0);
        hashMap.put("msg","");
        hashMap.put("count",backUserPageInfo.getTotal());
        hashMap.put("data",backUserPageInfo.getList());
        System.out.println(backUserPageInfo.getList());
        return JSON.toJSONStringWithDateFormat(hashMap,"yyyy-MM-dd HH:mm:ss");
    }

    @RequestMapping("updateBackUserState")
    @ResponseBody
    public Object updateBackUserState(String state,String id){
        System.out.println(state);
        return  userService.updateBackUserState(state,id);
    }


    @ResponseBody
    @RequestMapping("selectOptionMenuList")
    public Object selectOptionMenuList(String parentId){
        List<Menu> menus = menuService.selectOptionMenuList(parentId);
        return menus;
    }

    @ResponseBody
    @RequestMapping("selectListMenuList")
    public Object selectListMenuList(String parentId,Integer page,Integer limit){
        PageInfo<Menu> pageInfo = menuService.selectListMenuList(parentId,page,limit);
        HashMap<String,Object> hashMap = new  HashMap<String,Object>();
        hashMap.put("code",0);
        hashMap.put("msg","");
        hashMap.put("count",pageInfo.getTotal());
        hashMap.put("data",pageInfo.getList());
        return JSON.toJSONString(hashMap);
    }


    @ResponseBody
    @RequestMapping("insertMenu")
    public Object insertMenu(String name ,String parentId){
        return  menuService.insertMenu(name,parentId);
    }



}
