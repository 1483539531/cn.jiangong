package cn.jiangong.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface RoleMenuMapper {


    boolean insert(@Param("roleId") Integer roleId,@Param("menuId") String menuId);

    @Delete("delete from role_menu where role_id = #{roleId}")
    boolean delete(Integer roleId);

}
