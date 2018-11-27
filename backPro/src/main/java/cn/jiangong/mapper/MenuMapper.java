package cn.jiangong.mapper;

import cn.jiangong.entity.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {

        boolean insertMenu(
                @Param("name") String name,@Param("parentId") String parentId);

    /**
     * 查询菜单页面   下拉菜单的  菜单列表
     * @param parentId
     * @return
     */
    List<Menu> selectOptionMenuList(String parentId);

    /**
     * 查询菜单页面  列表的   菜单列表
     * @param parentId
     * @return
     */
    List<Menu> selectListMenuList(String parentId);

}
