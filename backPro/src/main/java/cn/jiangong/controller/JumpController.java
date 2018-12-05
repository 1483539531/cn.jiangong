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


















    //招标管理------------------------------------------------
    @RequestMapping("zhaobiaoListPage")
    public String zhaobiaoListPage(){
        return "zhaobiao/zhaobiao-list";
    }

    @RequestMapping("zhaobiaoDelPage")
    public String zhaobiaoDelPage(){
        return "zhaobiao/zhaobiao-del";
    }

    @RequestMapping("zhaobiaoEditPage")
    public String zhaobiaoEditPage(){
        return "zhaobiao/zhaobiao-edit";
    }

    @RequestMapping("zhaobiaoAddPage")
    public String zhaobiaoAddPage(){
        return "zhaobiao/zhaobiao-add";
    }

    @RequestMapping("zhaobiaoListXiangxiPage")
    public String zhaobiaoListXiangxiPage(){
        return "zhaobiao/zhaobiao-list-xiangxi";
    }





    //产品管理------------------------------------------------

    //产品列表
    @RequestMapping("recruiterListPage")
    public String recruiterListPage(){
        return "chanpin/recruiterList";
    }









    //轮播管理------------------------------------------------

    //轮播列表
    @RequestMapping("bannerListPage")
    public String bannerListPage(){
        return "banner/banner-list";
    }

    @RequestMapping("bannerAddPage")
    public String bannerAddPage(){
        return "banner/banner-add";
    }

    @RequestMapping("bannerEditPage")
    public String bannerEditPage(){
        return "banner/banner-edit";
    }




    //分类管理页面-------------------------------------------
    @RequestMapping("categoryPage")
    public String categoryPage(){
        return "category/category";
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

    //会员列表
    @RequestMapping("memberListPage")
    public String memberListPage(){
        return "member/member-list";
    }
    //删除会员
    @RequestMapping("memberDelPage")
    public String memberDelPage(){
        return "member/member-del";
    }
    //等级管理
    @RequestMapping("memberLevelPage")
    public String memberLevelPage(){
        return "member/member-level";
    }
    //积分管理
    @RequestMapping("memberKissPage")
    public String memberKissPage(){
        return "member/member-kiss";
    }
    //浏览记录
    @RequestMapping("memberViewPage")
    public String memberViewPage(){
        return "member/member-view";
    }

    @RequestMapping("memberAddPage")
    public String memberAddPage(){
        return "member/member-add";
    }

    @RequestMapping("memberShowPage")
    public String memberShowPage(){
        return "member/member-show";
    }

    @RequestMapping("memberPasswordPage")
    public String memberPasswordPage(){
        return "member/member-password";
    }

    @RequestMapping("memberEditPage")
    public String memberEditPage(){
        return "member/member-edit";
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











    //系统统计页面-------------------------------------------


    //拆线图
    @RequestMapping("echarts1Page")
    public String  echarts1Page(){
        return "echarts/echarts1";
    }
    //柱状图
    @RequestMapping("echarts2Page")
    public String  echarts2Page(){
        return "echarts/echarts2";
    }
    //地图
    @RequestMapping("echarts3Page")
    public String  echarts3Page(){
        return "echarts/echarts3";
    }
    // 饼图
    @RequestMapping("echarts4Page")
    public String  echarts4Page(){
        return "echarts/echarts4";
    }
    //雷达图
    @RequestMapping("echarts1Page5")
    public String  echarts5Page(){
        return "echarts/echarts5";
    }
    //k线图
    @RequestMapping("echarts6Page")
    public String  echarts6Page(){
        return "echarts/echarts6";
    }
    //热力图
    @RequestMapping("echarts7Page")
    public String  echarts7Page(){
        return "echarts/echarts7";
    }
    //仪表图
    @RequestMapping("echarts8Page")
    public String  echarts8Page(){
        return "echarts/echarts8";
    }













    //系统设置--------------------------------------------------------

    //系统设置
    @RequestMapping("sysSetPage")
    public String  sysSetPage(){
        return "sys/sys-set";
    }
    //数字字典
    @RequestMapping("sysDataPage")
    public String  sysDataPage(){
        return "sys/ sys-data";
    }
    //屏蔽词
    @RequestMapping("sysShieldPage")
    public String  sysShieldPage(){
        return "sys/sys-shield";
    }
    //系统日志
    @RequestMapping("sysLogPage")
    public String  sysLogPage(){
        return "sys/sys-log";
    }
    //友情连接
    @RequestMapping("sysLinkPage")
    public String  sysLinkPage(){
        return "sys/sys-link";
    }
    //第三方登陆
    @RequestMapping("sysQQPage")
    public String  sysQQPage(){
        return "sys/sys-qq";
    }



}
