package cn.jiangong.service;

import cn.jiangong.entity.Dictionary;
import cn.jiangong.mapper.LevelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LevelServiceImpl {

    @Autowired
    LevelMapper levelMapper;

    public List<Dictionary> selectList(String cid){
        System.out.println(cid+"service");
        return levelMapper.selectList(cid);
    }

    public boolean updateLevel(Dictionary dictionary){
        return levelMapper.updateLevel(dictionary);
    }
}
