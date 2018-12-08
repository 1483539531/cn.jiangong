package cn.jiangong.mapper;

import cn.jiangong.entity.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MemberMapper {


    List<User> selectUserList(@Param("startDate") String startDate,@Param("endDate") String endDate,@Param("user") User user);

    User selectUser(@Param("id") Integer id,@Param("isCompony") Integer isCompony);

    @Select("select uname,password from user where id = #{id}")
    User selectUserPass(String id);

    @Select("select count(1) from company where userid = #{id}")
    Integer existsCompony(Integer id);


    boolean updateUser(User user);

    boolean updatePass(User user);

    @Delete("delete from user where id = #{id}")
    boolean deleteUser(Integer id);

}
