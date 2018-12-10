package cn.jiangong.controller;

import cn.jiangong.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class TestController {
    @Autowired
    UserServiceImpl userService;




}
