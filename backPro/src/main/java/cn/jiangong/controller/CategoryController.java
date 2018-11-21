package cn.jiangong.controller;


import cn.jiangong.entity.Categorys;
import cn.jiangong.service.CategorysServiceImpl;
import com.alibaba.fastjson.JSON;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
public class CategoryController {

    @Autowired
    CategorysServiceImpl categorysService;



    @ResponseBody
    @RequestMapping("category")
    public Object category(String parentId,HttpServletRequest request){
        List<Categorys> categorys = categorysService.parentIdSelectCategorysList(parentId);
        HashMap<String,Object> hashMap = new  HashMap<String,Object>();
        hashMap.put("code",0);
        hashMap.put("msg","");
        hashMap.put("count",categorys.size());
        hashMap.put("data",categorys);
        return JSON.toJSONString(hashMap);
    }



}
