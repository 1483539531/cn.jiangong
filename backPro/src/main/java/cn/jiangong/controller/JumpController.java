package cn.jiangong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JumpController {

    //首页欢迎页
    @RequestMapping("welcomePage")
    public String welcomePage(){
        return "welcome";
    }

    @RequestMapping("loginPage")
    public String loginPage(){
        return "login";
    }


    //管理员管理页面-------------------------------------------

    //菜单子页面
    @RequestMapping("adminMenuPage")
    public String adminRulePage(){
        return "admin/admin-menu";
    }

    @RequestMapping("adminMenuEditPage")
    public String adminRuleEditPage(){
        return "admin/admin-menu-edit";
    }

    //管理员子页面
    @RequestMapping("adminListPage")
    public String adminListPage(){
        return "admin/admin-list";
    }

    @RequestMapping("adminEditPage")
    public String adminEditPage(){
        return "admin/admin-edit";
    }

    @RequestMapping("adminAddPage")
    public String adminAddPage(){
        return "admin/admin-add";
    }

    //角色子页面
    @RequestMapping("adminRolePage")
    public String adminRolePage(){
        return "admin/admin-role";
    }

    @RequestMapping("adminRoleEditPage")
    public String  adminRoleEditPage(){
        return "admin/role-edit";
    }

    @RequestMapping("roleAddPage")
    public String  roleAddPage(){
        return "admin/role-add";
    }



    //分类管理页面-------------------------------------------
    @RequestMapping("categoryPage")
    public String categoryPage(){
        return "category";
    }



}
