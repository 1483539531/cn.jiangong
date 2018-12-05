package cn.jiangong.controller.zhaobiao;


import cn.jiangong.entity.Zhaobiao;
import cn.jiangong.service.ZhaobiaoServiceImpl;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@Controller
@RequestMapping("zhaobiao")
public class ZhaobiaoController {

    @Autowired
    ZhaobiaoServiceImpl zhaobiaoService;


    @ResponseBody
    @RequestMapping("selectZhaobiaoList")
    public Object selectZhaobiaoList(Integer page,Integer limit,Zhaobiao zhaobiao,String startdate,String enddate){
        System.out.println(zhaobiao+"----");
        System.out.println(startdate);
        PageInfo<Zhaobiao> pageInfo = zhaobiaoService.selectZhaobiaoList(page, limit,zhaobiao,startdate,enddate);
        HashMap<String,Object> hashMap = new  HashMap<String,Object>();
        hashMap.put("code",0);
        hashMap.put("msg","");
        hashMap.put("count",pageInfo.getTotal());
        hashMap.put("data",pageInfo.getList());
        return JSON.toJSONStringWithDateFormat(hashMap,"yyyy-MM-dd HH:mm:ss");
    }

    @ResponseBody
    @RequestMapping("selectNumber")
    public Object selectNumber(){
            return JSON.toJSONString(zhaobiaoService.selectNumber());
    }


    @ResponseBody
    @RequestMapping("selectZhaobiaoListToId")
    public Object selectZhaobiaoListToId(String id){
        return JSON.toJSONString(zhaobiaoService.selectZhaobiaoListToId(id));
    }

    @ResponseBody
    @RequestMapping("updateState")
    public Object updateState(String state,String id){
        return zhaobiaoService.updateState(state,id);
    }
}
