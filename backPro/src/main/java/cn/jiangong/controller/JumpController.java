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

    @RequestMapping("indexPage")
    public String indexPage(){
        return "shouye";
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





    //问题管理------------------------------------------------
    @RequestMapping("questionListPage")
    public String questionListPage(){
        return "question/question-list";
    }

    @RequestMapping("questionDelPage")
    public String questionDelPage(){
        return "question/question-del";
    }

    @RequestMapping("questionEditPage")
    public String questionEditPage(){
        return "question/question-edit";
    }

    @RequestMapping("questionAddPage")
    public String questionAddPage(){
        return "question/question-add";
    }



    //评论管理------------------------------------------------

    //评论列表
    @RequestMapping("commentListPage")
    public String commentListPage(){
        return "pinglun/comment-list";
    }

    //列表反馈
    @RequestMapping("feedbackListPage")
    public String feedbackListPage(){
        return "pinglun/feedback-list";
    }

    @RequestMapping("feedbackEditPage")
    public String feedbackEditPage(){
        return "pinglun/feedback-edit";
    }


    //会员管理------------------------------------------------


}
