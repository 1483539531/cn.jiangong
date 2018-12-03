package cn.jiangong.mapper;

import cn.jiangong.entity.BackUser;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserMapper {


     BackUser login(String zhanghao, String password);


     @Select("select * from backuser where id = #{id}")
     BackUser selectBackUser(Integer id);

     List<BackUser> selectBackUserList(
            @Param("startdate") String startdate, @Param("enddate") String enddate,@Param("name") String name);

     boolean updateBackUserState(
             @Param("state") Integer state,@Param("id") String id);

     @Update("update backUser set zhanghao = #{zhanghao},password = #{password}")
     boolean updateBackUser(@Param("zhanghao") String zhanghao,@Param("password") String password);

     @Update("UPDATE backuser SET logindate = NOW() where id = #{id}")
     public boolean updateLoginDate(String id);

     @Select("select menu_id roleId  from user_privilege where user_id = #{id}")
     BackUser selectRoleId(String id);

     boolean insertBackUser(BackUser backUser);



}
