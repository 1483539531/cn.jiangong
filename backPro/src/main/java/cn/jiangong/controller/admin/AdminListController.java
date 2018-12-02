package cn.jiangong.controller.admin;

import cn.jiangong.entity.BackUser;
import cn.jiangong.entity.Menu;
import cn.jiangong.entity.Role;
import cn.jiangong.service.MenuServiceImpl;
import cn.jiangong.service.RoleServiceImpl;
import cn.jiangong.service.UserServiceImpl;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("adminList")
public class AdminListController {

    @Autowired
    UserServiceImpl userService;
    @Autowired
    RoleServiceImpl roleService;

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
    @RequestMapping("/selectBackUserList")
    public Object selectBackUserList(HttpServletRequest request,Integer page,Integer limit,String startdate,String enddate,String name){
        PageInfo<BackUser> backUserPageInfo = userService.selectBackUserList(page,limit,startdate,enddate,name);
        HashMap<String,Object> hashMap = new HashMap<String,Object>();
        hashMap.put("code",0);
        hashMap.put("msg","");
        hashMap.put("count",backUserPageInfo.getTotal());
        hashMap.put("data",backUserPageInfo.getList());
        System.out.println("--------------------------------------------------------------------------------");
        return JSON.toJSONStringWithDateFormat(hashMap,"yyyy-MM-dd HH:mm:ss");
    }


    @RequestMapping("/updateBackUserState")
    @ResponseBody
    public Object updateBackUserState(String state,String id){
        return  userService.updateBackUserState(state,id);
    }


    @RequestMapping("/selectAdminUser")
    @ResponseBody
    public Object selectAdminUser(Integer id){
        BackUser backUser = userService.selectBackUser(id);
        PageInfo<Role> pageInfo = roleService.selectRoleList(1, 20);
        List<Role> roles = pageInfo.getList();
        HashMap<String,Object> hashMap = new HashMap<String,Object>();
        hashMap.put("backUser",backUser);
        hashMap.put("roles",roles);
        return JSON.toJSONString(hashMap);
    }

    @ResponseBody
    @RequestMapping("updateBackUser")
    public Object updateBackUser(String zhanghao, String password,Integer userId,Integer roleId){
           boolean s = userService.updateBackUser(zhanghao, password, userId, roleId);
             System.out.println(s);
            return  s;
    }

}
