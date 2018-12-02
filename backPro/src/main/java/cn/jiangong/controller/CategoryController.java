package cn.jiangong.controller;


import cn.jiangong.entity.Categorys;
import cn.jiangong.service.CategorysServiceImpl;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@Controller
@RequestMapping("category")
public class CategoryController {

    @Autowired
    CategorysServiceImpl categorysService;




    @ResponseBody
    @RequestMapping("/SelectCategorysList")
    public Object SelectCategorysList(String parentId,String type, HttpServletRequest request,Integer page,Integer limit){
        if(page == null){
            page = 1;
            limit = 1000;
        }
        PageInfo<Categorys> categorysPageInfo = categorysService.SelectCategorysList(parentId, type,page,limit);
        HashMap<String,Object> hashMap = new  HashMap<String,Object>();
        hashMap.put("code",0);
        hashMap.put("msg","");
        hashMap.put("count",categorysPageInfo.getTotal());
        hashMap.put("data",categorysPageInfo.getList());
        return JSON.toJSONString(hashMap);
    }






    @ResponseBody
    @RequestMapping("addCategory")
    public Object addCategory(String name,String parentId,String type){
        boolean result = categorysService.addCategory(name,parentId,type);
        return result;
    }

    @ResponseBody
    @RequestMapping("updateCategory")
    public Object updateCategory(String name,String id){
        boolean result = categorysService.updateCategory(name,id);
        return result;
    }

    @ResponseBody
    @RequestMapping("deleteCategory")
    public Object deleteCategory(String id){
        boolean result = categorysService.deleteCategory(id);
        return result;
    }




}
