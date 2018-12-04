package cn.jiangong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {


    @RequestMapping("index")
    public String kk(){
        System.out.println("jinru index");
        return "shouye";
    }




}
