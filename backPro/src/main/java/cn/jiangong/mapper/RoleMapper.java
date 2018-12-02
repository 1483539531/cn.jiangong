package cn.jiangong.mapper;

import cn.jiangong.entity.Role;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface RoleMapper {

    List<Role> selectRoleList();



    @Update("update role set name = #{name},comment = #{comment} where id = #{id}")
    boolean updateRole(Role role);


}
