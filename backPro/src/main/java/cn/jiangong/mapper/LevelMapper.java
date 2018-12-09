package cn.jiangong.mapper;

import cn.jiangong.entity.Dictionary;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LevelMapper {


     List<Dictionary> selectList(@Param("cid") String cid);


    boolean updateLevel(Dictionary dictionary);

}
