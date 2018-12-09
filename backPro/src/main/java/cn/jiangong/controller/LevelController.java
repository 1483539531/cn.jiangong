package cn.jiangong.controller;

import cn.jiangong.entity.Dictionary;
import cn.jiangong.service.LevelServiceImpl;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;


@RequestMapping("/memberLevel")
@RestController
public class LevelController {

    @Autowired
    LevelServiceImpl levelService;


    @RequestMapping("/selectList")
    public Object selectList(String cid){
        HashMap<String,Object> hashMap = new HashMap<String,Object>();
        hashMap.put("code",0);
        hashMap.put("msg","");
        hashMap.put("data",levelService.selectList(cid));
        return JSON.toJSONString(hashMap);
    }

    @RequestMapping("updateLevel")
   public boolean updateLevel(Dictionary dictionary){
       System.out.println(dictionary);
        return levelService.updateLevel(dictionary);
   }


}
