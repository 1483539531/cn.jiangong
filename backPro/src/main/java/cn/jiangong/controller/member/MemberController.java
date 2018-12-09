package cn.jiangong.controller.member;

import cn.jiangong.entity.User;
import cn.jiangong.service.MemberService;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequestMapping("/member")
public class MemberController {


    @Autowired
    MemberService memberService;


    @ResponseBody
    @RequestMapping("/selectUserList")
    public Object selectUserList(Integer page, Integer limit,String startDate,String endDate, User user){
        System.out.println(startDate);
        System.out.println(endDate);
        System.out.println(user);
        PageInfo<User> pageInfo = memberService.selectUserList(page, limit, startDate, endDate, user);
        HashMap<String,Object> hashMap = new HashMap<String, Object>();
        hashMap.put("code",0);
        hashMap.put("msg","");
        hashMap.put("count",pageInfo.getTotal());
        hashMap.put("data",pageInfo.getList());
        return JSON.toJSONString(hashMap);
    }

    @ResponseBody
    @RequestMapping("/selectUser")
    public Object selectUser(Integer id){
        User user = memberService.selectUser(id);
        return JSON.toJSONString(user);
    }


    @ResponseBody
    @RequestMapping("/selectUserPass")
    public Object selectUserPass(String id){
        User user = memberService.selectUserPass(id);
        return JSON.toJSONString(user);
    }

    @ResponseBody
    @RequestMapping("/updatePass")
    public Object updatePass(User user){
        return memberService.updatePass(user);
    }

    @ResponseBody
    @RequestMapping("/updateUser")
    public Object updateUser(User user){
        boolean b = memberService.updateUser(user);
        return b;
    }


    @ResponseBody
    @RequestMapping("/deleteUser")
    public Object deleteUser(Integer id){
        return memberService.deleteUser(id);
    }


  @ResponseBody
    @RequestMapping("/insertUser")
    public Object insertUser(User user){
        return memberService.insertUser(user);
    }



}
