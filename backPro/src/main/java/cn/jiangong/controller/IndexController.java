package cn.jiangong.controller;

import cn.jiangong.entity.BackUser;
import cn.jiangong.service.MenuServiceImpl;
import cn.jiangong.service.UserServiceImpl;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("index")
public class IndexController {

    @Autowired
    MenuServiceImpl menuService;

    @Autowired
    UserServiceImpl userService1;



    @ResponseBody
    @RequestMapping("/idSelectEveryMenuList")
    public Object selectEveryMenuList_id( HttpServletRequest request){
        BackUser backUser = (BackUser) request.getSession().getAttribute("user");
        BackUser user = userService1.selectRoleId(String.valueOf(backUser.getId()));
        return JSON.toJSONString(menuService.selectCheckMenuList(user.getRoleId()));
    }


}
