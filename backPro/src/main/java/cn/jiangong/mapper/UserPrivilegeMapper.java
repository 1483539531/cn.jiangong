package cn.jiangong.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface UserPrivilegeMapper {

    @Delete("delete from user_privilege where user_id = #{userId}")
    boolean delete(Integer userId);


    boolean insert(@Param("userId") Integer userId,@Param("roleId") Integer roleId);
}
