package cn.jiangong.controller;

import cn.jiangong.entity.BackUser;
import cn.jiangong.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserServiceImpl userService;


    @RequestMapping("/login")
    public String login(String zhanghao,String password){
        System.out.println(zhanghao);
        System.out.println(password);
        List<BackUser> backUsers = userService.selectUserList(zhanghao, password);
        if(backUsers.isEmpty()){
            return "login";
        }
        return "index";
    }

}
