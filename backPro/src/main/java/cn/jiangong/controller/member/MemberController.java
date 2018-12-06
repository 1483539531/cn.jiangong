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



}
