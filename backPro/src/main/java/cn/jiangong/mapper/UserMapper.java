package cn.jiangong.mapper;

import cn.jiangong.entity.BackUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {


     BackUser login(String zhanghao, String password);

     List<BackUser> selectUserList(
            @Param("startdate") String startdate, @Param("enddate") String enddate,@Param("name") String name);

     boolean updateBackUserState(
             @Param("state") Integer state,@Param("id") String id);


}
