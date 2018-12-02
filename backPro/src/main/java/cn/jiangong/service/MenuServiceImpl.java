package cn.jiangong.service;

import cn.jiangong.entity.Menu;
import cn.jiangong.mapper.MenuMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl {

    @Autowired
    MenuMapper menuMapper;

   public List<Menu> selectFewMenuList(String parentId){
            return menuMapper.selectFewMenuList(parentId);
    }

    public PageInfo<Menu> selectManyMenuList(String parentId,Integer page,Integer limit){
        PageHelper.startPage(page,limit);
        List<Menu> menus = menuMapper.selectManyMenuList(parentId);
        PageInfo<Menu> pageInfo = new PageInfo<Menu>(menus);
        return pageInfo;
    }

    public List<Menu> selectEveryMenuList(String roleId){
        List<Menu> menus = menuMapper.selectManyMenuList("0");
        for (Menu menu : menus) {
            List<Menu> twoMenus = menuMapper.selectManyMenuList(String.valueOf(menu.getId()));
            List<Menu> roleMenus = menuMapper.roleSelectMenuList(roleId,String.valueOf(menu.getId()));
            for (Menu menu1 : twoMenus) {
                for (Menu roleMenu : roleMenus) {
                    if(menu1.getName().equals(roleMenu.getName())){
                        menu1.setCheck(true);
                    }
                }
            }
            menu.setChildren(twoMenus);
        }
        return menus;
    }




    public boolean insertMenu(String name,String parentId){
        return menuMapper.insertMenu(name,parentId);
    }


    public boolean updateMenu(String id,String url){
        return menuMapper.updateMenu(id,url);
    }

    public boolean deleteMenu(String id){
        return menuMapper.deleteMenu(id);
    }

}
