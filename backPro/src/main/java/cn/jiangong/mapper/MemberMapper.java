package cn.jiangong.mapper;

import cn.jiangong.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MemberMapper {


    List<User> selectUserList(String startDate,String endDate,User user);

    User selectUser(@Param("id") Integer id,@Param("isCompony") Integer isCompony);

    @Select("select count(1) from user where id = #{id}")
    Integer existsCompony(Integer id);

}
