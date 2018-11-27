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

   public List<Menu> selectOptionMenuList(String parentId){
            return menuMapper.selectOptionMenuList(parentId);
    }

    public PageInfo<Menu> selectListMenuList(String parentId,Integer page,Integer limit){
        PageHelper.startPage(page,limit);
        List<Menu> menus = menuMapper.selectListMenuList(parentId);
        PageInfo<Menu> pageInfo = new PageInfo<Menu>(menus);
        return pageInfo;
    }

    public boolean insertMenu(String name,String parentId){
       return menuMapper.insertMenu(name,parentId);
    }


}
