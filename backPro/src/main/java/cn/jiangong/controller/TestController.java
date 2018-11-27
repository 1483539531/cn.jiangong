package cn.jiangong.controller;

import cn.jiangong.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class TestController {


    @RequestMapping("index")
    public String kk(){
        System.out.println("jinru index");
        return "index";
    }




}
