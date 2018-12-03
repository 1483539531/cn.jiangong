package cn.jiangong.controller.admin;

import cn.jiangong.entity.Role;
import cn.jiangong.service.RoleServiceImpl;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequestMapping("adminRole")
public class AdminRoleController {

    @Autowired
    RoleServiceImpl roleService;

    @ResponseBody
    @RequestMapping("/selectRoleList")
    public Object selectRoleList(Integer page,Integer limit){
        PageInfo<Role> pageInfo = roleService.selectRoleList(page,limit);
        HashMap<String,Object> hashMap = new  HashMap<String,Object>();
        hashMap.put("code",0);
        hashMap.put("msg","");
        hashMap.put("count",pageInfo.getTotal());
        hashMap.put("data",pageInfo.getList());
        return JSON.toJSONString(hashMap);
    }

    @ResponseBody
    @RequestMapping("/updateRole")
    public  Object updateRole(String name,String comment,String data,Integer roleId){
        String[] menusId = data.split("a");
        System.out.println(name);
        Role role = new Role();
        role.setId(roleId);
        role.setName(name);
        role.setComment(comment);
        return roleService.updateRole(role,menusId);
    }

    @ResponseBody
    @RequestMapping("/insertRole")
    public  Object insertRole(String name,String comment,String data){
        String[] menusId = data.split("a");
        Role role = new Role();
        role.setName(name);
        role.setComment(comment);
        return roleService.insertRole(role,menusId);
    }

    @ResponseBody
    @RequestMapping("deleteRole")
    public Object deleteRole(Integer id){
        return roleService.deleteRole(id);
    }

}
