package cn.jiangong.controller.admin;

import cn.jiangong.entity.BackUser;
import cn.jiangong.entity.Menu;
import cn.jiangong.service.MenuServiceImpl;
import cn.jiangong.service.UserServiceImpl;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("adminMenu")
public class AdminMenuController {


    @Autowired
    MenuServiceImpl menuService;

    @Autowired
    UserServiceImpl userService1;

    @ResponseBody
    @RequestMapping("/selectOptionMenuList")
    public Object selectOptionMenuList(String parentId){
        List<Menu> menus = menuService.selectFewMenuList(parentId);
        return menus;
    }

    @ResponseBody
    @RequestMapping("/selectListMenuList")
    public Object selectListMenuList(String parentId,Integer page,Integer limit){
        PageInfo<Menu> pageInfo = menuService.selectManyMenuList(parentId,page,limit);
        HashMap<String,Object> hashMap = new  HashMap<String,Object>();
        hashMap.put("code",0);
        hashMap.put("msg","");
        hashMap.put("count",pageInfo.getTotal());
        hashMap.put("data",pageInfo.getList());
        return JSON.toJSONString(hashMap);
    }


    @ResponseBody
    @RequestMapping("/selectEveryMenuList")
    public Object selectEveryMenuList(String roleId){
        return JSON.toJSONString(menuService.selectEveryMenuList(roleId));
    }

   




    @ResponseBody
    @RequestMapping("/insertMenu")
    public Object insertMenu(String name ,String parentId){
        return  menuService.insertMenu(name,parentId);
    }

    @ResponseBody
    @RequestMapping("/updateMenuUrl")
    public Object updateMenuUrl(String id,String url,String name){
        return  menuService.updateMenu(id,url,name);
    }

    @ResponseBody
    @RequestMapping("/deleteMenu")
    public Object deleteMenu(String id,String url){
        return  menuService.deleteMenu(id);
    }

}
