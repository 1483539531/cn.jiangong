package cn.jiangong.service;

import cn.jiangong.entity.Zhaobiao;
import cn.jiangong.mapper.ZhaobiaoMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ZhaobiaoServiceImpl {

    @Autowired
    ZhaobiaoMapper zhaobiaoMapper;

    public PageInfo<Zhaobiao> selectZhaobiaoList(Integer page, Integer limit,Zhaobiao zhaobiao,String startdate,String enddate){
        PageHelper.startPage(page,limit);
        List<Zhaobiao> zhaobiaos = zhaobiaoMapper.selectZhaobiaoList(zhaobiao,startdate,enddate);
        PageInfo<Zhaobiao> pageInfo = new  PageInfo<Zhaobiao>(zhaobiaos);
        return pageInfo;
    }

    public List<Zhaobiao> selectZhaobiaoListToId(String id){
        return zhaobiaoMapper.selectZhaobiaoListToId(id);
    }

    public List<Zhaobiao> selectNumber(){
        return zhaobiaoMapper.selectNumber();
    }

    public boolean updateState(String zhuangtai,String id){
        Integer stateNumber;
        if(zhuangtai.equals("true")){
            stateNumber = 3;
        }else{
            stateNumber = 2;
        }
        return zhaobiaoMapper.updateState(stateNumber,id);
    }

}
