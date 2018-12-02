package cn.jiangong.mapper;

import cn.jiangong.entity.Menu;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface MenuMapper {

    List<Menu> selectFewMenuList(String parentId);


    List<Menu> selectManyMenuList(String parentId);

    List<Menu> roleSelectMenuList(
            @Param("roleId") String roleId,@Param("parentId") String parentId);


    boolean insertMenu(
            @Param("name") String name,@Param("parentId") String parentId);



    @Update("update menu set url = #{url} where id = #{id}")
    boolean updateMenu(
            @Param("id")String id,@Param("url")String url);


    @Delete("delete from menu where id = #{id}")
    boolean deleteMenu(String id);

}
